import 'package:freezed_annotation/freezed_annotation.dart';

part 'lening_aanpassen.freezed.dart';
part 'lening_aanpassen.g.dart';

enum LeningAanpassenOpties { aflossen, verhogen }

@freezed
class LeningAanpassen with _$LeningAanpassen {
  const LeningAanpassen._();

  const factory LeningAanpassen.termijnen(
      {required DateTime datum,
      @Default(LeningAanpassenOpties.aflossen)
          LeningAanpassenOpties leningAanpassenOpties,
      required double bedrag,
      required int aantal,
      required int intervalInMaanden}) = LenningAanpassenInTermijnen;

  const factory LeningAanpassen.eenmalig({
    required DateTime datum,
    @Default(LeningAanpassenOpties.aflossen)
        LeningAanpassenOpties leningAanpassenOpties,
    required double bedrag,
  }) = LenningAanpassenEenmalig;

  factory LeningAanpassen.fromJson(Map<String, Object?> json) =>
      _$LeningAanpassenFromJson(json);
}
