import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import '../../gereedschap/kalender.dart';
import '../financierings_norm/norm_inkomen/financierings_last_tabel.dart';
import '../gegevens/gedeeld/kosten_woning_lening.dart';
import '../gegevens/vervolg_lening/vervolg_lening.dart';
import '../gegevens/extra_of_kosten_lening/extra_of_kosten_lening.dart';
import '../gegevens/hypotheek/hypotheek.dart';
import '../gegevens/hypotheek_dossier/hypotheek_dossier.dart';
import '../gegevens/status_lening/status_lening.dart';
import '../gegevens/termijn/termijn.dart';
import 'hypotheek_iterator.dart';

class HypotheekVerwerken {
  static DateTime get hypotheekDatumSuggestie => Kalender.datumAlleen(
        Kalender.voegPeriodeToe(DateTime.now(),
            maanden: 3, periodeOpties: PeriodeOpties.eersteDag),
      );

  static List<LeningVerlengen> teVerlengenHypotheek(
      HypotheekDossier hd, String hypotheekId) {
    List<LeningVerlengen> verlengen = [];

    zoek(String id) {
      if (id == hypotheekId) return;

      final hypotheek = hd.hypotheken[id];

      assert(hypotheek != null,
          'By initialiseren te verlengen hypotheken moet zoeken op id niet null opleveren!');

      if (hypotheek == null) return;

      if (hypotheek.volgende.isEmpty || hypotheek.volgende == hypotheekId) {
        if (hypotheek.restSchuld > 1.0) {
          verlengen.add(LeningVerlengen(hypotheek));
        }
        return;
      }

      zoek(hypotheek.volgende);
    }

    for (String id in hd.eersteHypotheken) {
      zoek(id);
    }

    return verlengen;
  }

  static List<HerFinancieren> herFinancieren(
      HypotheekDossier hd, String hypotheekId) {
    List<HerFinancieren> list = [];

    HerFinancieren? herFinanciering;

    for (Hypotheek hypotheek
        in HypotheekIterator.allesBehalveVerlengingId(hd, hypotheekId)) {
      if (herFinanciering != null) {
        switch ((
          herFinanciering.datum.compareTo(hypotheek.startDatum),
          hypotheek.id
        )) {
          case (int compare, String id) when compare == 0 && id != hypotheekId:
            {
              herFinanciering = null;
              break;
            }
          case -1:
            {
              list.add(herFinanciering);
              break;
            }
        }
      }

      if (hypotheek.id != hypotheekId &&
          hypotheek.volgende.isEmpty &&
          hypotheek.restSchuld >= 0.01) {
        DateTime startDatumVolgendeLening = Kalender.voegPeriodeToe(
            hypotheek.startDatum,
            periodeOpties: hypotheek.eersteGebrokenMaandAlleenRente
                ? PeriodeOpties.eersteDagOfVolgende
                : PeriodeOpties.volgende,
            maanden: hypotheek.periodeInMaanden);

        if (herFinanciering != null &&
            herFinanciering.datum == startDatumVolgendeLening) {
          herFinanciering
            ..ids.add(hypotheek.id)
            ..restSchuld += hypotheek.restSchuld;
        } else {
          herFinanciering = HerFinancieren(
              datum: startDatumVolgendeLening,
              id: hypotheek.id,
              restSchuld: hypotheek.restSchuld);
        }
      }
    }
    if (herFinanciering != null) {
      list.add(herFinanciering);
    }

    return list;

    // Map<DateTime, HerFinancieren> map = {};

    // for (var MapEntry(key: id, value: hypotheek) in hd.hypotheken.entries) {
    //   if (id != hypotheekId &&
    //       (hypotheek.volgende.isEmpty || hypotheek.volgende == id) &&
    //       hypotheek.restSchuld >= 0.01) {
    //     DateTime startDatumVolgendeLening = Kalender.voegPeriodeToe(
    //         hypotheek.startDatum,
    //         periodeOpties: hypotheek.eersteGebrokenMaandAlleenRente
    //             ? PeriodeOpties.eersteDagOfVolgende
    //             : PeriodeOpties.volgende,
    //         maanden: hypotheek.periodeInMaanden);

    //     HerFinancieren? herFinanciering = map[startDatumVolgendeLening];

    //     if (herFinanciering != null) {
    //       herFinanciering
    //         ..ids.add(hypotheek.id)
    //         ..restSchuld += hypotheek.restSchuld;
    //     } else {
    //       map[hypotheek.eindDatum] = HerFinancieren(
    //           datum: startDatumVolgendeLening,
    //           id: hypotheek.id,
    //           restSchuld: hypotheek.restSchuld);
    //     }
    //   }
    // }

    // return map.values.toList();
  }

  static DateTime eersteKalenderDatum(
      HypotheekDossier hd, Hypotheek hypotheek) {
    return Kalender.voegPeriodeToe(DateTime.now(),
        jaren: -40, periodeOpties: PeriodeOpties.volgende);
  }

  static DateTime laatsteKalenderDatum(
      HypotheekDossier hypotheekDossier, Hypotheek hypotheek) {
    int jaar = hypotheek.startDatum.year;
    int maand = hypotheek.startDatum.month;
    int maxJaren = maxTermijnenInMaanden(hypotheekDossier, hypotheek) ~/ 12;

    return DateTime(jaar + maxJaren, maand,
        Kalender.dagenPerMaand(jaar: jaar + maxJaren, maand: maand));
  }

  static int maxTermijnenInMaanden(
    HypotheekDossier hypotheekDossier,
    Hypotheek hypotheek,
  ) {
    if (hypotheek.vorige.isNotEmpty) {
      final vorigeHypotheek = hypotheekDossier.hypotheken[hypotheek.vorige]!;
      return vorigeHypotheek.aflosTermijnInMaanden -
          vorigeHypotheek.periodeInMaanden;
    } else {
      if (hypotheekDossier.starter) {
        for (String id in hypotheekDossier.eersteHypotheken) {
          if (id != hypotheek.id &&
              hypotheekDossier.hypotheken[id]!.startDatum
                      .compareTo(hypotheek.startDatum) <
                  0) {
            return 30 * 12;
          }
        }
        return 40 * 12;
      } else {
        return 30 * 12;
      }
    }
  }

  static (HypotheekDossier, Hypotheek hypotheek, IList<StatusLening>)
      statusParralleleLeningen(
          {required DateTime datum,
          required HypotheekDossier hypotheekDossier,
          required Hypotheek hypotheek}) {
    IList<StatusLening>? statusLeningen =
        hypotheek.dStatusParralleleLeningen[datum];

    if (statusLeningen != null) {
      return (hypotheekDossier, hypotheek, statusLeningen);
    }

    List<StatusLening> list = [];

    Iterable<Hypotheek> parallelHypotheken =
        HypotheekIterator.parallelStartDatum(
            hypotheekDossier, hypotheek, datum);

    for (Hypotheek h in parallelHypotheken) {
      Termijn? termijn;

      for (Termijn t in h.termijnen) {
        if (t.startDatum.compareTo(datum) <= 0) {
          termijn = t;
        } else {
          break;
        }
      }

      if (termijn != null) {
        // double verduurzamenKosten;
        // double verbouwKosten;

        // if (startDatum.compareTo(h.startDatum) == 0) {
        //   verbouwKosten = h.verbouwVerduurzaamKosten.totaleKosten;
        //   verduurzamenKosten = h.verbouwVerduurzaamKosten.verduurzaamKosten;
        // } else {
        //   verduurzamenKosten = 0.0;
        //   verbouwKosten = 0.0;
        // }

        final periode = termijn.periode;
        final periodesTotVolgendeRente = termijn.periodesTotVolgendeRente;
        final aflosTermijnInMaanden = h.aflosTermijnInMaanden;
        final rente = termijn.rente;

        final statusLening = StatusLening(
          id: h.id,
          hypotheekVorm: h.hypotheekvorm,
          lening: termijn.lening,
          periode: periode,
          rente: rente,
          periodesTotVolgendeRente: periodesTotVolgendeRente,
          toetsRente:
              (periode + periodesTotVolgendeRente + 1 == aflosTermijnInMaanden)
                  ? rente
                  : FinancieringsLast.toetsRente(
                      periodesMnd: periodesTotVolgendeRente, rente: rente),
          aflosTermijnInMaanden: aflosTermijnInMaanden,
          verduurzaamKosten: 0.0,
          verbouwKosten: 0.0,
        );

        list.add(statusLening);
      }
    }
    statusLeningen = list.lock;

    hypotheek = hypotheek.copyWith(
        dStatusParralleleLeningen:
            hypotheek.dStatusParralleleLeningen.add(datum, statusLeningen));

    hypotheekDossier = hypotheekDossier.copyWith(
        hypotheken: hypotheekDossier.hypotheken.add(hypotheek.id, hypotheek));

    return (hypotheekDossier, hypotheek, statusLeningen);
  }

  static DateTime eindDatumDeelsAfgelosteLening(Hypotheek hypotheek) {
    final huidigeDatum = Kalender.datumAlleen(DateTime.now());

    assert(hypotheek.periodeInMaanden - 2 >= 0,
        'Aantal maanden in PeriodeInMaanden is kleiner dan 2, aparte datum voor lening is daarom niet mogelijk!');

    final maanden = hypotheek.periodeInMaanden - 2 >= 0
        ? hypotheek.periodeInMaanden - 2
        : 0;

    final eindDatum = Kalender.voegPeriodeToe(hypotheek.startDatum,
        maanden: maanden, periodeOpties: PeriodeOpties.eind);

    if (huidigeDatum.compareTo(eindDatum) < 0) {
      return huidigeDatum;
    }
    return eindDatum;
  }

  // TODO Norm vergelijken
  // static Norm limiterendeNorm(Hypotheek hypotheek) {
  //   Norm vergelijk(Norm eerste, Norm tweede) {
  //     bool eersteVergelijken = eerste.toepassen && !eerste.fout;
  //     bool tweedeVergelijken = tweede.toepassen && !tweede.fout;

  //     if (eersteVergelijken && tweedeVergelijken) {
  //       return (eerste.normLening < tweede.normLening) ? eerste : tweede;
  //     } else if (eersteVergelijken) {
  //       return eerste;
  //     } else if (tweedeVergelijken) {
  //       return tweede;
  //     } else {
  //       return eerste;
  //     }
  //   }

  //   return vergelijk(
  //       vergelijk(hypotheek.normInkomen, hypotheek.normWoningwaarde),
  //       hypotheek.normNhg);
  // }

  // TODO Norm vergelijken
  // static double maxLening(Hypotheek hypotheek) {
  //   final norm = limiterendeNorm(hypotheek);
  //   return (norm.toepassen && !norm.fout) ? norm.normLening : 0.0;
  // }

  static List<Waarde> suggestieKosten(
      {DateTime? datum,
      required HypotheekDossier hypotheekDossier,
      required Hypotheek hypotheek}) {
    List<Waarde> resterend = [];

    IList<Waarde> lijst =
        hypotheekDossier.dKosten[datum ?? hypotheek.startDatum]?.kosten ??
            const IListConst([]);

    // TODO NHG toepassen
    List<Waarde> suggestieLijst = KostenWoningLening.lijstSuggestieKosten(
        overdrachtBelasting: true, nhg: false); //hypotheek.normNhg.toepassen);

    for (Waarde w in suggestieLijst) {
      int i = 0;
      if (lijst.indexWhere((Waarde aanwezig) {
            print('i ${i++} id: w:${w.id} lijst: ${aanwezig.id} ');
            return aanwezig.id == w.id;
          }) ==
          -1) {
        resterend.add(w);
      }
    }
    return resterend..add(KostenWoningLening.leegKosten);
  }
}
