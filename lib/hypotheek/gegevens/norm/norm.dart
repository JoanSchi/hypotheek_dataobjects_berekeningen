import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'norm.freezed.dart';
part 'norm.g.dart';

@freezed
sealed class Norm with _$Norm {
  const Norm._();

  const factory Norm.normInkomen({
    @Default(false) bool fout,
    @Default(IListConst([])) IList<String> berichten,
    @Default(0) int periode,
    @Default(0.0) double toetsRenteGemiddeld,
    @Default(0.0) double teLenen,
    @Default(0.0) double normLening,
    @Default(0.0) double extraMaandLast,
  }) = NormInkomen;

  const factory Norm.normWoningWaarde({
    @Default(false) bool fout,
    @Default(IListConst([])) IList<String> berichten,
    @Default(0.0) double normLening,
    @Default(0.0) double verduurzaam,
    @Default(0.0) double teLenen,
  }) = NormWoningWaarde;

  const factory Norm.normNhg({
    @Default(false) bool fout,
    @Default(IListConst([])) IList<String> berichten,
    @Default(0.0) double normLening,
    @Default(0.0) double verduurzaam,
    @Default(0.0) double teLenen,
  }) = NormNhg;

  factory Norm.fromJson(Map<String, Object?> json) => _$NormFromJson(json);

  // double get normLening {
  //   return switch (this) {
  //      normInkomen.normLening,
  //     (NormWoningwaarde normWoningwaarde) => normWoningwaarde.normLening,
  //     (NormNhg normNhg) => normNhg.normLening,
  //   };
  // }
}

@freezed
class InkomensNormOpDatum with _$InkomensNormOpDatum {
  const factory InkomensNormOpDatum({
    required DateTime datum,
    required double toetsRenteGemiddeld,
    required int periode,
    required double teLenen,
    required double normLening,
    @Default(0.0) double verduurzamen,
    @Default(NormLabel()) NormLabel normLabel,
  }) = _InkomensNormOpDatum;

  factory InkomensNormOpDatum.fromJson(Map<String, Object?> json) =>
      _$InkomensNormOpDatumFromJson(json);
}

//pagina 46 Nibud 2023

@freezed
class NormLabel with _$NormLabel {
  const factory NormLabel({
    @Default(0) int jaar,
    @Default('') String label,
    @Default(0.0) double extraMaandLast,
  }) = _NormLabel;

  factory NormLabel.fromJson(Map<String, Object?> json) =>
      _$NormLabelFromJson(json);
}
