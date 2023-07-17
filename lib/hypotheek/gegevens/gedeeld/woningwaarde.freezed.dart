// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'woningwaarde.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WoningWaarde _$WoningWaardeFromJson(Map<String, dynamic> json) {
  return _WoningWaarde.fromJson(json);
}

/// @nodoc
mixin _$WoningWaarde {
  IList<String> get ids => throw _privateConstructorUsedError;
  dynamic get waarde => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WoningWaardeCopyWith<WoningWaarde> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WoningWaardeCopyWith<$Res> {
  factory $WoningWaardeCopyWith(
          WoningWaarde value, $Res Function(WoningWaarde) then) =
      _$WoningWaardeCopyWithImpl<$Res, WoningWaarde>;
  @useResult
  $Res call({IList<String> ids, dynamic waarde});
}

/// @nodoc
class _$WoningWaardeCopyWithImpl<$Res, $Val extends WoningWaarde>
    implements $WoningWaardeCopyWith<$Res> {
  _$WoningWaardeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = null,
    Object? waarde = freezed,
  }) {
    return _then(_value.copyWith(
      ids: null == ids
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      waarde: freezed == waarde
          ? _value.waarde
          : waarde // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WoningWaardeCopyWith<$Res>
    implements $WoningWaardeCopyWith<$Res> {
  factory _$$_WoningWaardeCopyWith(
          _$_WoningWaarde value, $Res Function(_$_WoningWaarde) then) =
      __$$_WoningWaardeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({IList<String> ids, dynamic waarde});
}

/// @nodoc
class __$$_WoningWaardeCopyWithImpl<$Res>
    extends _$WoningWaardeCopyWithImpl<$Res, _$_WoningWaarde>
    implements _$$_WoningWaardeCopyWith<$Res> {
  __$$_WoningWaardeCopyWithImpl(
      _$_WoningWaarde _value, $Res Function(_$_WoningWaarde) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = null,
    Object? waarde = freezed,
  }) {
    return _then(_$_WoningWaarde(
      ids: null == ids
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      waarde: freezed == waarde ? _value.waarde! : waarde,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WoningWaarde extends _WoningWaarde {
  const _$_WoningWaarde({this.ids = const IListConst([]), this.waarde = 0.0})
      : super._();

  factory _$_WoningWaarde.fromJson(Map<String, dynamic> json) =>
      _$$_WoningWaardeFromJson(json);

  @override
  @JsonKey()
  final IList<String> ids;
  @override
  @JsonKey()
  final dynamic waarde;

  @override
  String toString() {
    return 'WoningWaarde(ids: $ids, waarde: $waarde)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WoningWaarde &&
            const DeepCollectionEquality().equals(other.ids, ids) &&
            const DeepCollectionEquality().equals(other.waarde, waarde));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(ids),
      const DeepCollectionEquality().hash(waarde));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WoningWaardeCopyWith<_$_WoningWaarde> get copyWith =>
      __$$_WoningWaardeCopyWithImpl<_$_WoningWaarde>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WoningWaardeToJson(
      this,
    );
  }
}

abstract class _WoningWaarde extends WoningWaarde {
  const factory _WoningWaarde({final IList<String> ids, final dynamic waarde}) =
      _$_WoningWaarde;
  const _WoningWaarde._() : super._();

  factory _WoningWaarde.fromJson(Map<String, dynamic> json) =
      _$_WoningWaarde.fromJson;

  @override
  IList<String> get ids;
  @override
  dynamic get waarde;
  @override
  @JsonKey(ignore: true)
  _$$_WoningWaardeCopyWith<_$_WoningWaarde> get copyWith =>
      throw _privateConstructorUsedError;
}
