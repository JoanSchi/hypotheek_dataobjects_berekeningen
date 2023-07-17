import 'dart:math' as math;
import '../../gereedschap/kalender.dart';
import '../gegevens/hypotheek/hypotheek.dart';
import '../gegevens/lening_aanpassen/lening_aanpassen.dart';
import '../gegevens/rente_vanaf_periode/rente_vanaf_periode.dart';
import '../gegevens/termijn/termijn.dart';

const _leningIsAfgelost = 0.01;

class HypotheekTermijnen {
  final double hoofdsom;
  final double initieleLening;
  final double aanvangRente;
  double rente;
  final DateTime startDatum;
  final DateTime datumLening;
  final HypotheekVorm hypotheekVorm;
  final int aflosTermijnInMaanden;
  final int periodeInMaanden;
  final bool perMaand;
  bool gebrokenMaand = false;
  final bool eersteGebrokenMaandAlleenRente;
  final double boeteVrijAflossenPercentage;
  double aflossenTotaal = 0.0;
  double renteTotaal = 0.0;
  double extraLenenTotaal = 0.0;
  double leningAanvangPeriode = 0.0;
  double periodeAflossen = 0.0;
  double periodeRenteBedrag = 0.0;
  double periodeExtraAflossen = 0.0;
  DateTime beginPeriodeTelling;
  double lening;
  List<Termijn> termijnen = [];
  IteratieLeningAanpassen leningAanpassen;
  double verstrekenPeriode = 0.0;
  DateTime eindDatum;
  List<LeningAanpassen> extraAflossen;
  List<LeningAanpassen> extraLenen;
  List<RenteVanafPeriode> renteVanafPeriode;

  HypotheekTermijnen(
      {required this.startDatum,
      required this.hoofdsom,
      required this.rente,
      DateTime? datumLening,
      double? lening,
      required this.hypotheekVorm,
      required this.aflosTermijnInMaanden,
      required this.periodeInMaanden,
      required this.perMaand,
      this.eersteGebrokenMaandAlleenRente = true,
      this.boeteVrijAflossenPercentage = 10.0,
      this.extraAflossen = const [],
      this.extraLenen = const [],
      this.renteVanafPeriode = const []})
      : assert(periodeInMaanden <= aflosTermijnInMaanden,
            'PeriodeInMaanden $periodeInMaanden is niet kleiner of gelijk aan aflosTermijnInMaanden $aflosTermijnInMaanden'),
        aanvangRente = rente,
        beginPeriodeTelling = startDatum,
        datumLening = datumLening ?? startDatum,
        eindDatum = datumLening ?? startDatum,
        initieleLening = lening ?? hoofdsom,
        lening = lening ?? hoofdsom,
        leningAanpassen = IteratieLeningAanpassen(
            extraAflossenItems: extraAflossen,
            extraLenenItems: extraLenen,
            startDatum: startDatum,
            datumLening: datumLening ?? startDatum,
            boeteVrijAflosen: hoofdsom / 100.0 * boeteVrijAflossenPercentage);

  termijnenAanmaken() {
    if (lening < _leningIsAfgelost) {
      return;
    }

    DateTime startPeriode;
    DateTime eindPeriode;

    int periode = 0;
    verstrekenPeriode = 0.0;

    if (perMaand && beginPeriodeTelling.day > 1) {
      gebrokenMaand = true;
      startPeriode = Kalender.voegPeriodeToe(startDatum,
          periodeOpties: PeriodeOpties.eersteDag);
      eindPeriode = Kalender.voegPeriodeToe(startDatum,
          periodeOpties: PeriodeOpties.laatsteDag);

      ///  Bij eersteGebrokenMaandAlleenRente wordt niet bij de periode gerekenend en daarom is periode -1
      ///  Om volgende datum met periode te rekenen wordt begnPeriodeTelling 1 periode opgeschoven.
      ///
      ///

      if (datumLening.compareTo(startDatum) <= 0) {
        if (toevoegen(
            startPeriode,
            eindPeriode,
            startDatum,
            eindPeriode,
            -1,
            eersteGebrokenMaandAlleenRente
                ? HypotheekVorm.aflosvrij
                : hypotheekVorm)) {
          return;
        }
        if (eersteGebrokenMaandAlleenRente) {
          verstrekenPeriode = 0.0;
        }
      } else {
        verstrekenPeriode = eersteGebrokenMaandAlleenRente
            ? 0.0
            : _ratio(startPeriode, eindPeriode, startDatum, eindPeriode);
      }

      beginPeriodeTelling = startPeriode = Kalender.voegPeriodeToe(startPeriode,
          maanden: 1, periodeOpties: PeriodeOpties.volgende);

      eindDatum = Kalender.voegPeriodeToe(startPeriode,
          maanden: periodeInMaanden, periodeOpties: PeriodeOpties.eind);
    } else {
      beginPeriodeTelling = startPeriode = startDatum;
      eindDatum = Kalender.voegPeriodeToe(startDatum,
          maanden: periodeInMaanden, periodeOpties: PeriodeOpties.eind);
    }

    ///
    ///
    ///

    if (startPeriode.compareTo(datumLening) < 0) {
      int delta = Kalender.deltaHeleMaanden(startPeriode, datumLening);

      print('periode $periode + delta $delta = ${periode + delta}');
      verstrekenPeriode = delta.toDouble();
      periode += delta;

      startPeriode = Kalender.voegPeriodeToe(beginPeriodeTelling,
          maanden: periode, periodeOpties: PeriodeOpties.volgende);
    }

    while (startPeriode.compareTo(eindDatum) <= 0) {
      eindPeriode = Kalender.voegPeriodeToe(beginPeriodeTelling,
          maanden: periode + 1, periodeOpties: PeriodeOpties.eind);

      if (toevoegen(
          startPeriode,
          eindPeriode,
          startPeriode,
          eindDatum.compareTo(eindPeriode) < 0 ? eindDatum : eindPeriode,
          periode,
          hypotheekVorm)) {
        return;
      }

      periode++;
      startPeriode = Kalender.voegPeriodeToe(beginPeriodeTelling,
          maanden: periode, periodeOpties: PeriodeOpties.volgende);
    }
    if (termijnen.isNotEmpty) {
      eindDatum = termijnen.last.eindDatum;
    }
  }

  int periodeVanafRente = 0;
  int volgendePeriodeVanafRent = 0;
  int index = 0;

  bool toevoegen(
      DateTime startPeriode,
      DateTime eindPeriode,
      DateTime startDatum,
      DateTime eindDatum,
      int periode,
      HypotheekVorm hypotheekVorm) {
    leningAanvangPeriode = lening;
    periodeAflossen = 0.0;
    periodeRenteBedrag = 0.0;

    if (volgendePeriodeVanafRent <= periode) {
      ttt:
      {
        while (index < renteVanafPeriode.length) {
          final r = renteVanafPeriode[index];

          if (r.periode > periode) {
            volgendePeriodeVanafRent = r.periode;
            break ttt;
          } else {
            rente = r.rente;
            periodeVanafRente = r.periode;
          }
          index++;
        }
        volgendePeriodeVanafRent = periodeInMaanden;
      }
    }

    return leningAanpassen.aanpassen(
        startDatum: startDatum,
        eindDatum: eindPeriode,
        termijnToevoegen:
            (DateTime start, DateTime end, double aflossen, double verhogen) {
          final bool laatsteTermijn = end.compareTo(this.eindDatum) == 0;
          final Termijn? termijn;
          switch (hypotheekVorm) {
            case HypotheekVorm.aflosvrij:
              termijn = _aflosvrijTermijn(
                  startPeriode: startPeriode,
                  eindPeriode: eindPeriode,
                  startDatum: start,
                  eindDatum: end,
                  periode: periode,
                  extraAflossen: aflossen,
                  extraLenen: verhogen,
                  laatsteTermijn: laatsteTermijn);
              break;
            case HypotheekVorm.lineair:
              termijn = _lineairGebrokenTermijn(
                  startPeriode: startPeriode,
                  eindPeriode: eindPeriode,
                  startDatum: start,
                  eindDatum: end,
                  periode: periode,
                  extraAflossen: aflossen,
                  extraLenen: verhogen,
                  laatsteTermijn: laatsteTermijn);
              break;
            case HypotheekVorm.annuiteit:
              assert(eersteGebrokenMaandAlleenRente || !gebrokenMaand,
                  'Gebrokenmaand met aflossen is niet toegestaan bij annuiteit');

              termijn = _annuiteitHeleTermijn(
                  startPeriode: startPeriode,
                  eindPeriode: eindPeriode,
                  startDatum: start,
                  eindDatum: end,
                  periode: periode,
                  extraAflossen: aflossen,
                  extraLenen: verhogen,
                  laatsteTermijn: laatsteTermijn);

              break;
          }
          if (termijn != null) {
            termijnen.add(termijn);
            return termijn.lening < _leningIsAfgelost;
          } else {
            return false;
          }
        });
  }

  Termijn? _annuiteitHeleTermijn({
    required DateTime startPeriode,
    required DateTime eindPeriode,
    required DateTime startDatum,
    required DateTime eindDatum,
    required double extraAflossen,
    required double extraLenen,
    required int periode,
    required bool laatsteTermijn,
  }) {
    final leningAanvangTermijn = lening;

    if (extraAflossen > 0.0) {
      if (lening - extraAflossen < 1.0) {
        extraAflossen = lening;
        lening = 0;
      } else {
        lening -= extraAflossen;
      }
      extraLenenTotaal + extraLenen;
    }

    if (extraLenen > 0.0) {
      lening += extraLenen;
      aflossenTotaal += extraAflossen;
    }

    if (lening >= _leningIsAfgelost) {
      final ratio = _ratio(startPeriode, eindPeriode, startDatum, eindDatum);
      final maandRente = rente / 12.0;

      final double maandRenteBedragRatio = lening / 100.0 * maandRente * ratio;

      final annuity = lening /
          100.0 *
          maandRente /
          (1.0 -
              (math.pow(1.0 + maandRente / 100.0,
                  -(aflosTermijnInMaanden - periode)))) *
          ratio;
      final aflossenRatio = annuity - maandRenteBedragRatio;

      periodeAflossen += aflossenRatio;
      periodeRenteBedrag += maandRenteBedragRatio;
    }

    if (lening < _leningIsAfgelost) {
      laatsteTermijn = true;
    }

    if (eindDatum.compareTo(eindPeriode) < 0 && !laatsteTermijn) {
      return (extraAflossen > 0.0) || (extraLenen > 0.0)
          ? Termijn(
              startPeriode: startPeriode,
              eindPeriode: eindPeriode,
              startDatum: startDatum,
              eindDatum: eindDatum,
              hypotheekVorm: HypotheekVorm.annuiteit,
              aflossen: 0.0,
              extraAflossen: extraAflossen,
              extraLenen: extraLenen,
              renteBedrag: 0.0,
              periode: periode,
              lening: leningAanvangTermijn,
              rente: rente,
              periodesTotVolgendeRente: volgendePeriodeVanafRent - periode,
              aflossenTotaal: aflossenTotaal,
              renteTotaal: renteTotaal,
              extraLenenTotaal: extraLenenTotaal,
              laatsteTermijn: laatsteTermijn,
              laatsteVanPeriode: false)
          : null;
    } else {
      if (lening - periodeAflossen < _leningIsAfgelost) {
        periodeAflossen = lening;
        lening = 0.0;
      } else {
        lening -= periodeAflossen;
      }
      aflossenTotaal += periodeAflossen;
      renteTotaal += periodeRenteBedrag;

      return Termijn(
          startPeriode: startPeriode,
          eindPeriode: eindPeriode,
          startDatum: startDatum,
          eindDatum: eindDatum,
          hypotheekVorm: HypotheekVorm.annuiteit,
          aflossen: periodeAflossen,
          extraAflossen: extraAflossen,
          extraLenen: extraLenen,
          renteBedrag: periodeRenteBedrag,
          periode: periode,
          lening: leningAanvangPeriode,
          rente: rente,
          periodesTotVolgendeRente: volgendePeriodeVanafRent - periode,
          aflossenTotaal: aflossenTotaal,
          renteTotaal: renteTotaal,
          extraLenenTotaal: extraLenenTotaal,
          laatsteTermijn: laatsteTermijn,
          laatsteVanPeriode: true);
    }
  }

  Termijn? _lineairGebrokenTermijn({
    required DateTime startPeriode,
    required DateTime eindPeriode,
    required DateTime startDatum,
    required DateTime eindDatum,
    required double extraAflossen,
    required double extraLenen,
    required int periode,
    required bool laatsteTermijn,
  }) {
    final leningAanvangTermijn = lening;

    if (extraAflossen > 0.0) {
      if (lening - extraAflossen < 1.0) {
        extraAflossen = lening;
        lening = 0;
      } else {
        lening -= extraAflossen;
      }
      aflossenTotaal += extraAflossen;
    }

    if (extraLenen > 0.0) {
      lening += extraLenen;
      extraLenenTotaal + extraLenen;
    }

    if (lening >= _leningIsAfgelost) {
      final ratio = laatsteTermijn
          ? periodeInMaanden - verstrekenPeriode
          : _ratio(startPeriode, eindPeriode, startDatum, eindDatum);

      final maandRente = rente / 12.0;
      final double maandRenteBedragRatio = lening / 100.0 * maandRente * ratio;
      final aflossenRatio =
          lening / (aflosTermijnInMaanden - verstrekenPeriode) * ratio;

      verstrekenPeriode += ratio;
      periodeAflossen += aflossenRatio;
      periodeRenteBedrag += maandRenteBedragRatio;
    }

    if (lening < _leningIsAfgelost) {
      laatsteTermijn = true;
    }

    if (eindDatum.compareTo(eindPeriode) < 0 && !laatsteTermijn) {
      return (extraAflossen > 0.0) || (extraLenen > 0.0)
          ? Termijn(
              startPeriode: startPeriode,
              eindPeriode: eindPeriode,
              startDatum: startDatum,
              eindDatum: eindDatum,
              hypotheekVorm: HypotheekVorm.lineair,
              aflossen: 0.0,
              extraAflossen: extraAflossen,
              extraLenen: extraLenen,
              renteBedrag: 0,
              periode: periode,
              lening: leningAanvangTermijn,
              rente: rente,
              periodesTotVolgendeRente: volgendePeriodeVanafRent - periode,
              aflossenTotaal: aflossenTotaal,
              renteTotaal: renteTotaal,
              extraLenenTotaal: extraLenenTotaal,
              laatsteTermijn: laatsteTermijn,
              laatsteVanPeriode: false)
          : null;
    } else {
      if (lening - periodeAflossen < _leningIsAfgelost) {
        periodeAflossen = lening;
        lening = 0.0;
      } else {
        lening -= periodeAflossen;
      }

      aflossenTotaal += periodeAflossen;
      renteTotaal += periodeRenteBedrag;

      return Termijn(
          startPeriode: startPeriode,
          eindPeriode: eindPeriode,
          startDatum: startDatum,
          eindDatum: eindDatum,
          hypotheekVorm: HypotheekVorm.lineair,
          aflossen: periodeAflossen,
          extraAflossen: extraAflossen,
          extraLenen: extraLenen,
          renteBedrag: periodeRenteBedrag,
          periode: periode,
          lening: leningAanvangPeriode,
          rente: rente,
          periodesTotVolgendeRente: volgendePeriodeVanafRent - periode,
          aflossenTotaal: aflossenTotaal,
          renteTotaal: renteTotaal,
          extraLenenTotaal: extraLenenTotaal,
          laatsteTermijn: laatsteTermijn,
          laatsteVanPeriode: true);
    }
  }

  Termijn? _aflosvrijTermijn({
    required DateTime startPeriode,
    required DateTime eindPeriode,
    required DateTime startDatum,
    required DateTime eindDatum,
    required double extraAflossen,
    required double extraLenen,
    required int periode,
    required bool laatsteTermijn,
  }) {
    final leningAanvangTermijn = lening;

    if (extraAflossen > 0.0) {
      if (lening - extraAflossen < 1.0) {
        extraAflossen = lening;
        lening = 0;
      } else {
        lening -= extraAflossen;
      }
      aflossenTotaal += extraAflossen;
    }

    if (extraLenen > 0.0) {
      lening += extraLenen;
      extraLenenTotaal + extraLenen;
    }

    if (lening < _leningIsAfgelost) {
      laatsteTermijn = true;
    } else {
      final ratio = _ratio(startPeriode, eindPeriode, startDatum, eindDatum);
      final double maandRenteBedragRatio =
          lening / 100.0 * rente / 12.0 * ratio;

      periodeRenteBedrag += maandRenteBedragRatio;
    }

    if (eindDatum.compareTo(eindPeriode) < 0 && !laatsteTermijn) {
      return (extraAflossen > 0.0) || (extraLenen > 0.0)
          ? Termijn(
              startPeriode: startPeriode,
              eindPeriode: eindPeriode,
              startDatum: startDatum,
              eindDatum: eindDatum,
              hypotheekVorm: HypotheekVorm.aflosvrij,
              aflossen: 0.0,
              extraAflossen: extraAflossen,
              extraLenen: extraLenen,
              renteBedrag: 0,
              periode: periode,
              lening: leningAanvangTermijn,
              rente: rente,
              periodesTotVolgendeRente: volgendePeriodeVanafRent - periode,
              aflossenTotaal: aflossenTotaal,
              renteTotaal: renteTotaal,
              extraLenenTotaal: extraLenenTotaal,
              laatsteTermijn: laatsteTermijn,
              laatsteVanPeriode: false)
          : null;
    } else {
      renteTotaal += periodeRenteBedrag;

      return Termijn(
          startPeriode: startPeriode,
          eindPeriode: eindPeriode,
          startDatum: startDatum,
          eindDatum: eindDatum,
          hypotheekVorm: HypotheekVorm.aflosvrij,
          aflossen: 0.0,
          extraAflossen: extraAflossen,
          extraLenen: extraLenen,
          renteBedrag: periodeRenteBedrag,
          periode: periode,
          lening: leningAanvangPeriode,
          rente: rente,
          periodesTotVolgendeRente: volgendePeriodeVanafRent - periode,
          aflossenTotaal: aflossenTotaal,
          renteTotaal: renteTotaal,
          extraLenenTotaal: extraLenenTotaal,
          laatsteTermijn: laatsteTermijn,
          laatsteVanPeriode: true);
    }
  }

  double _ratio(
    DateTime beginPeriode,
    DateTime eindPeriode,
    DateTime begin,
    DateTime eind,
  ) {
    return (Kalender.aantalDagen(begin, eind)) /
        (Kalender.aantalDagen(beginPeriode, eindPeriode));
  }

  double get restSchuld => termijnen.lastOrNull?.leningNaAflossen ?? 0.0;
}

class IteratieLeningAanpassen {
  late final List<LeningAanpassenEntry> aanpassingsItems;
  int aflosJaar = 0;
  double jaarAfgelost = 0.0;
  double boeteVrijAflosen = 0.0;
  DateTime eersteAanpasDatum = DateTime(4000);

  IteratieLeningAanpassen({
    required List<LeningAanpassen> extraAflossenItems,
    required List<LeningAanpassen> extraLenenItems,
    required DateTime datumLening,
    required DateTime startDatum,
    required this.boeteVrijAflosen,
  }) {
    aanpassingsItems = [
      ...iterateleningAanpasItems(extraAflossenItems, datumLening),
      ...iterateleningAanpasItems(extraLenenItems, datumLening)
    ];

    for (LeningAanpassenEntry a in aanpassingsItems) {
      if (eersteAanpasDatum.compareTo(a.datum) > 0) {
        eersteAanpasDatum = a.datum;
      }
    }

    if (startDatum.compareTo(datumLening) < 0) {
      alAfgelostVoorLeningsDatum(
          datumLening: datumLening,
          startDatum: startDatum,
          extraAflossenItems: extraAflossenItems);
    }
  }

  Iterable<LeningAanpassenEntry> iterateleningAanpasItems(
      List<LeningAanpassen> list, DateTime datumLening) sync* {
    for (LeningAanpassen a in list) {
      final entry = a.map(
          termijnen: (termijnen) => LeningAanpassenInTermijnenEntry(
              leningAanpassen: termijnen, startDatum: datumLening),
          eenmalig: (eenmalig) => LeningAanpassEenmaligEntry(
              leningAanpassen: eenmalig, startDatum: datumLening));

      if (!entry.eind) {
        yield entry;
      }
    }
  }

  alAfgelostVoorLeningsDatum(
      {required DateTime startDatum,
      required DateTime datumLening,
      required List<LeningAanpassen> extraAflossenItems}) {
    for (LeningAanpassen leningAanpassen in extraAflossenItems) {
      assert(
          leningAanpassen.leningAanpassenOpties ==
              LeningAanpassenOpties.aflossen,
          'LeningAanpassen meot aflossen zijn in alAfgelostVoorLeningsDatum functie');

      leningAanpassen.when(termijnen: (
        DateTime datum,
        LeningAanpassenOpties leningAanpassenOpties,
        double bedrag,
        int aantal,
        int intervalInMaanden,
      ) {
        for (int index = 0; index < aantal; index++) {
          final t = Kalender.voegPeriodeToe(datum,
              maanden: index * intervalInMaanden,
              periodeOpties: PeriodeOpties.eersteDag);

          if (datumLening.year == t.year &&
              startDatum.compareTo(t) < 0 &&
              t.compareTo(datumLening) < 0) {
            jaarAfgelost += bedrag;
            aflosJaar = t.year;
          }
        }
      }, eenmalig: (
        DateTime datum,
        LeningAanpassenOpties leningAanpassenOpties,
        double bedrag,
      ) {
        if (datumLening.year == datum.year &&
            startDatum.compareTo(datum) < 0 &&
            datum.compareTo(datumLening) < 0) {
          jaarAfgelost += bedrag;
          aflosJaar = datum.year;
        }
      });
    }
    if (jaarAfgelost > boeteVrijAflosen) {
      jaarAfgelost = boeteVrijAflosen;
    }
  }

  bool aanpassen(
      {required DateTime startDatum,
      required DateTime eindDatum,
      required bool Function(DateTime start, DateTime end, double extraAflossen,
              double extraLenen)
          termijnToevoegen}) {
    if (eindDatum.compareTo(eersteAanpasDatum) <= 0 ||
        aanpassingsItems.isEmpty) {
      return termijnToevoegen(startDatum, eindDatum, 0.0, 0.0);
    }

    double vorigeExtraAflossing = 0.0;
    double vorigeExtraLenen = 0.0;
    bool opschonen = false;
    bool volgendeAanpassing = true;

    while (volgendeAanpassing && eersteAanpasDatum.compareTo(eindDatum) <= 0) {
      DateTime eersteVolgendeAanpasDatum = DateTime(4000);
      double extraAflossen = 0.0;
      double extraLenen = 0.0;
      volgendeAanpassing = false;

      for (LeningAanpassenEntry a in aanpassingsItems) {
        if (!a.eind &&
            a.datum == eersteAanpasDatum &&
            a.aanpasBedrag(
                startDatum,
                eindDatum,
                (double bedrag) => extraAflossen += bedrag,
                (double bedrag) => extraLenen += bedrag)) {
          volgendeAanpassing = true;
        }

        if (a.eind) {
          opschonen = true;
        } else if (eersteVolgendeAanpasDatum.compareTo(a.datum) > 0) {
          eersteVolgendeAanpasDatum = a.datum;
        }
      }

      /// Boetevrijaflossen
      ///
      ///
      ///
      ///

      if (extraAflossen > 0.0) {
        if (aflosJaar != eersteAanpasDatum.year) {
          aflosJaar = eersteAanpasDatum.year;
          jaarAfgelost = 0.0;
        }

        if (jaarAfgelost + extraAflossen < boeteVrijAflosen) {
          jaarAfgelost += extraAflossen;
        } else {
          extraAflossen = boeteVrijAflosen - jaarAfgelost;
          jaarAfgelost = boeteVrijAflosen;
        }
      }

      /// Aanpassen
      ///
      /// De vorige aanpassing wordt toegepast
      ///
      ///

      if (startDatum.compareTo(eersteAanpasDatum) == 0) {
        vorigeExtraAflossing += extraAflossen;
        vorigeExtraLenen += extraLenen;
      } else {
        if (termijnToevoegen(
            startDatum,
            DateTime(eersteAanpasDatum.year, eersteAanpasDatum.month,
                eersteAanpasDatum.day - 1),
            vorigeExtraAflossing,
            vorigeExtraLenen)) {
          return true;
        }

        vorigeExtraAflossing = extraAflossen;
        vorigeExtraLenen = extraLenen;
        startDatum = eersteAanpasDatum;
      }

      eersteAanpasDatum = eersteVolgendeAanpasDatum;
    }

    if (termijnToevoegen(
        startDatum, eindDatum, vorigeExtraAflossing, vorigeExtraLenen)) {
      return true;
    }

    if (opschonen) {
      aanpassingsItems.removeWhere((element) => element.eind);
    }
    return false;
  }
}

abstract class LeningAanpassenEntry {
  LeningAanpassen get leningAanpassen;
  bool get eind;
  DateTime get datum;
  bool aanpasBedrag(DateTime startDatum, DateTime eindDatum,
      Function(double bedrag) aflossen, Function(double bedrag) verhogen);
}

class LeningAanpassenInTermijnenEntry extends LeningAanpassenEntry {
  @override
  final LenningAanpassenInTermijnen leningAanpassen;
  int index = 0;

  @override
  DateTime datum;
  @override
  bool eind = false;

  LeningAanpassenInTermijnenEntry(
      {required this.leningAanpassen, required DateTime startDatum})
      : datum = leningAanpassen.datum {
    _naEerstVolgendeDatum(startDatum);
  }

  _naEerstVolgendeDatum(DateTime startDatum) {
    while (index < leningAanpassen.aantal) {
      if (startDatum.compareTo(datum) < 0) {
        return;
      }

      datum = Kalender.voegPeriodeToe(leningAanpassen.datum,
          maanden: index * leningAanpassen.intervalInMaanden,
          periodeOpties: PeriodeOpties.volgende);

      index++;
    }
    eind = index == leningAanpassen.aantal;
  }

  @override
  bool aanpasBedrag(DateTime startDatum, DateTime eindDatum,
      Function(double bedrag) aflossen, Function(double bedrag) verhogen) {
    if (eind) {
      return false;
    }

    if (datum.compareTo(startDatum) >= 0 && datum.compareTo(eindDatum) <= 0) {
      /// Datum ligt tussen periode
      /// Bepaal alvast volgende datum of het einde
      ///
      index++;

      if (index < leningAanpassen.aantal) {
        datum = Kalender.voegPeriodeToe(leningAanpassen.datum,
            maanden: index * leningAanpassen.intervalInMaanden,
            periodeOpties: PeriodeOpties.volgende);
      } else {
        eind = true;
      }

      if (leningAanpassen.leningAanpassenOpties ==
          LeningAanpassenOpties.aflossen) {
        aflossen(leningAanpassen.bedrag);
      } else {
        verhogen(leningAanpassen.bedrag);
      }

      return true;
    }

    return false;
  }
}

class LeningAanpassEenmaligEntry extends LeningAanpassenEntry {
  @override
  final LenningAanpassenEenmalig leningAanpassen;

  @override
  DateTime datum;
  @override
  bool eind = false;

  LeningAanpassEenmaligEntry(
      {required this.leningAanpassen, required DateTime startDatum})
      : datum = leningAanpassen.datum {
    if (datum.compareTo(startDatum) < 0) {
      eind = true;
    }
  }

  @override
  bool aanpasBedrag(DateTime startDatum, DateTime eindDatum,
      Function(double bedrag) aflossen, Function(double bedrag) verhogen) {
    if (eind) {
      return false;
    }

    if (datum.compareTo(startDatum) >= 0 && datum.compareTo(eindDatum) <= 0) {
      eind = true;
      if (leningAanpassen.leningAanpassenOpties ==
          LeningAanpassenOpties.aflossen) {
        aflossen(leningAanpassen.bedrag);
      } else {
        verhogen(leningAanpassen.bedrag);
      }

      return true;
    }

    return false;
  }
}
