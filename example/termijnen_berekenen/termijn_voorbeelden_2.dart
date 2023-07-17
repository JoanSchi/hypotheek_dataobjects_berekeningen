import 'package:hypotheek_dataobjects_berekeningen/hypotheek/gegevens/hypotheek/hypotheek.dart';
import 'package:hypotheek_dataobjects_berekeningen/hypotheek/gegevens/lening_aanpassen/lening_aanpassen.dart';
import 'package:hypotheek_dataobjects_berekeningen/hypotheek/gegevens/rente_vanaf_periode/rente_vanaf_periode.dart';
import 'package:hypotheek_dataobjects_berekeningen/hypotheek/uitwerken/hypotheek_termijnen.dart';

import 'termijnen_to_file.dart';

class TermijnVoorbeelden2 {
  static void termijnVoorbeelden2({required String path}) {
    ///
    ///
    ///
    ///
    ///

    const fileName = 'Termijn Voorbeelden 2';

    final extraAflossen = [
      LeningAanpassen.termijnen(
          bedrag: 20000,
          datum: DateTime(2024, 1, 15),
          intervalInMaanden: 12,
          aantal: 4),
      LeningAanpassen.termijnen(
          bedrag: 2000,
          datum: DateTime(2044, 1, 1),
          intervalInMaanden: 6,
          aantal: 3),
      LeningAanpassen.eenmalig(
        bedrag: 2000,
        datum: DateTime(2045, 1, 1),
      ),
      LeningAanpassen.eenmalig(
        bedrag: 18000,
        datum: DateTime(2043, 2, 10),
      ),
      LeningAanpassen.eenmalig(
        bedrag: 18800,
        datum: DateTime(2043, 9, 10),
      )
    ];
    final extraLenen = [
      LeningAanpassen.eenmalig(
          datum: DateTime(2025, 1, 15),
          bedrag: 18800,
          leningAanpassenOpties: LeningAanpassenOpties.verhogen),
      LeningAanpassen.eenmalig(
          datum: DateTime(2025, 6, 1),
          bedrag: 20000,
          leningAanpassenOpties: LeningAanpassenOpties.verhogen),
    ];

    bool eersteGebrokenMaandAlleenRente = false;
    bool perMaand = false;

    final renteVanafPeriode = [
      const RenteVanafPeriode(rente: 3.0, periode: 120),
      const RenteVanafPeriode(rente: 2.5, periode: 240),
      const RenteVanafPeriode(rente: 2.7, periode: 241)
    ];

    /// Lineair 30 jaar
    ///
    ///
    ///

    HypotheekTermijnen t = HypotheekTermijnen(
        hoofdsom: 188000,
        rente: 4.1,
        startDatum: DateTime(2023, 4, 10),
        datumLening: DateTime(2023, 4, 10),
        hypotheekVorm: HypotheekVorm.lineair,
        aflosTermijnInMaanden: 360,
        periodeInMaanden: 360,
        eersteGebrokenMaandAlleenRente: eersteGebrokenMaandAlleenRente,
        perMaand: perMaand,
        extraAflossen: extraAflossen,
        extraLenen: extraLenen,
        renteVanafPeriode: renteVanafPeriode);
    t.termijnenAanmaken();

    WriteToFile.writeHypotheekTermijnen(
        path: path, fileName: fileName, naam: 'Lineair', hypotheekTermijnen: t);

    /// Lineair na 240
    ///
    ///
    ///

    final double tussenLening = t.termijnen
        .firstWhere((element) =>
            element.startDatum.compareTo(DateTime(2043, 4, 10)) == 0)
        .lening;

    t = HypotheekTermijnen(
        hoofdsom: 188000,
        lening: tussenLening,
        rente: 4.1,
        startDatum: DateTime(2043, 4, 10),
        datumLening: DateTime(2043, 4, 10),
        hypotheekVorm: HypotheekVorm.lineair,
        aflosTermijnInMaanden: 120,
        periodeInMaanden: 120,
        eersteGebrokenMaandAlleenRente: eersteGebrokenMaandAlleenRente,
        perMaand: perMaand,
        extraAflossen: extraAflossen,
        extraLenen: extraLenen,
        renteVanafPeriode: renteVanafPeriode);
    t.termijnenAanmaken();

    WriteToFile.writeHypotheekTermijnen(
        path: path,
        fileName: fileName,
        naam: 'Lineair na 240',
        hypotheekTermijnen: t,
        append: true);

    /// Lineair oppikken op 240 mnd
    ///
    ///
    ///

    t = HypotheekTermijnen(
        hoofdsom: 188000,
        lening: tussenLening,
        rente: 4.1,
        startDatum: DateTime(2023, 4, 10),
        datumLening: DateTime(2043, 4, 10),
        hypotheekVorm: HypotheekVorm.lineair,
        aflosTermijnInMaanden: 360,
        periodeInMaanden: 360,
        eersteGebrokenMaandAlleenRente: eersteGebrokenMaandAlleenRente,
        perMaand: perMaand,
        extraAflossen: extraAflossen,
        extraLenen: extraLenen,
        renteVanafPeriode: renteVanafPeriode);

    t.termijnenAanmaken();

    WriteToFile.writeHypotheekTermijnen(
        path: path,
        fileName: fileName,
        naam: 'Lineair oppikken op 240 mnd',
        hypotheekTermijnen: t,
        append: true);

    /// Lineair 30 jaar
    ///
    ///
    ///

    t = HypotheekTermijnen(
        hoofdsom: 188000,
        rente: 4.1,
        startDatum: DateTime(2023, 4, 10),
        datumLening: DateTime(2023, 4, 10),
        hypotheekVorm: HypotheekVorm.lineair,
        aflosTermijnInMaanden: 360,
        periodeInMaanden: 360,
        eersteGebrokenMaandAlleenRente: eersteGebrokenMaandAlleenRente,
        perMaand: perMaand,
        extraAflossen: extraAflossen,
        extraLenen: extraLenen,
        renteVanafPeriode: [
          const RenteVanafPeriode(rente: 4.0, periode: 0),
          const RenteVanafPeriode(rente: 3.0, periode: 120),
          const RenteVanafPeriode(rente: 2.5, periode: 240),
          const RenteVanafPeriode(rente: 2.7, periode: 241)
        ]);
    t.termijnenAanmaken();

    WriteToFile.writeHypotheekTermijnen(
        path: path,
        fileName: fileName,
        naam: 'Lineair Per maand',
        hypotheekTermijnen: t,
        append: true);
  }
}
