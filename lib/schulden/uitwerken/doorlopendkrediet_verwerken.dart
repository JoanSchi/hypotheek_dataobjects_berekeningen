import '../../gereedschap/kalender.dart';
import '../gegevens/schulden.dart';

class DoorlopendKredietVerwerken {
  static DateTime eindDatum(DoorlopendKrediet dk) =>
      dk.heeftEindDatum && dk.eindDatumGebruiker != DateTime(0)
          ? dk.eindDatumGebruiker
          : eindBereikEindDatum(dk.beginDatum);

  static DoorlopendKrediet verandering(DoorlopendKrediet dk,
      {DateTime? beginDatum,
      bool? heeftEindDatum,
      DateTime? eindDatumGebruiker,
      double? bedrag}) {
    final bool lHeeftEindDatum = heeftEindDatum ?? dk.heeftEindDatum;
    final DateTime lBeginDatum = beginDatum ?? dk.beginDatum;
    final DateTime lEindDatumGebruiker = eindDatumInbeReik(
        lBeginDatum, eindDatumGebruiker ?? dk.eindDatumGebruiker);
    final double lBedrag = bedrag ?? dk.bedrag;

    final StatusBerekening statusBerekening =
        ((lHeeftEindDatum && lEindDatumGebruiker == DateTime(0)) ||
                Kalender.deltaMaanden(lBeginDatum, lEindDatumGebruiker) < 1 ||
                lBedrag == 0.0)
            ? StatusBerekening.nietBerekend
            : StatusBerekening.berekend;

    return dk.copyWith(
        statusBerekening: statusBerekening,
        beginDatum: lBeginDatum,
        heeftEindDatum: lHeeftEindDatum,
        eindDatumGebruiker: lEindDatumGebruiker,
        bedrag: lBedrag);
  }

  static double fictieveKredietlast(DateTime datum) {
    return 2.0;
  }

  static double maandLast(
    DoorlopendKrediet dk,
    DateTime huidige,
  ) {
    if (huidige.compareTo(dk.beginDatum) < 0 ||
        huidige.compareTo(eindDatum(dk)) > 0) {
      return 0.0;
    } else {
      return dk.bedrag / 100 * fictieveKredietlast(huidige);
    }
  }

  static DateTime beginBereikEindDatum(DateTime begin) =>
      Kalender.voegPeriodeToe(begin,
          maanden: 1, periodeOpties: PeriodeOpties.volgende);

  static DateTime eindBereikEindDatum(DateTime begin) =>
      Kalender.voegPeriodeToe(begin,
          jaren: 30, periodeOpties: PeriodeOpties.eind);

  static DateTime eindDatumInbeReik(DateTime begin, DateTime eind) {
    if (eind == DateTime(0)) {
      return eindBereikEindDatum(begin);
    }

    begin = beginBereikEindDatum(begin);

    if (begin.compareTo(eind) > 0) {
      return begin;
    }

    DateTime eindSuggestie = eindBereikEindDatum(begin);

    if (eindSuggestie.compareTo(eind) < 0) {
      return eindSuggestie;
    }

    return eind;
  }
}
