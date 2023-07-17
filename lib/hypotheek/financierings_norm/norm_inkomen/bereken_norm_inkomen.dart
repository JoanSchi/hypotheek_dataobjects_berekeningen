import 'dart:math' as math;

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import '../../../gereedschap/kalender.dart';
import '../../../inkomen/gegevens/inkomen.dart';
import '../../../schulden/gegevens/schulden.dart';
import '../../gegevens/hypotheek/hypotheek.dart';
import '../../gegevens/hypotheek_dossier/hypotheek_dossier.dart';
import '../../gegevens/norm/norm.dart';
import '../../gegevens/norm/norm_inkomen/inkomens_op_datum.dart';
import '../../gegevens/rente_vanaf_periode/rente_vanaf_periode.dart';
import '../../gegevens/status_lening/status_lening.dart';
import '../../uitwerken/hypotheek_verwerken.dart';
import 'financierings_last_tabel.dart';
import 'vind_schulden_op_datum.dart';

class BerekenNormInkomen {
  BerekenNormInkomen.hypotheek(
      {required this.hypotheekDossier,
      required this.hypotheek,
      required this.inkomensOpDatum,
      required this.schulden,
      List<DateTime>? datums})
      : hypotheekVorm = hypotheek.hypotheekvorm,
        startDatum = hypotheek.startDatum,
        rente = hypotheek.rente,
        renteVanafPeriode = hypotheek.renteVanafPeriode,
        periodeInMaanden = hypotheek.periodeInMaanden,
        aflosTermijnInMaanden = hypotheek.aflosTermijnInMaanden,
        perMaand = hypotheek.periodePerMaand,
        ewr = hypotheekDossier.ewr,
        datums = datums ?? [hypotheek.startDatum];

  BerekenNormInkomen({
    required this.hypotheekDossier,
    required this.hypotheek,
    required this.inkomensOpDatum,
    required this.schulden,
    required this.hypotheekVorm,
    required this.startDatum,
    required this.rente,
    required this.renteVanafPeriode,
    required this.periodeInMaanden,
    required this.aflosTermijnInMaanden,
    required this.ewr,
    required this.perMaand,
    required this.datums,
  });

  HypotheekDossier hypotheekDossier;
  Hypotheek hypotheek;
  List<InkomenOpDatum> inkomensOpDatum;
  IList<Schuld> schulden;

  HypotheekVorm hypotheekVorm;
  DateTime startDatum;
  double rente;
  IList<RenteVanafPeriode> renteVanafPeriode;
  int periodeInMaanden;
  int aflosTermijnInMaanden;
  double ewr;
  bool perMaand;
  List<DateTime> datums;
  Map<DateTime, NormInkomen> normenOpDatum = {};

  (HypotheekDossier, Hypotheek) bereken() {
    /// Inkomen
    ///
    ///
    ///

    int index = 0, vorigeIndex = 0;

    for (DateTime datum in datums) {
      if (inkomensOpDatum.isEmpty) {
        normenOpDatum[datum] =
            NormInkomen(berichten: ['geen_inkomen'].lock, fout: true);
      } else {
        stop:
        {
          while (index < inkomensOpDatum.length) {
            switch (inkomensOpDatum[index].datum.compareTo(datum)) {
              case -1:
                {
                  index++;
                  vorigeIndex = index - 1;
                }
              case 0:
                {
                  vorigeIndex = index;
                  normenOpDatum[datum] =
                      _berekenNormInkomen(datum, inkomensOpDatum[index]);
                  break stop;
                }
              case 1:
                {
                  //use vorigeIndex
                  normenOpDatum[datum] =
                      _berekenNormInkomen(datum, inkomensOpDatum[vorigeIndex]);
                  break stop;
                }
            }
          }
          normenOpDatum[datum] =
              _berekenNormInkomen(datum, inkomensOpDatum[vorigeIndex]);
        }
      }
    }

    hypotheek = hypotheek.copyWith(
        dNormInkomen: hypotheek.dNormInkomen.addAll(normenOpDatum.lock));

    hypotheekDossier = hypotheekDossier.copyWith(
        hypotheken: hypotheekDossier.hypotheken.add(hypotheek.id, hypotheek));

    return (hypotheekDossier, hypotheek);
  }

  NormInkomen _berekenNormInkomen(
      DateTime datum, InkomenOpDatum inkomenOpDatum) {
    int periode = 0;

    switch (datum.compareTo(startDatum)) {
      case -1:
        {
          assert(false,
              'StartDatum: $startDatum van hypotheek kan niet later zijn dan datum van InkomensNorm: $datum');
        }
      case 1:
        {
          periode = periodeAanpassingInkomen(
              startDatum: startDatum, perMaand: perMaand, datumInkomen: datum);
          break;
        }
    }

    int laatstePeriode = periodeInMaanden;

    for (RenteVanafPeriode r in renteVanafPeriode) {
      if (periode >= r.periode) {
        rente = r.rente;
      } else if (periode < r.periode && r.periode <= periodeInMaanden) {
        laatstePeriode = r.periode;
      }
    }
    int periodesTotVolgendeRente = laatstePeriode - periode;

    double toetsRente =
        (periode + periodesTotVolgendeRente + 1 == aflosTermijnInMaanden)
            ? rente
            : FinancieringsLast.toetsRente(
                periodesMnd: aflosTermijnInMaanden - periode, rente: rente);

    final double schuldOpDatum = VindSchuldenOpDatum.vindSchuldOpDatum(
        schulden: schulden, opDatum: datum);

    var (hd, h, statusParalleleLeningen) =
        HypotheekVerwerken.statusParralleleLeningen(
            datum: datum,
            hypotheekDossier: hypotheekDossier,
            hypotheek: hypotheek);

    hypotheekDossier = hd;
    hypotheek = h;

    BerekenMaximaleLeningInkomen b = BerekenMaximaleLeningInkomen(
        datum: datum,
        inkomensOpDatum: inkomenOpDatum,
        toetsRente: toetsRente,
        aflosTermijnInMaanden: aflosTermijnInMaanden,
        periode: periode,
        hypotheekVorm: hypotheekVorm,
        statusParalleleLeningen: statusParalleleLeningen,
        extraMaandLast: 0.0,
        verminderingMaandlast: schuldOpDatum,
        erw: ewr)
      ..bereken();

    print('Lening ${b.lening}');

    return NormInkomen(
      toetsRenteGemiddeld: b.toetsRenteGemiddeld,
      periode: b.periode,
      teLenen: b.lening,
      normLening: b.lening + b.somParalleleLeningen,
    );
  }

  int periodeAanpassingInkomen({
    required DateTime startDatum,
    required DateTime datumInkomen,
    required bool perMaand,
  }) {
    DateTime startPeriode = (perMaand && startDatum.day > 1)
        ? Kalender.voegPeriodeToe(startDatum,
            maanden: 1, periodeOpties: PeriodeOpties.eersteDag)
        : startDatum;

    return (datumInkomen.compareTo(startPeriode) <= 0)
        ? 0
        : (Kalender.deltaMaanden(startPeriode, datumInkomen) +
            (startPeriode.day <= datumInkomen.day ? 0 : -1));
  }
}

class BerekenMaximaleLeningInkomen {
  BerekenMaximaleLeningInkomen(
      {required this.datum,
      required this.inkomensOpDatum,
      required this.toetsRente,
      required this.periode,
      required this.hypotheekVorm,
      required this.aflosTermijnInMaanden,
      required this.statusParalleleLeningen,
      required this.verminderingMaandlast,
      required this.extraMaandLast,
      required this.erw})
      : financieringsLast = FinancieringsLast(
            startDatum: datum, inkomen: inkomensOpDatum, alleenstaande: false),
        somParalleleLeningen = statusParalleleLeningen.fold<double>(
            0.0, (previousValue, element) => previousValue + element.lening);

  DateTime datum;
  InkomenOpDatum inkomensOpDatum;
  FinancieringsLast financieringsLast;
  double lening = 0.0;
  double toetsRente;
  int aflosTermijnInMaanden;
  int periode;
  double somParalleleLeningen;
  double erw = 0.0;
  double schuldenMnd = 0.0;
  IList<StatusLening> statusParalleleLeningen;
  HypotheekVorm hypotheekVorm;
  double verminderingMaandlast;
  double extraMaandLast;

  //Bereken last
  double somLening = 0.0;
  double somToetsRenteBedrag = 0.0;
  double toetsRenteGemiddeld = 0.0;
  double somLastBox1 = 0.0;
  double somLastBox3 = 0.0;
  double aftrekbaar = 0.0;

  void bereken() {
    _iteratieMaxLeningInkomen();
  }

  void _iteratieMaxLeningInkomen() {
    int i = 0;
    double laagsteLening = 0.0;
    double hoogsteLening = 300000;
    lening = hoogsteLening;

    double last = _berekenAfwijkingLast();

    while (last < 0.0 && i <= 75) {
      laagsteLening = lening;
      hoogsteLening = lening = lening * 1.5;
      last = _berekenAfwijkingLast();
      i++;
    }

    while (i <= 75) {
      lening = (laagsteLening + hoogsteLening) / 2.0;

      last = _berekenAfwijkingLast();

      if (last < -0.01 && (lening - laagsteLening) > 0.5) {
        laagsteLening = lening;
      } else if (last > 0.01 && (hoogsteLening - lening) > 0.5) {
        hoogsteLening = lening;
      } else {
        break;
      }
      i++;
    }

    if (i > 75) {
      // gegevens.fout = 'Optimale lening niet gevonden, iteraties > 75';
    }

    // debugPrint('Iterations: $i ${gegevens.optimalisatieLast.lening}');

    // berekenInitieleLening();
  }

  double _berekenAfwijkingLast() {
    //Last berekenen
    somLening = 0.0;
    somToetsRenteBedrag = 0.0;
    somLastBox1 = 0.0;
    somLastBox3 = 0.0;
    toetsRenteGemiddeld = 0.0;
    aftrekbaar = lening + somParalleleLeningen - erw;

    for (var statusLening in statusParalleleLeningen) {
      berekenIndividueleLast(
        hypotheekVorm: statusLening.hypotheekVorm,
        lening: statusLening.lening,
        periode: statusLening.periode,
        toetsRente: statusLening.toetsRente,
        aflosTermijnInMaanden: statusLening.aflosTermijnInMaanden,
      );
    }

    berekenIndividueleLast(
      hypotheekVorm: hypotheekVorm,
      lening: lening,
      aflosTermijnInMaanden: aflosTermijnInMaanden,
      periode: periode,
      toetsRente: toetsRente,
    );

    toetsRenteGemiddeld = somToetsRenteBedrag / somLening * 100.0;

    //Afwijking berekenen

    final List<InkomenPot> inkomenPotten = inkomensOpDatum
        .toIterable()
        .map((Inkomen e) => InkomenPot(
            inkomen: e.indexatieTotaalBrutoJaar(datum), pensioen: e.pensioen))
        .toList();

    double lastenBox1 = somLastBox1;

    List<LastenVerrekenPot> verrekenPotten;

    if (lastenBox1 > 0.0) {
      verrekenPotten = inkomenPotten.map((InkomenPot e) {
        double percentageLast = financieringsLast.finanancieringsLastPercentage(
          aow: e.pensioen,
          box: 1,
          toetsRente: toetsRenteGemiddeld,
        );

        return LastenVerrekenPot(percentage: percentageLast, pot: e);
      }).toList();

      for (LastenVerrekenPot p in verrekenPotten) {
        final f = p.aftrekken(lastenBox1);
        lastenBox1 -= f;
        if (lastenBox1 <= 0.0) break;
      }
    }

    // ToDo Schulden tovoegen;
    double lastenBox3 = somLastBox3;

    if (lastenBox3 > 0.0) {
      verrekenPotten = inkomenPotten.map((InkomenPot e) {
        double percentageLast = financieringsLast.finanancieringsLastPercentage(
          aow: e.pensioen,
          box: 3,
          toetsRente: toetsRente,
        );

        return LastenVerrekenPot(percentage: percentageLast, pot: e);
      }).toList();

      for (LastenVerrekenPot p in verrekenPotten) {
        final f = p.aftrekken(lastenBox3);
        lastenBox3 -= f;
        if (lastenBox3 <= 0.0) break;
      }
    }

    double lastenTeBesteden = 0.0;

    //Dummy percentage om pot leeg te maken.
    verrekenPotten = [
      for (InkomenPot e in inkomenPotten)
        LastenVerrekenPot(percentage: 20.0, pot: e)
    ];

    for (LastenVerrekenPot p in verrekenPotten) {
      lastenTeBesteden -= p.opmaken();
    }

    // print(
    //     'lastenBox1: $lastenBox1 lastenBox3: $lastenBox3 lastenTeBesteden: $lastenTeBesteden');

    return lastenBox1 +
        lastenBox3 +
        lastenTeBesteden +
        verminderingMaandlast * 12.0 -
        extraMaandLast * 12.0;
  }

  berekenIndividueleLast({
    required double lening,
    required double toetsRente,
    required int aflosTermijnInMaanden,
    required int periode,
    required HypotheekVorm hypotheekVorm,
  }) {
    if (aftrekbaar > 0.0 && hypotheekVorm != HypotheekVorm.aflosvrij) {
      if (lening <= aftrekbaar) {
        sommeren(
            1,
            berekenAnnuiteit(
                lening: lening,
                toetsRente: toetsRente,
                aflosTermijnInMaanden: aflosTermijnInMaanden,
                periode: periode));
      } else {
        final leningAftrekbaar = aftrekbaar;
        final leningNietAftrekbaar = lening - aftrekbaar;
        sommeren(
            1,
            berekenAnnuiteit(
                lening: leningAftrekbaar,
                toetsRente: toetsRente,
                aflosTermijnInMaanden: aflosTermijnInMaanden,
                periode: periode));

        if (leningNietAftrekbaar > 0.0) {
          sommeren(
              3,
              berekenAnnuiteit(
                  lening: lening - aftrekbaar,
                  toetsRente: toetsRente,
                  aflosTermijnInMaanden: aflosTermijnInMaanden,
                  periode: periode));
        }

        assert(aftrekbaar == 0.0, 'Aftrekbaar is niet 0.0');
        aftrekbaar = 0.0;
      }
    } else {
      sommeren(
          3,
          berekenAnnuiteit(
              lening: lening,
              toetsRente: toetsRente,
              aflosTermijnInMaanden: aflosTermijnInMaanden,
              periode: periode));
    }
  }

  void sommeren(int box, ResultaatAnnuiteitMnd resultaat) {
    somLastBox1 += resultaat.annuiteit * 12.0;
    somLening += resultaat.lening;
    somToetsRenteBedrag += resultaat.toetsRenteBedrag;

    if (box == 1) {
      aftrekbaar -= resultaat.lening;
    }
  }

  // void berekenInitieleLening() {
  //   const statusLening = StatusLening(
  //       id: 'id',
  //       lening: 5555,
  //       periode: 0,
  //       rente: 5.0,
  //       toetsRente: 5.0,
  //       aflosTermijnInMaanden: 12,
  //       hypotheekVorm: HypotheekVorm.annuity);

  //   double initieleLening;

  //   if (statusLening.periode == 0) {
  //     initieleLening = statusLening.lening;
  //   } else {
  //     switch (statusLening.hypotheekVorm) {
  //       case HypotheekVorm.aflosvrij:
  //         initieleLening = statusLening.lening;
  //         break;
  //       case HypotheekVorm.linear:
  //         initieleLening = statusLening.lening *
  //             (statusLening.aflosTermijnInMaanden) /
  //             (statusLening.aflosTermijnInMaanden - statusLening.periode);
  //         break;
  //       case HypotheekVorm.annuity:
  //         double r = statusLening.rente / 100.0 / 12.0;
  //         initieleLening = statusLening.lening *
  //             (1.0 - math.pow(1.0 + r, -statusLening.aflosTermijnInMaanden)) /
  //             (1.0 -
  //                 math.pow(
  //                     1.0 + r,
  //                     -(statusLening.aflosTermijnInMaanden -
  //                         statusLening.periode)));
  //         break;
  //     }
  //   }
  //   if (initieleLening.isInfinite) {
  //     gegevens.fout = 'Terugbereken niet gelukt';
  //   } else {
  //     ol.initieleLening = initieleLening.roundToDouble();
  //   }
  // }

  // berekenVerduurzamen() {
  //   final vvk = hypotheek.verbouwVerduurzaamKosten;
  //   final ol = gegevens.optimalisatieLast;
  //   if (vvk.toepassen) {
  //     ol.verduurzaamLening = financieringsLast.verduurzamen(
  //         verduurzaamKosten: gegevens.parallelLeningen.somVerduurzaamKosten +
  //             hypotheek.verbouwVerduurzaamKosten.totaleVerduurzaamKosten,
  //         energieClassificering: vvk.energieClassificering);
  //   }
  // }
}

ResultaatAnnuiteitMnd berekenAnnuiteit(
    {required double lening,
    required double toetsRente,
    required int aflosTermijnInMaanden,
    required int periode}) {
  final double maandRente = toetsRente / 12.0;

  final a = lening /
      100.0 *
      maandRente /
      (1.0 -
          (math.pow(
              1.0 + maandRente / 100.0, -(aflosTermijnInMaanden - periode))));

  return ResultaatAnnuiteitMnd(
      annuiteit: a,
      toetsRenteBedrag: lening / 100 * toetsRente,
      lening: lening);
}

class ResultaatAnnuiteitMnd {
  ResultaatAnnuiteitMnd({
    required this.annuiteit,
    required this.toetsRenteBedrag,
    required this.lening,
  });

  final double annuiteit;
  final double toetsRenteBedrag;
  final double lening;
}

class LastenVerrekenPot {
  LastenVerrekenPot({
    required this.percentage,
    required this.pot,
  });

  double percentage;
  InkomenPot pot;

  double aftrekken(double last) {
    final maxLast = pot.inkomen / 100.0 * percentage;

    if (last < maxLast) {
      final lastNaarInkomen = last * 100.0 / percentage;
      pot.inkomen -= lastNaarInkomen;
      return last;
    } else {
      pot.inkomen = 0.0;
      return maxLast;
    }
  }

  double opmaken() {
    final maxLast = pot.inkomen / 100.0 * percentage;
    pot.inkomen = 0.0;
    return maxLast;
  }

  double resterendeLast() => pot.inkomen / 100.0 * percentage;
}

class InkomenPot {
  InkomenPot({
    required this.inkomen,
    required this.pensioen,
  });

  double inkomen;
  bool pensioen;

  bool get isNotEmpty => inkomen > 0.0;
}
