// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inkomens_op_datum.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InkomenOpDatum _$InkomenOpDatumFromJson(Map<String, dynamic> json) {
  return _InkomenOpDatum.fromJson(json);
}

/// @nodoc
mixin _$InkomenOpDatum {
  DateTime get datum => throw _privateConstructorUsedError;
  IList<Inkomen> get inkomens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InkomenOpDatumCopyWith<InkomenOpDatum> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InkomenOpDatumCopyWith<$Res> {
  factory $InkomenOpDatumCopyWith(
          InkomenOpDatum value, $Res Function(InkomenOpDatum) then) =
      _$InkomenOpDatumCopyWithImpl<$Res, InkomenOpDatum>;
  @useResult
  $Res call({DateTime datum, IList<Inkomen> inkomens});
}

/// @nodoc
class _$InkomenOpDatumCopyWithImpl<$Res, $Val extends InkomenOpDatum>
    implements $InkomenOpDatumCopyWith<$Res> {
  _$InkomenOpDatumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datum = null,
    Object? inkomens = null,
  }) {
    return _then(_value.copyWith(
      datum: null == datum
          ? _value.datum
          : datum // ignore: cast_nullable_to_non_nullable
              as DateTime,
      inkomens: null == inkomens
          ? _value.inkomens
          : inkomens // ignore: cast_nullable_to_non_nullable
              as IList<Inkomen>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InkomenOpDatumCopyWith<$Res>
    implements $InkomenOpDatumCopyWith<$Res> {
  factory _$$_InkomenOpDatumCopyWith(
          _$_InkomenOpDatum value, $Res Function(_$_InkomenOpDatum) then) =
      __$$_InkomenOpDatumCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime datum, IList<Inkomen> inkomens});
}

/// @nodoc
class __$$_InkomenOpDatumCopyWithImpl<$Res>
    extends _$InkomenOpDatumCopyWithImpl<$Res, _$_InkomenOpDatum>
    implements _$$_InkomenOpDatumCopyWith<$Res> {
  __$$_InkomenOpDatumCopyWithImpl(
      _$_InkomenOpDatum _value, $Res Function(_$_InkomenOpDatum) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datum = null,
    Object? inkomens = null,
  }) {
    return _then(_$_InkomenOpDatum(
      datum: null == datum
          ? _value.datum
          : datum // ignore: cast_nullable_to_non_nullable
              as DateTime,
      inkomens: null == inkomens
          ? _value.inkomens
          : inkomens // ignore: cast_nullable_to_non_nullable
              as IList<Inkomen>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InkomenOpDatum extends _InkomenOpDatum {
  const _$_InkomenOpDatum({required this.datum, required this.inkomens})
      : super._();

  factory _$_InkomenOpDatum.fromJson(Map<String, dynamic> json) =>
      _$$_InkomenOpDatumFromJson(json);

  @override
  final DateTime datum;
  @override
  final IList<Inkomen> inkomens;

  @override
  String toString() {
    return 'InkomenOpDatum(datum: $datum, inkomens: $inkomens)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InkomenOpDatum &&
            (identical(other.datum, datum) || other.datum == datum) &&
            const DeepCollectionEquality().equals(other.inkomens, inkomens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, datum, const DeepCollectionEquality().hash(inkomens));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InkomenOpDatumCopyWith<_$_InkomenOpDatum> get copyWith =>
      __$$_InkomenOpDatumCopyWithImpl<_$_InkomenOpDatum>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InkomenOpDatumToJson(
      this,
    );
  }
}

abstract class _InkomenOpDatum extends InkomenOpDatum {
  const factory _InkomenOpDatum(
      {required final DateTime datum,
      required final IList<Inkomen> inkomens}) = _$_InkomenOpDatum;
  const _InkomenOpDatum._() : super._();

  factory _InkomenOpDatum.fromJson(Map<String, dynamic> json) =
      _$_InkomenOpDatum.fromJson;

  @override
  DateTime get datum;
  @override
  IList<Inkomen> get inkomens;
  @override
  @JsonKey(ignore: true)
  _$$_InkomenOpDatumCopyWith<_$_InkomenOpDatum> get copyWith =>
      throw _privateConstructorUsedError;
}
