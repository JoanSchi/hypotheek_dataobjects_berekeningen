import 'package:freezed_annotation/freezed_annotation.dart';

part 'rente_vanaf_periode.freezed.dart';
part 'rente_vanaf_periode.g.dart';

@freezed
class RenteVanafPeriode with _$RenteVanafPeriode {
  const factory RenteVanafPeriode(
      {required double rente, required int periode}) = _RenteVanafPeriode;

  factory RenteVanafPeriode.fromJson(Map<String, Object?> json) =>
      _$RenteVanafPeriodeFromJson(json);
}
