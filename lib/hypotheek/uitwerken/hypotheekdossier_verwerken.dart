import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import '../../gereedschap/kalender.dart';
import '../gegevens/extra_of_kosten_lening/extra_of_kosten_lening.dart';
import '../gegevens/hypotheek/hypotheek.dart';
import '../gegevens/hypotheek_dossier/hypotheek_dossier.dart';

class HypotheekDossierVerwerken {
  static DateTime beginDatumWoningKopen() =>
      Kalender.datumAlleen(DateTime.now());

  static DateTime eindDatumWoningKopen() =>
      Kalender.voegPeriodeToe(DateTime.now(),
          jaren: 5, periodeOpties: PeriodeOpties.volgende);

  /// Eigenwoningreserve
  ///
  ///
  ///
  ///
  ///
  ///
  static bool eigenwoningReserveOptie(HypotheekDossier? hd) {
    if (hd == null) return false;

    return !hd.starter &&
        (hd.inkomensNormToepassen || hd.woningWaardeNormToepassen);
  }

  static bool eigenwoningReserveZichtbaar(HypotheekDossier? hd) {
    if (hd == null) return false;

    return !hd.starter &&
        (hd.inkomensNormToepassen || hd.woningWaardeNormToepassen) &&
        hd.ewrToepassen;
  }

  /// Hypotheek verwijderen
  ///
  ///
  ///
  ///
  ///

  static (HypotheekDossier hypotheekDossier, bool vervolgVerwijderd)
      hypotheekVerwijderen(
          HypotheekDossier hypotheekDossier, Hypotheek hypotheek) {
    final eersteHypotheken =
        hypotheekDossier.eersteHypotheken.remove(hypotheek.id);

    IMap<String, Hypotheek> hypotheken = hypotheekDossier.hypotheken;

    if (hypotheek.vorige.isNotEmpty) {
      hypotheken = hypotheken.add(hypotheek.vorige,
          hypotheken[hypotheek.vorige]!.copyWith(volgende: ''));
    }

    Hypotheek? next = hypotheek;

    while (next != null) {
      hypotheken = hypotheken.remove(next.id);
      next = hypotheken[hypotheek.volgende];
    }

    hypotheekDossier = hypotheekDossier.copyWith(
        eersteHypotheken: eersteHypotheken, hypotheken: hypotheken);

    return (hypotheekDossier, hypotheek.volgende.isNotEmpty);
  }

  /// Suggestie kostenlijst
  ///
  ///
  ///
  ///
  ///

  static List<Waarde> suggestieKosten(HypotheekDossier hd) {
    List<Waarde> resterend = [];
    IList<Waarde> lijst = hd.kosten;
    List<Waarde> suggestieLijst = suggestieKostenVorigeWoning;

    for (Waarde w in suggestieLijst) {
      if (lijst.indexWhere((Waarde aanwezig) => aanwezig.id == w.id) == -1) {
        resterend.add(w);
      }
    }
    return resterend..add(leegKosten);
  }

  /// Kosten
  ///
  ///
  ///
  ///
  ///

  static const suggestieKostenVorigeWoning = <Waarde>[
    Waarde(
        id: 'makelaar',
        omschrijving: 'makelaar',
        getal: 3000.0,
        eenheid: Eenheid.bedrag,
        standaard: true),
    Waarde(
        id: 'energielabel',
        omschrijving: 'energielabel',
        getal: 200.0,
        eenheid: Eenheid.bedrag,
        standaard: true),
    Waarde(
        id: 'advertentie',
        omschrijving: 'advertentie',
        getal: 150.0,
        eenheid: Eenheid.bedrag,
        standaard: true),
  ];

  static const leegKosten = Waarde(
      id: 'eigen',
      omschrijving: '',
      getal: 0.0,
      eenheid: Eenheid.bedrag,
      standaard: false,
      aftrekbaar: false,
      verduurzamen: false);
}
