// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import '../../gereedschap/datum_id.dart';
import '../../gereedschap/kalender.dart';
import '../../schulden/gegevens/schulden.dart';
import '../financierings_norm/bereken_norm_woningwaarde.dart';
import '../financierings_norm/norm_inkomen/bereken_norm_inkomen.dart';
import '../financierings_norm/norm_nhg/norm_nhg.dart';
import '../gegevens/gedeeld/kosten_woning_lening.dart';
import '../gegevens/gedeeld/woningwaarde.dart';
import '../gegevens/gedeeld/woningwaarde.dart';
import '../gegevens/hypotheek/hypotheek.dart';
import '../gegevens/hypotheek_dossier/hypotheek_dossier.dart';
import '../gegevens/norm/norm.dart';
import '../gegevens/norm/norm_inkomen/inkomens_op_datum.dart';
import '../gegevens/norm/normen_toepassen.dart';
import '../gegevens/vervolg_lening/vervolg_lening.dart';
import 'hypotheek_iterator.dart';
import 'hypotheek_termijnen.dart';
import 'hypotheek_verwerken.dart';

class HypotheekBewerken {
  static (
    HypotheekDossier hypotheekDossier,
    String id,
  ) nieuw(
      {required HypotheekDossier vorigeHypotheekDossier,
      required List<InkomenOpDatum> inkomensOpDatum,
      required List<LeningVerlengen> teVerlengen,
      required List<HerFinancieren> teHerFinancieren}) {
    String hypotheekId = DatumId.toDayIdToString(
        vorigeHypotheekDossier.hypotheken.keys,
        toString: (String v) => v);

    double lening =
        teVerlengen.firstOrNull?.hypotheek.termijnen.last.lening ?? 188000;

    double rente = 5.0;
    double boeteVrijAflossen = 10.0;
    int aflosTermijnInMaanden = (vorigeHypotheekDossier.starter ? 40 : 30) * 12;
    int periodeInMaanden = 10 * 12;
    bool periodePerMaand = true;

    DateTime startDatum = Kalender.voegPeriodeToe(DateTime.now(),
        maanden: 3, periodeOpties: PeriodeOpties.eersteDag);

    DateTime datumDeelsAfgelosteLening = startDatum;

    const hypotheekVorm = HypotheekVorm.annuiteit;

    var (dWoningWaarde, woningWaarde) = opDatumOphalenToevoegen<WoningWaarde>(
        vorigeHypotheekDossier.dWoningWaarde, startDatum,
        eerder: true);

    var (dNormenToepassen, _) = opDatumOphalenToevoegen<NormenToepassen>(
        vorigeHypotheekDossier.dNormenToepassen, startDatum, nieuw: () {
      bool inkomenToepassen = switch (inkomensOpDatum.firstOrNull?.datum) {
        (DateTime datum) => datum.compareTo(startDatum) <= 0,
        (_) => false
      };

      return NormenToepassen(
          inkomen: inkomenToepassen, woningWaarde: woningWaarde != null);
    }, eerder: true);

    final hypotheekTermijnen = HypotheekTermijnen(
      hoofdsom: lening,
      rente: rente,
      startDatum: startDatum,
      // datumLening: DateTime(2023, 4, 15),
      hypotheekVorm: HypotheekVorm.annuiteit,
      aflosTermijnInMaanden: aflosTermijnInMaanden,
      periodeInMaanden: periodeInMaanden,
      eersteGebrokenMaandAlleenRente: true,
      perMaand: true,
      // extraAflossen: extraAflossen,
      // extraLenen: extraLenen,
      // renteVanafPeriode: renteVanafPeriode
    );

    Hypotheek hypotheek = Hypotheek(
        id: hypotheekId,
        omschrijving: 'omschrijving',
        optiesHypotheekToevoegen: OptiesHypotheekToevoegen.nieuw,
        lening: lening,
        gewensteLening: lening,
        startDatum: startDatum,
        eindDatum: hypotheekTermijnen.eindDatum,
        periodeInMaanden: periodeInMaanden,
        aflosTermijnInMaanden: aflosTermijnInMaanden,
        hypotheekvorm: hypotheekVorm,
        rente: rente,
        boeteVrijPercentage: boeteVrijAflossen,
        // normInkomen: normInkomen,
        // normWoningwaarde: normWoningwaarde,
        minLening: 1000,
        termijnen: hypotheekTermijnen.termijnen.lock,
        restSchuld: hypotheekTermijnen.restSchuld,
        // datumNormGegevens: startDatum,
        deelsAfgelosteLening: false,
        datumDeelsAfgelosteLening: datumDeelsAfgelosteLening,
        afgesloten: false,
        eersteGebrokenMaandAlleenRente: true,
        periodePerMaand: periodePerMaand);

    HypotheekDossier hypotheekDossier = vorigeHypotheekDossier.copyWith(
        dNormenToepassen: dNormenToepassen,
        dWoningWaarde: dWoningWaarde,
        eersteHypotheken:
            vorigeHypotheekDossier.eersteHypotheken.add(hypotheekId),
        hypotheken:
            vorigeHypotheekDossier.hypotheken.add(hypotheekId, hypotheek));

    (hypotheekDossier, hypotheek) = vergelijkTmHypotheekEnBereken(
        vorigeHypotheekDossier: vorigeHypotheekDossier,
        hypotheekDossier: hypotheekDossier,
        hypotheek: hypotheek,
        inkomensOpDatum: inkomensOpDatum,
        zetMaximaleLening: true);

    return (
      hypotheekDossier,
      hypotheek.id,
    );
  }

  /// Object ophalen op datum en als niet aanwezig toevoegen aan de IMap
  ///
  ///
  ///
  ///
  ///

  static (IMap<DateTime, T> map, T? value)
      opDatumOphalenToevoegen<T extends Object>(
          IMap<DateTime, T> map, DateTime datum,
          {T Function()? nieuw,
          T Function(T)? aanpassen,
          bool eerder = false}) {
    T? value = map[datum];

    if (eerder && value == null) {
      for (var MapEntry(key: d, value: v) in map.entries) {
        if (d.compareTo(datum) < 0) {
          value = v;
        }
      }
      if (aanpassen == null && value != null) {
        return (map.add(datum, value), value);
      }
    }

    if (nieuw != null && value == null) {
      value = nieuw();
      return (map.add(datum, value), value);
    }

    if (aanpassen != null && value != null) {
      return (map.add(datum, aanpassen(value)), value);
    }

    return (map, value);
  }

  static T? opDatumOphalen<T>(
    IMap<DateTime, T> map, {
    Hypotheek? hypotheek,
    DateTime? datum,
  }) {
    datum = hypotheek?.startDatum ?? datum;
    return datum == null ? null : map[datum];
  }

  /// Aanpassen Verlengen
  ///
  ///
  ///
  ///
  ///

  static (HypotheekDossier hypotheekDossier, Hypotheek hypotheek)
      aanpassenVerlengen(
          {required HypotheekDossier hypotheekDossier,
          required Hypotheek hypotheek,
          String? vorige,
          OptiesHypotheekToevoegen? optiesHypotheekToevoegen}) {
    vorige = switch (optiesHypotheekToevoegen) {
      OptiesHypotheekToevoegen.verlengen =>
        HypotheekVerwerken.teVerlengenHypotheek(hypotheekDossier, hypotheek.id)
                .firstOrNull
                ?.id ??
            '',
      OptiesHypotheekToevoegen.nieuw => '',
      (_) => vorige ?? ''
    };

    optiesHypotheekToevoegen ??= hypotheek.optiesHypotheekToevoegen;

    if (vorige != hypotheek.vorige) {
      IList<String> eersteHypotheken = hypotheekDossier.eersteHypotheken;
      IMap<String, Hypotheek> hypotheken = hypotheekDossier.hypotheken;
      DateTime startDatum = hypotheek.startDatum;

      if (hypotheek.vorige.isNotEmpty) {
        hypotheken = hypotheken.add(hypotheek.vorige,
            hypotheken[hypotheek.vorige]!.copyWith(volgende: ''));
      }

      if (vorige.isEmpty) {
        if (!hypotheekDossier.eersteHypotheken.contains(hypotheek.id)) {
          eersteHypotheken = eersteHypotheken.add(hypotheek.id);
        }
      } else {
        eersteHypotheken =
            hypotheekDossier.eersteHypotheken.remove(hypotheek.id);

        final vorigeHypotheek = hypotheken[vorige]!;

        startDatum = Kalender.voegPeriodeToe(vorigeHypotheek.startDatum,
            maanden: vorigeHypotheek.periodeInMaanden,
            periodeOpties: PeriodeOpties.volgende);

        hypotheken = hypotheken.add(
            vorige, vorigeHypotheek.copyWith(volgende: hypotheek.id));
      }

      hypotheek = hypotheek.copyWith(
        optiesHypotheekToevoegen: optiesHypotheekToevoegen,
        vorige: vorige,
        // startDatum: startDatum
      );
      hypotheken = hypotheken.add(hypotheek.id, hypotheek);

      hypotheekDossier = hypotheekDossier.copyWith(
          eersteHypotheken: eersteHypotheken, hypotheken: hypotheken);

      //Datum Aanpassen

      (hypotheekDossier, hypotheek) = datumAanpassen(
          hypotheekDossier: hypotheekDossier,
          hypotheek: hypotheek,
          startDatum: startDatum);
    }
    assert(debugHypotheekDossier(hypotheekDossier),
        'Fout in de functie aanpassenVerlengen');
    return (hypotheekDossier, hypotheek);
  }

  static bool debugHypotheekDossier(HypotheekDossier hypotheekDossier) {
    bool error = false;

    for (var MapEntry(key: id, value: hypotheek)
        in hypotheekDossier.hypotheken.entries) {
      if (id.isEmpty) {
        error = true;
        print('key id in hypotheken map isEmpty: id hypotheek ${hypotheek.id}');
      }
    }
    return !error;
  }

  static double woningWaardeOpDatum(
      {DateTime? datum,
      required HypotheekDossier hypotheekDossier,
      Hypotheek? hypotheek}) {
    assert(datum != null || hypotheek != null,
        'WoningWaardeOpDatum: Datum en Hypotheek kunnen niet beide null zijn!');

    datum ??= hypotheek?.startDatum;

    return datum == null
        ? 0.0
        : hypotheekDossier.dWoningWaarde[datum]?.waarde ?? 0.0;

    // if (datum == null) {
    //   return 0.0;
    // } else {
    //   double? waarde = hypotheekDossier.dWoningWaarde[datum]?.waarde;

    //   if (waarde == null) {
    //     for (var MapEntry<DateTime, WoningWaarde>(key: d, value: w)
    //         in hypotheekDossier.dWoningWaarde.entries) {
    //       if (d.compareTo(datum) < 0) {
    //         break;
    //       }
    //       waarde = w.waarde;
    //     }
    //   }
    //   return waarde ?? 0.0;
    // }
  }

  static double totaleKosten(
      {required HypotheekDossier hypotheekDossier, Hypotheek? hypotheek}) {
    final h = hypotheek;

    return h == null
        ? 0.0
        : hypotheekDossier.dKosten[h.startDatum]?.totaleKosten(
                woningWaarde: woningWaardeOpDatum(
                    hypotheek: h, hypotheekDossier: hypotheekDossier),
                lening: h.lening) ??
            0.0;
  }

  static (bool toepasbaar, double? max) nhgToepasbaarAankoopBedrag(
      {required HypotheekDossier hypotheekDossier, Hypotheek? hypotheek}) {
    if (hypotheek == null) {
      return (false, null);
    } else {
      double woningWaarde = woningWaardeOpDatum(
          hypotheekDossier: hypotheekDossier, hypotheek: hypotheek);
      double? nghBedrag =
          NhgNormTabel.nhgNorm(hypotheek.startDatum)?.aankoopBedrag;
      return (woningWaarde <= (nghBedrag ?? -1.0), nghBedrag);
    }
  }

  ///
  ///
  ///
  ///
  ///

  static (HypotheekDossier, Hypotheek) berekenNormInkomen({
    required HypotheekDossier hypotheekDossier,
    required Hypotheek hypotheek,
    required List<InkomenOpDatum> inkomensOpDatum,
    required IList<Schuld> schulden,
  }) {
    return BerekenNormInkomen.hypotheek(
            inkomensOpDatum: inkomensOpDatum,
            schulden: schulden,
            hypotheekDossier: hypotheekDossier,
            hypotheek: hypotheek)
        .bereken();
    // NormInkomen normInkomen = BerekenNormInkomen(
    //   perMaand: periodePerMaand,
    //   inkomen: inkomen,
    //   inkomenPartner: inkomenPartner,
    //   schulden: schulden,
    //   startDatum: startDatum,
    //   hypotheekDossier: hypotheekDossier,
    //   hypotheekVorm: hypotheekVorm,
    //   aflosTermijnInMaanden: aflosTermijnInMaanden,
    //   periodeInMaanden: periodeInMaanden,
    //   rente: rente,
    //   renteVanafPeriode: const IListConst([]),
    //   statusParalleleLeningenOpDatum: statusParalleleLeningenOpDatum,
    //   erw: 0.0,
    // ).bereken();
  }

  static (HypotheekDossier, Hypotheek) vergelijkTmHypotheekEnBereken(
      {required HypotheekDossier vorigeHypotheekDossier,
      required HypotheekDossier hypotheekDossier,
      required Hypotheek hypotheek,
      required List<InkomenOpDatum> inkomensOpDatum,
      required bool zetMaximaleLening}) {
    final Iterator<Hypotheek> vorigeIt =
        HypotheekIterator.all(vorigeHypotheekDossier).iterator;
    final Iterator<Hypotheek> it =
        HypotheekIterator.all(hypotheekDossier).iterator;

    bool bereken = false;

    while (it.moveNext()) {
      Hypotheek n = it.current;

      if (!bereken) {
        if (n.id == hypotheek.id) {
          bereken = true;
        }

        if (vorigeIt.moveNext()) {
          Hypotheek v = vorigeIt.current;

          if (n != v ||
              !_datumItemsHypotheekDossierGelijk(
                  vorigeHypotheekDossier, hypotheekDossier, hypotheek)) {
            bereken = true;
          }
        } else {
          bereken = true;
        }
      }

      if (bereken) {
        (hypotheekDossier, hypotheek) = _berekeningen(
            hypotheekDossier: hypotheekDossier,
            hypotheek: hypotheek,
            inkomensOpDatum: inkomensOpDatum,
            zetMaximaleLening:
                n.id == hypotheek.id ? zetMaximaleLening : false);
      }

      if (n.id == hypotheek.id) {
        break;
      }
    }
    return (hypotheekDossier, hypotheek);
  }

  static bool _datumItemsHypotheekDossierGelijk(
      HypotheekDossier vorigeHypotheekDossier,
      HypotheekDossier hypotheekDossier,
      Hypotheek v) {
    final datum = v.startDatum;
    final normenToepassen = hypotheekDossier.dNormenToepassen[datum];
    final normWoningWaarde = normenToepassen?.woningWaarde ?? false;

    return vorigeHypotheekDossier.dNormenToepassen[datum] == normenToepassen &&
        (!normWoningWaarde ||
            vorigeHypotheekDossier.dWoningWaarde[datum] ==
                hypotheekDossier.dWoningWaarde[datum]) &&
        vorigeHypotheekDossier.dKosten[datum] ==
            hypotheekDossier.dKosten[datum];
  }

  static (HypotheekDossier hypotheekDossier, Hypotheek hypotheek) _berekeningen(
      {HypotheekDossier? vorige,
      required HypotheekDossier hypotheekDossier,
      required Hypotheek hypotheek,
      required List<InkomenOpDatum> inkomensOpDatum,
      required bool zetMaximaleLening}) {
    List<Norm> financieringsNorm = [];

    assert(hypotheekDossier.dNormenToepassen[hypotheek.startDatum] != null,
        'NormToepassen object niet gevonden voor startdatum: ${hypotheek.startDatum}');

    /// Verwijder afhankelijke berekeningen
    ///
    ///
    ///
    ///

    final int aflosTermijnenInMaanden = switch ((
      hypotheek.aflosTermijnInMaanden,
      HypotheekVerwerken.maxTermijnenInMaanden(hypotheekDossier, hypotheek)
    )) {
      (int termijnen, int maxTermijnen) when termijnen > maxTermijnen =>
        maxTermijnen,
      (int termijnen, _) => termijnen
    };

    int periodeInMaanden = hypotheek.periodeInMaanden <= aflosTermijnenInMaanden
        ? hypotheek.periodeInMaanden
        : aflosTermijnenInMaanden;

    hypotheek = hypotheek.copyWith(
        aflosTermijnInMaanden: aflosTermijnenInMaanden,
        periodeInMaanden: periodeInMaanden,
        dNormInkomen: const IMapConst({}),
        dNormNhg: const IMapConst({}),
        dNormWoningWaarde: const IMapConst({}),
        dStatusParralleleLeningen: const IMapConst({}),
        termijnen: const IListConst([]),
        restSchuld: 0.0,
        lening: 0.0);

    hypotheekDossier = hypotheekDossier.copyWith(
        hypotheken: hypotheekDossier.hypotheken.add(hypotheek.id, hypotheek));

    if (aflosTermijnenInMaanden <= 0) {
      return (hypotheekDossier, hypotheek);
    }

    ///
    ///
    ///

    double gewensteLening = hypotheek.vorige.isEmpty
        ? hypotheek.gewensteLening
        : hypotheekDossier.hypotheken[hypotheek.vorige]!.restSchuld;
    double teLenen = gewensteLening;
    double? maxLening;

    if (!hypotheek.afgesloten) {
      final normToepassen =
          hypotheekDossier.dNormenToepassen[hypotheek.startDatum] ??
              NormenToepassen();

      /// Norm Inkomen
      ///
      if (normToepassen.inkomen) {
        (hypotheekDossier, hypotheek) = BerekenNormInkomen.hypotheek(
                inkomensOpDatum: inkomensOpDatum,
                schulden: const IListConst([]),
                hypotheekDossier: hypotheekDossier,
                hypotheek: hypotheek)
            .bereken();

        switch (hypotheek.dNormInkomen[hypotheek.startDatum]) {
          case (NormInkomen normInkomen):
            {
              financieringsNorm.add(normInkomen);
              break;
            }
        }
      }

      /// Norm WoningWaarde
      ///
      if (normToepassen.woningWaarde) {
        (hypotheekDossier, hypotheek) = BerekenNormWoningWaarde(
                hypotheekDossier: hypotheekDossier, hypotheek: hypotheek)
            .bereken();

        switch (hypotheek.dNormWoningWaarde[hypotheek.startDatum]) {
          case (NormWoningWaarde normWoningWaarde):
            {
              financieringsNorm.add(normWoningWaarde);
              break;
            }
        }
      }

      if (financieringsNorm.isNotEmpty) {
        for (Norm norm in financieringsNorm) {
          if (!norm.fout && norm.teLenen < (maxLening ?? double.maxFinite)) {
            maxLening = norm.teLenen;
          }
        }

        if (maxLening != null) {
          if (hypotheek.gewensteLening > maxLening) {
            teLenen = maxLening;
          } else if (zetMaximaleLening) {
            teLenen = maxLening;
            gewensteLening = maxLening;
          }
        }
      }
    }

    hypotheek = hypotheek.copyWith(
        gewensteLening: gewensteLening, maxLening: maxLening, lening: teLenen);

    hypotheekDossier = hypotheekDossier.copyWith(
        hypotheken: hypotheekDossier.hypotheken.add(hypotheek.id, hypotheek));

    final hypotheekTermijnen = HypotheekTermijnen(
      hoofdsom: hypotheek.lening,
      rente: hypotheek.rente,
      startDatum: hypotheek.startDatum,
      // datumLening: DateTime(2023, 4, 15),
      hypotheekVorm: hypotheek.hypotheekvorm,
      aflosTermijnInMaanden: hypotheek.aflosTermijnInMaanden,
      periodeInMaanden: hypotheek.periodeInMaanden,
      eersteGebrokenMaandAlleenRente: true,
      perMaand: true,
      // extraAflossen: extraAflossen,
      // extraLenen: extraLenen,
      // renteVanafPeriode: renteVanafPeriode
    )..termijnenAanmaken();

    hypotheek = hypotheek.copyWith(
        termijnen: hypotheekTermijnen.termijnen.lock,
        eindDatum: hypotheekTermijnen.eindDatum,
        restSchuld: hypotheekTermijnen.restSchuld);

    hypotheekDossier = hypotheekDossier.copyWith(
        hypotheken: hypotheekDossier.hypotheken.add(hypotheek.id, hypotheek));

    return (hypotheekDossier, hypotheek);
  }

  // static (HypotheekDossier hypotheekDossier, Hypotheek hypotheek) maxLening({
  //   required HypotheekDossier hypotheekDossier,
  //   required Hypotheek hypotheek,
  //   required bool zetMaximaleLening,
  // }) {
  //   NormenToepassen? normenToepassen = opDatumOphalen<NormenToepassen>(
  //       hypotheekDossier.dNormenToepassen,
  //       hypotheek: hypotheek);
  //   List<double> financieringsNormen = [];

  //   if (normenToepassen != null) {
  //     if (normenToepassen.inkomen) {
  //       NormInkomen? normInkomen = opDatumOphalen<NormInkomen>(
  //           hypotheek.dNormInkomen,
  //           hypotheek: hypotheek);

  //       switch (normInkomen) {
  //         case (NormInkomen n) when !n.fout:
  //           {
  //             financieringsNormen.add(n.teLenen);
  //           }
  //       }
  //     }

  //     if (normenToepassen.woningWaarde) {
  //       // TODO
  //     }
  //   }

  //   double teLenen;

  //   if (financieringsNormen.isNotEmpty) {
  //     final double maxTeLenen = financieringsNormen.fold<double>(0.0,
  //         (previousValue, norm) => previousValue < norm ? previousValue : norm);

  //     teLenen = zetMaximaleLening
  //         ? maxTeLenen
  //         : (maxTeLenen < hypotheek.gewensteLening
  //             ? maxTeLenen
  //             : hypotheek.gewensteLening);
  //   } else {
  //     teLenen = hypotheek.gewensteLening;
  //   }

  //   hypotheek = hypotheek.copyWith(lening: teLenen);

  //   hypotheekDossier = hypotheekDossier.copyWith(
  //       hypotheken: hypotheekDossier.hypotheken.add(hypotheek.id, hypotheek));

  //   return (hypotheekDossier, hypotheek);
  // }

  static double? leningGewenstOfVast(Hypotheek? hypotheek) => hypotheek == null
      ? null
      : (hypotheek.afgesloten ? hypotheek.lening : hypotheek.gewensteLening);

  static (HypotheekDossier, Hypotheek) datumAanpassen({
    required HypotheekDossier hypotheekDossier,
    required Hypotheek hypotheek,
    required DateTime startDatum,
  }) {
    final vorigeStartDatum = hypotheek.startDatum;

    if (vorigeStartDatum == startDatum) {
      return (hypotheekDossier, hypotheek);
    }

    Map<DateTime, WoningWaarde> dWoningWaarde = {};
    Map<DateTime, NormenToepassen> dNormenToepassen = {};
    Map<DateTime, KostenWoningLening> dKosten = {};
    Map<String, Hypotheek> hypotheken = {};

    final huidigeDatum = Kalender.datumAlleen(DateTime.now());

    for (Hypotheek h in HypotheekIterator.all(hypotheekDossier)) {
      DateTime vorigeDatum;
      DateTime volgendeDatum;

      if (hypotheek.id == h.id) {
        bool afgesloten = startDatum.compareTo(huidigeDatum) <= 0;

        h = h.copyWith(
            startDatum: startDatum,
            afgesloten: afgesloten,
            datumDeelsAfgelosteLening: startDatum,
            dNormInkomen: const IMapConst({}),
            dStatusParralleleLeningen: const IMapConst({}));

        vorigeDatum = vorigeStartDatum;
        volgendeDatum = startDatum;

        hypotheek = h;
      } else {
        vorigeDatum = h.startDatum;
        volgendeDatum = h.startDatum;
      }

      _verschuifDatums<WoningWaarde>(hypotheekDossier.dWoningWaarde,
          vorigeDatum, dWoningWaarde, volgendeDatum);
      _verschuifDatums<NormenToepassen>(hypotheekDossier.dNormenToepassen,
          vorigeDatum, dNormenToepassen, volgendeDatum);
      // _verschuifDatums<NormWoningwaarde>(hypotheekDossier.dNormWoningwaarde,
      //     vorigeDatum, dNormWoningwaarde, volgendeDatum);
      _verschuifDatums<KostenWoningLening>(
          hypotheekDossier.dKosten, vorigeDatum, dKosten, volgendeDatum);
      // _verschuifDatums<NormNhg>(
      //     hypotheekDossier.dNormNhg, vorigeDatum, dNormNhg, volgendeDatum);

      hypotheken[h.id] = h;
    }

    hypotheekDossier = hypotheekDossier.copyWith(
      hypotheken: hypotheken.lock,
      dWoningWaarde: dWoningWaarde.lock,
      dNormenToepassen: dNormenToepassen.lock,
      // dNormWoningwaarde: dNormWoningwaarde.lock,
      dKosten: dKosten.lock,
      // dNormNhg: dNormNhg.lock
    );

    return (hypotheekDossier, hypotheek);
  }

  static _verschuifDatums<T>(IMap<DateTime, T> vorigeMap, DateTime vorigeDatum,
      Map<DateTime, T> volgendeMap, DateTime volgendeDatum) {
    if (!volgendeMap.containsKey(volgendeDatum)) {
      final v = vorigeMap[volgendeDatum] ?? vorigeMap[vorigeDatum];
      if (v != null) volgendeMap[volgendeDatum] = v;
    }
  }
}
