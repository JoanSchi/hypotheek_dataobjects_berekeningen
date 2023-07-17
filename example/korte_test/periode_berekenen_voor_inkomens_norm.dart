import 'package:hypotheek_dataobjects_berekeningen/gereedschap/kalender.dart';

main() {
  periodeAanpassingInkomen(
      startDatum: DateTime(2022, 5, 15),
      datumInkomen: DateTime(2022, 5, 14),
      perMaand: true,
      verwacht: 0);

  periodeAanpassingInkomen(
      startDatum: DateTime(2022, 5, 15),
      datumInkomen: DateTime(2022, 7, 1),
      perMaand: true,
      verwacht: 1);

  periodeAanpassingInkomen(
      startDatum: DateTime(2022, 5, 15),
      datumInkomen: DateTime(2022, 7, 1),
      perMaand: false,
      verwacht: 1);

  periodeAanpassingInkomen(
      startDatum: DateTime(2022, 5, 1),
      datumInkomen: DateTime(2022, 7, 1),
      perMaand: true,
      verwacht: 2);

  periodeAanpassingInkomen(
      startDatum: DateTime(2022, 5, 1),
      datumInkomen: DateTime(2022, 7, 1),
      perMaand: false,
      verwacht: 2);
}

periodeAanpassingInkomen(
    {required DateTime startDatum,
    required DateTime datumInkomen,
    required bool perMaand,
    required int verwacht}) {
  DateTime startPeriode = (perMaand && startDatum.day > 1)
      ? Kalender.voegPeriodeToe(startDatum,
          maanden: 1, periodeOpties: PeriodeOpties.eersteDag)
      : startDatum;

  final delta = (datumInkomen.compareTo(startPeriode) <= 0)
      ? 0
      : (Kalender.deltaMaanden(startPeriode, datumInkomen) +
          (startPeriode.day <= datumInkomen.day ? 0 : -1));

  print('delta: $delta, verwacht: $verwacht, perMaand: $perMaand');
}
