// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'normen_toepassen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NormenToepassen _$NormenToepassenFromJson(Map<String, dynamic> json) {
  return _NormenToepassen.fromJson(json);
}

/// @nodoc
mixin _$NormenToepassen {
  bool get woningWaarde => throw _privateConstructorUsedError;
  bool get inkomen => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NormenToepassenCopyWith<NormenToepassen> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NormenToepassenCopyWith<$Res> {
  factory $NormenToepassenCopyWith(
          NormenToepassen value, $Res Function(NormenToepassen) then) =
      _$NormenToepassenCopyWithImpl<$Res, NormenToepassen>;
  @useResult
  $Res call({bool woningWaarde, bool inkomen});
}

/// @nodoc
class _$NormenToepassenCopyWithImpl<$Res, $Val extends NormenToepassen>
    implements $NormenToepassenCopyWith<$Res> {
  _$NormenToepassenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? woningWaarde = null,
    Object? inkomen = null,
  }) {
    return _then(_value.copyWith(
      woningWaarde: null == woningWaarde
          ? _value.woningWaarde
          : woningWaarde // ignore: cast_nullable_to_non_nullable
              as bool,
      inkomen: null == inkomen
          ? _value.inkomen
          : inkomen // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NormenToepassenCopyWith<$Res>
    implements $NormenToepassenCopyWith<$Res> {
  factory _$$_NormenToepassenCopyWith(
          _$_NormenToepassen value, $Res Function(_$_NormenToepassen) then) =
      __$$_NormenToepassenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool woningWaarde, bool inkomen});
}

/// @nodoc
class __$$_NormenToepassenCopyWithImpl<$Res>
    extends _$NormenToepassenCopyWithImpl<$Res, _$_NormenToepassen>
    implements _$$_NormenToepassenCopyWith<$Res> {
  __$$_NormenToepassenCopyWithImpl(
      _$_NormenToepassen _value, $Res Function(_$_NormenToepassen) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? woningWaarde = null,
    Object? inkomen = null,
  }) {
    return _then(_$_NormenToepassen(
      woningWaarde: null == woningWaarde
          ? _value.woningWaarde
          : woningWaarde // ignore: cast_nullable_to_non_nullable
              as bool,
      inkomen: null == inkomen
          ? _value.inkomen
          : inkomen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NormenToepassen extends _NormenToepassen {
  const _$_NormenToepassen({this.woningWaarde = false, this.inkomen = false})
      : super._();

  factory _$_NormenToepassen.fromJson(Map<String, dynamic> json) =>
      _$$_NormenToepassenFromJson(json);

  @override
  @JsonKey()
  final bool woningWaarde;
  @override
  @JsonKey()
  final bool inkomen;

  @override
  String toString() {
    return 'NormenToepassen(woningWaarde: $woningWaarde, inkomen: $inkomen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NormenToepassen &&
            (identical(other.woningWaarde, woningWaarde) ||
                other.woningWaarde == woningWaarde) &&
            (identical(other.inkomen, inkomen) || other.inkomen == inkomen));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, woningWaarde, inkomen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NormenToepassenCopyWith<_$_NormenToepassen> get copyWith =>
      __$$_NormenToepassenCopyWithImpl<_$_NormenToepassen>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NormenToepassenToJson(
      this,
    );
  }
}

abstract class _NormenToepassen extends NormenToepassen {
  const factory _NormenToepassen(
      {final bool woningWaarde, final bool inkomen}) = _$_NormenToepassen;
  const _NormenToepassen._() : super._();

  factory _NormenToepassen.fromJson(Map<String, dynamic> json) =
      _$_NormenToepassen.fromJson;

  @override
  bool get woningWaarde;
  @override
  bool get inkomen;
  @override
  @JsonKey(ignore: true)
  _$$_NormenToepassenCopyWith<_$_NormenToepassen> get copyWith =>
      throw _privateConstructorUsedError;
}
