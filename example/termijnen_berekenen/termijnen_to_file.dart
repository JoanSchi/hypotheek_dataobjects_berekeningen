import 'dart:io';
import 'package:hypotheek_dataobjects_berekeningen/gereedschap/kalender.dart';
import 'package:hypotheek_dataobjects_berekeningen/hypotheek/gegevens/hypotheek/hypotheek.dart';
import 'package:hypotheek_dataobjects_berekeningen/hypotheek/gegevens/lening_aanpassen/lening_aanpassen.dart';
import 'package:hypotheek_dataobjects_berekeningen/hypotheek/gegevens/rente_vanaf_periode/rente_vanaf_periode.dart';
import 'package:hypotheek_dataobjects_berekeningen/hypotheek/gegevens/termijn/termijn.dart';
import 'package:hypotheek_dataobjects_berekeningen/hypotheek/uitwerken/hypotheek_termijnen.dart';
import 'package:intl/intl.dart';

class WriteToFile {
  static void writeHypotheekTermijnen(
      {required String path,
      required String fileName,
      required String naam,
      required HypotheekTermijnen hypotheekTermijnen,
      bool append = false}) {
    final nf = NumberFormat('#0.00');
    final df = DateFormat('dd/MM/yyyy');

    final buffer = StringBuffer();

    String hypotheekVorm;

    switch (hypotheekTermijnen.hypotheekVorm) {
      case HypotheekVorm.aflosvrij:
        hypotheekVorm = 'aflosvrij';
        break;
      case HypotheekVorm.lineair:
        hypotheekVorm = 'linear';
        break;
      case HypotheekVorm.annuiteit:
        hypotheekVorm = 'annuity';
        break;
    }

    buffer.writeln('${append ? '\n\n\n\n' : '\n'}'
        '$naam\n'
        '\n'
        'Parameters:\n'
        '\n'
        'StartDatum,${df.format(hypotheekTermijnen.startDatum)}\n'
        'Hoofdsom,${nf.format(hypotheekTermijnen.hoofdsom)}\n'
        'Datumlening,${df.format(hypotheekTermijnen.datumLening)}\n'
        'Lening,${nf.format(hypotheekTermijnen.initieleLening)}\n'
        'Hypotheekvorm,$hypotheekVorm\n'
        'Aflostermijn,${hypotheekTermijnen.aflosTermijnInMaanden}\n'
        'Periode,${hypotheekTermijnen.periodeInMaanden}\n'
        'Per mnd,${hypotheekTermijnen.perMaand}\n'
        'Gebroken alleen rente,${hypotheekTermijnen.eersteGebrokenMaandAlleenRente}\n'
        'Boetevrij (%), ${hypotheekTermijnen.boeteVrijAflossenPercentage}\n');

    buffer.writeln('Periode, Rente (%)\n'
        'Aanvang, ${hypotheekTermijnen.aanvangRente}');

    for (RenteVanafPeriode rvp in hypotheekTermijnen.renteVanafPeriode) {
      buffer.writeln('${rvp.periode}, ${rvp.rente}');
    }
    buffer.writeln('');

    final leningAanpassen = [
      ...hypotheekTermijnen.extraAflossen,
      ...hypotheekTermijnen.extraLenen
    ];

    if (leningAanpassen.isNotEmpty) {
      buffer.writeln('Aanpassingen:\n');

      for (LeningAanpassen e in leningAanpassen) {
        e.when(termijnen:
            (datum, leningAanpassenOpties, bedrag, aantal, intervalInMaanden) {
          buffer.writeln('Datum,${df.format(datum)}\n'
              'Optie,${leningAanpassenOpties == LeningAanpassenOpties.aflossen ? 'aflossen' : 'lenen'}\n'
              'Bedrag,$bedrag\n'
              'aantal,$aantal\n');
        }, eenmalig: (datum, leningAanpassenOpties, bedrag) {
          buffer.writeln('Datum,${df.format(datum)}\n'
              'Optie,${leningAanpassenOpties == LeningAanpassenOpties.aflossen ? 'aflossen' : 'lenen'}\n'
              'Bedrag,$bedrag\n');
        });
      }

      buffer.writeln('');
    }

    // write to file
    buffer.writeln(','
        'Periode,'
        'P. Start,'
        'P. Eind,'
        'T. Start,'
        'T. Eind,'
        'Rente (%),'
        '-> %,'
        'Lening,'
        'RenteBedrag,'
        'Aflossen,'
        'Totaal,'
        'E.Afl.,'
        'E.Lenen,'
        'Laatste P.,');

    DateTime vorige = hypotheekTermijnen.startDatum;
    int periode = -2;

    for (Termijn termijn in hypotheekTermijnen.termijnen) {
      // user input name

      if (periode != -2 &&
          Kalender.verschilDagen(vorige, termijn.startDatum) > 1) {
        buffer.writeln('*,'
            '${termijn.periode},'
            '${df.format(termijn.startPeriode)},'
            '${df.format(termijn.eindPeriode)},'
            '${df.format(vorige.add(const Duration(days: 1)))},'
            '${df.format(termijn.startDatum.add(const Duration(days: -1)))},'
            '${termijn.rente},'
            '${termijn.periodesTotVolgendeRente},'
            '${nf.format(termijn.lening)},'
            ','
            ','
            ','
            ','
            ','
            'false');
      }

      bool afwijking =
          termijn.startPeriode.compareTo(termijn.startDatum) != 0 ||
              termijn.eindPeriode.compareTo(termijn.eindDatum) != 0 ||
              termijn.extraAflossen > 0.0 ||
              termijn.extraLenen > 0.0;

      buffer.writeln('${afwijking ? '>' : ''},'
          '${termijn.periode},'
          '${df.format(termijn.startPeriode)},'
          '${df.format(termijn.eindPeriode)},'
          '${df.format(termijn.startDatum)},'
          '${df.format(termijn.eindDatum)},'
          '${termijn.rente},'
          '${termijn.periodesTotVolgendeRente},'
          '${nf.format(termijn.lening)},'
          '${nf.format(termijn.renteBedrag)},'
          '${nf.format(termijn.aflossen)},'
          ' ${nf.format(termijn.renteBedrag + termijn.aflossen)},'
          '${nf.format(termijn.extraAflossen)},'
          '${nf.format(termijn.extraLenen)},'
          '${termijn.laatsteVanPeriode},');

      periode = termijn.periode;
      vorige = termijn.eindDatum;
    }

    File file = File("$path/$fileName.csv");

    file.writeAsStringSync(buffer.toString(),
        mode: append ? FileMode.append : FileMode.write);

    print("Congratulations!! CSV file written successfully.");
  }
}
