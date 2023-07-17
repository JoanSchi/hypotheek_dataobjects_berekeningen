import 'package:freezed_annotation/freezed_annotation.dart';

part 'extra_of_kosten_lening.freezed.dart';
part 'extra_of_kosten_lening.g.dart';

enum Eenheid {
  percentageTaxatie,
  percentageWoningWaarde,
  percentageLening,
  bedrag
}

@freezed
class Waarde with _$Waarde {
  const Waarde._();

  const factory Waarde({
    @Default('') String id,
    @Default('') omschrijving,
    @Default(0.0) double getal,
    @Default(Eenheid.bedrag) Eenheid eenheid,
    @Default(false) bool aftrekbaar,
    @Default(false) bool standaard,
    @Default(false) bool verduurzamen,
  }) = _Waarde;

  factory Waarde.fromJson(Map<String, Object?> json) => _$WaardeFromJson(json);

  String get key => id;
}
