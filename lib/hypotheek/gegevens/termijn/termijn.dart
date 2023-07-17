import 'package:freezed_annotation/freezed_annotation.dart';

import '../hypotheek/hypotheek.dart';

part 'termijn.freezed.dart';
part 'termijn.g.dart';

@freezed
class Termijn with _$Termijn {
  const Termijn._();

  const factory Termijn({
    required DateTime startPeriode,
    required DateTime eindPeriode,
    required DateTime startDatum,
    required DateTime eindDatum,
    required HypotheekVorm hypotheekVorm,
    required double rente,
    required double renteBedrag,
    required double lening,
    required double aflossen,
    required double extraAflossen,
    required double extraLenen,
    required int periode,
    required int periodesTotVolgendeRente,
    required double aflossenTotaal,
    required double renteTotaal,
    required double extraLenenTotaal,
    required bool laatsteTermijn,
    required bool laatsteVanPeriode,
  }) = _Termijn;

  factory Termijn.fromJson(Map<String, Object?> json) =>
      _$TermijnFromJson(json);

  // int get dagen => diffDays(eindDatum, startDatum); //+1

  // int get dagenInPeriode => diffDays(eindPeriode, startPeriode); //+1

  // double get ratio => dagen / dagenInPeriode;

  // bool get isStartPeriode => DateUtils.isSameDay(startDatum, startPeriode);

  // bool get isEndPeriode => DateUtils.isSameDay(eindDatum, eindPeriode);

  double get leningNaAflossen => lening - aflossen - extraAflossen;
}
