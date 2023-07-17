// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kosten_woning_lening.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KostenWoningLening _$KostenWoningLeningFromJson(Map<String, dynamic> json) {
  return _KostenWoningLening.fromJson(json);
}

/// @nodoc
mixin _$KostenWoningLening {
  IList<String> get ids => throw _privateConstructorUsedError;
  IList<Waarde> get kosten => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KostenWoningLeningCopyWith<KostenWoningLening> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KostenWoningLeningCopyWith<$Res> {
  factory $KostenWoningLeningCopyWith(
          KostenWoningLening value, $Res Function(KostenWoningLening) then) =
      _$KostenWoningLeningCopyWithImpl<$Res, KostenWoningLening>;
  @useResult
  $Res call({IList<String> ids, IList<Waarde> kosten});
}

/// @nodoc
class _$KostenWoningLeningCopyWithImpl<$Res, $Val extends KostenWoningLening>
    implements $KostenWoningLeningCopyWith<$Res> {
  _$KostenWoningLeningCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = null,
    Object? kosten = null,
  }) {
    return _then(_value.copyWith(
      ids: null == ids
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      kosten: null == kosten
          ? _value.kosten
          : kosten // ignore: cast_nullable_to_non_nullable
              as IList<Waarde>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KostenWoningLeningCopyWith<$Res>
    implements $KostenWoningLeningCopyWith<$Res> {
  factory _$$_KostenWoningLeningCopyWith(_$_KostenWoningLening value,
          $Res Function(_$_KostenWoningLening) then) =
      __$$_KostenWoningLeningCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({IList<String> ids, IList<Waarde> kosten});
}

/// @nodoc
class __$$_KostenWoningLeningCopyWithImpl<$Res>
    extends _$KostenWoningLeningCopyWithImpl<$Res, _$_KostenWoningLening>
    implements _$$_KostenWoningLeningCopyWith<$Res> {
  __$$_KostenWoningLeningCopyWithImpl(
      _$_KostenWoningLening _value, $Res Function(_$_KostenWoningLening) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = null,
    Object? kosten = null,
  }) {
    return _then(_$_KostenWoningLening(
      ids: null == ids
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      kosten: null == kosten
          ? _value.kosten
          : kosten // ignore: cast_nullable_to_non_nullable
              as IList<Waarde>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KostenWoningLening extends _KostenWoningLening {
  const _$_KostenWoningLening(
      {this.ids = const IListConst([]), this.kosten = const IListConst([])})
      : super._();

  factory _$_KostenWoningLening.fromJson(Map<String, dynamic> json) =>
      _$$_KostenWoningLeningFromJson(json);

  @override
  @JsonKey()
  final IList<String> ids;
  @override
  @JsonKey()
  final IList<Waarde> kosten;

  @override
  String toString() {
    return 'KostenWoningLening(ids: $ids, kosten: $kosten)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KostenWoningLening &&
            const DeepCollectionEquality().equals(other.ids, ids) &&
            const DeepCollectionEquality().equals(other.kosten, kosten));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(ids),
      const DeepCollectionEquality().hash(kosten));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KostenWoningLeningCopyWith<_$_KostenWoningLening> get copyWith =>
      __$$_KostenWoningLeningCopyWithImpl<_$_KostenWoningLening>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KostenWoningLeningToJson(
      this,
    );
  }
}

abstract class _KostenWoningLening extends KostenWoningLening {
  const factory _KostenWoningLening(
      {final IList<String> ids,
      final IList<Waarde> kosten}) = _$_KostenWoningLening;
  const _KostenWoningLening._() : super._();

  factory _KostenWoningLening.fromJson(Map<String, dynamic> json) =
      _$_KostenWoningLening.fromJson;

  @override
  IList<String> get ids;
  @override
  IList<Waarde> get kosten;
  @override
  @JsonKey(ignore: true)
  _$$_KostenWoningLeningCopyWith<_$_KostenWoningLening> get copyWith =>
      throw _privateConstructorUsedError;
}
