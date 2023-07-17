import 'package:freezed_annotation/freezed_annotation.dart';
import '../../status_lening/status_lening.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'optimalisatie_last.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'optimalisatie_last.g.dart';

@freezed
class OptimalisatieLast with _$OptimalisatieLast {
  const factory OptimalisatieLast({
    required StatusLening statusLening,
    required double toetsRente,
    @Default(0.0) double verduurzaamLening,
    @Default(0.0) double box1,
    @Default(0.0) double box3,
  }) = _OptimalisatieLast;

  factory OptimalisatieLast.fromJson(Map<String, Object?> json) =>
      _$OptimalisatieLastFromJson(json);
}
