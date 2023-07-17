// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kosten_verbouwen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KostenVerbouwen _$KostenVerbouwenFromJson(Map<String, dynamic> json) {
  return _KostenVerbouwen.fromJson(json);
}

/// @nodoc
mixin _$KostenVerbouwen {
  IList<String> get ids => throw _privateConstructorUsedError;
  IList<Waarde> get kosten => throw _privateConstructorUsedError;
  double get taxatie => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KostenVerbouwenCopyWith<KostenVerbouwen> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KostenVerbouwenCopyWith<$Res> {
  factory $KostenVerbouwenCopyWith(
          KostenVerbouwen value, $Res Function(KostenVerbouwen) then) =
      _$KostenVerbouwenCopyWithImpl<$Res, KostenVerbouwen>;
  @useResult
  $Res call({IList<String> ids, IList<Waarde> kosten, double taxatie});
}

/// @nodoc
class _$KostenVerbouwenCopyWithImpl<$Res, $Val extends KostenVerbouwen>
    implements $KostenVerbouwenCopyWith<$Res> {
  _$KostenVerbouwenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = null,
    Object? kosten = null,
    Object? taxatie = null,
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
      taxatie: null == taxatie
          ? _value.taxatie
          : taxatie // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KostenVerbouwenCopyWith<$Res>
    implements $KostenVerbouwenCopyWith<$Res> {
  factory _$$_KostenVerbouwenCopyWith(
          _$_KostenVerbouwen value, $Res Function(_$_KostenVerbouwen) then) =
      __$$_KostenVerbouwenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({IList<String> ids, IList<Waarde> kosten, double taxatie});
}

/// @nodoc
class __$$_KostenVerbouwenCopyWithImpl<$Res>
    extends _$KostenVerbouwenCopyWithImpl<$Res, _$_KostenVerbouwen>
    implements _$$_KostenVerbouwenCopyWith<$Res> {
  __$$_KostenVerbouwenCopyWithImpl(
      _$_KostenVerbouwen _value, $Res Function(_$_KostenVerbouwen) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = null,
    Object? kosten = null,
    Object? taxatie = null,
  }) {
    return _then(_$_KostenVerbouwen(
      ids: null == ids
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      kosten: null == kosten
          ? _value.kosten
          : kosten // ignore: cast_nullable_to_non_nullable
              as IList<Waarde>,
      taxatie: null == taxatie
          ? _value.taxatie
          : taxatie // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KostenVerbouwen extends _KostenVerbouwen {
  const _$_KostenVerbouwen(
      {this.ids = const IListConst([]),
      this.kosten = const IListConst([]),
      this.taxatie = 0.0})
      : super._();

  factory _$_KostenVerbouwen.fromJson(Map<String, dynamic> json) =>
      _$$_KostenVerbouwenFromJson(json);

  @override
  @JsonKey()
  final IList<String> ids;
  @override
  @JsonKey()
  final IList<Waarde> kosten;
  @override
  @JsonKey()
  final double taxatie;

  @override
  String toString() {
    return 'KostenVerbouwen(ids: $ids, kosten: $kosten, taxatie: $taxatie)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KostenVerbouwen &&
            const DeepCollectionEquality().equals(other.ids, ids) &&
            const DeepCollectionEquality().equals(other.kosten, kosten) &&
            (identical(other.taxatie, taxatie) || other.taxatie == taxatie));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(ids),
      const DeepCollectionEquality().hash(kosten),
      taxatie);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KostenVerbouwenCopyWith<_$_KostenVerbouwen> get copyWith =>
      __$$_KostenVerbouwenCopyWithImpl<_$_KostenVerbouwen>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KostenVerbouwenToJson(
      this,
    );
  }
}

abstract class _KostenVerbouwen extends KostenVerbouwen {
  const factory _KostenVerbouwen(
      {final IList<String> ids,
      final IList<Waarde> kosten,
      final double taxatie}) = _$_KostenVerbouwen;
  const _KostenVerbouwen._() : super._();

  factory _KostenVerbouwen.fromJson(Map<String, dynamic> json) =
      _$_KostenVerbouwen.fromJson;

  @override
  IList<String> get ids;
  @override
  IList<Waarde> get kosten;
  @override
  double get taxatie;
  @override
  @JsonKey(ignore: true)
  _$$_KostenVerbouwenCopyWith<_$_KostenVerbouwen> get copyWith =>
      throw _privateConstructorUsedError;
}
