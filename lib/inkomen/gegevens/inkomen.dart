import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:math' as math;

// required: associates our `main.dart` with the code generated by Freezed
part 'inkomen.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'inkomen.g.dart';

enum PeriodeInkomen { maand, jaar }

@freezed
class InkomensOverzicht with _$InkomensOverzicht {
  const InkomensOverzicht._();

  const factory InkomensOverzicht(
          {@Default(IListConst([])) IList<Inkomen> inkomen,
          @Default(IListConst([])) IList<Inkomen> inkomenPartner}) =
      _InkomensOverzicht;

  factory InkomensOverzicht.fromJson(Map<String, Object?> json) =>
      _$InkomensOverzichtFromJson(json);

  IList<Inkomen> lijst({required bool partner}) =>
      partner ? inkomenPartner : inkomen;
}

@freezed
class Inkomen with _$Inkomen {
  const Inkomen._();

  const factory Inkomen({
    required DateTime datum,
    required bool partner,
    required double indexatie,
    required bool pensioen,
    required PeriodeInkomen periodeInkomen,
    required double brutoInkomen,
    required bool dertiendeMaand,
    required bool vakantiegeld,
  }) = _Inkomen;

  factory Inkomen.fromJson(Map<String, Object?> json) =>
      _$InkomenFromJson(json);

  double get totaalBrutoJaar =>
      (periodeInkomen == PeriodeInkomen.jaar
          ? brutoInkomen
          : (brutoInkomen * 12.0 + (pensioen ? 0.0 : bedragDertiendeMaand))) +
      bedragVakantiegeld;

  double get bedragVakantiegeld => vakantiegeld
      ? ((periodeInkomen == PeriodeInkomen.jaar
              ? brutoInkomen
              : brutoInkomen * 12.0) *
          0.08)
      : 0.0;

  double indexatieTotaalBrutoJaar(DateTime date) {
    int diffYears = math.max(0, date.year - datum.year);

    return totaalBrutoJaar * math.pow(1.0 + indexatie / 100.0, diffYears);
  }

  double get bedragDertiendeMaand =>
      (dertiendeMaand && periodeInkomen == PeriodeInkomen.maand)
          ? brutoInkomen
          : 0.0;
}
