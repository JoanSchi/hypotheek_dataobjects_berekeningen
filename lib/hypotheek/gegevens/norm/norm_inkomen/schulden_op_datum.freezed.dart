// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schulden_op_datum.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SchuldOpDatum _$SchuldOpDatumFromJson(Map<String, dynamic> json) {
  return _SchuldOpDatum.fromJson(json);
}

/// @nodoc
mixin _$SchuldOpDatum {
  DateTime get datum => throw _privateConstructorUsedError;
  double get schuld => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SchuldOpDatumCopyWith<SchuldOpDatum> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchuldOpDatumCopyWith<$Res> {
  factory $SchuldOpDatumCopyWith(
          SchuldOpDatum value, $Res Function(SchuldOpDatum) then) =
      _$SchuldOpDatumCopyWithImpl<$Res, SchuldOpDatum>;
  @useResult
  $Res call({DateTime datum, double schuld});
}

/// @nodoc
class _$SchuldOpDatumCopyWithImpl<$Res, $Val extends SchuldOpDatum>
    implements $SchuldOpDatumCopyWith<$Res> {
  _$SchuldOpDatumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datum = null,
    Object? schuld = null,
  }) {
    return _then(_value.copyWith(
      datum: null == datum
          ? _value.datum
          : datum // ignore: cast_nullable_to_non_nullable
              as DateTime,
      schuld: null == schuld
          ? _value.schuld
          : schuld // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SchuldOpDatumCopyWith<$Res>
    implements $SchuldOpDatumCopyWith<$Res> {
  factory _$$_SchuldOpDatumCopyWith(
          _$_SchuldOpDatum value, $Res Function(_$_SchuldOpDatum) then) =
      __$$_SchuldOpDatumCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime datum, double schuld});
}

/// @nodoc
class __$$_SchuldOpDatumCopyWithImpl<$Res>
    extends _$SchuldOpDatumCopyWithImpl<$Res, _$_SchuldOpDatum>
    implements _$$_SchuldOpDatumCopyWith<$Res> {
  __$$_SchuldOpDatumCopyWithImpl(
      _$_SchuldOpDatum _value, $Res Function(_$_SchuldOpDatum) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datum = null,
    Object? schuld = null,
  }) {
    return _then(_$_SchuldOpDatum(
      datum: null == datum
          ? _value.datum
          : datum // ignore: cast_nullable_to_non_nullable
              as DateTime,
      schuld: null == schuld
          ? _value.schuld
          : schuld // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SchuldOpDatum extends _SchuldOpDatum {
  const _$_SchuldOpDatum({required this.datum, required this.schuld})
      : super._();

  factory _$_SchuldOpDatum.fromJson(Map<String, dynamic> json) =>
      _$$_SchuldOpDatumFromJson(json);

  @override
  final DateTime datum;
  @override
  final double schuld;

  @override
  String toString() {
    return 'SchuldOpDatum(datum: $datum, schuld: $schuld)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SchuldOpDatum &&
            (identical(other.datum, datum) || other.datum == datum) &&
            (identical(other.schuld, schuld) || other.schuld == schuld));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, datum, schuld);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SchuldOpDatumCopyWith<_$_SchuldOpDatum> get copyWith =>
      __$$_SchuldOpDatumCopyWithImpl<_$_SchuldOpDatum>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SchuldOpDatumToJson(
      this,
    );
  }
}

abstract class _SchuldOpDatum extends SchuldOpDatum {
  const factory _SchuldOpDatum(
      {required final DateTime datum,
      required final double schuld}) = _$_SchuldOpDatum;
  const _SchuldOpDatum._() : super._();

  factory _SchuldOpDatum.fromJson(Map<String, dynamic> json) =
      _$_SchuldOpDatum.fromJson;

  @override
  DateTime get datum;
  @override
  double get schuld;
  @override
  @JsonKey(ignore: true)
  _$$_SchuldOpDatumCopyWith<_$_SchuldOpDatum> get copyWith =>
      throw _privateConstructorUsedError;
}
