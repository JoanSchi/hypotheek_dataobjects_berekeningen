// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rente_vanaf_periode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RenteVanafPeriode _$RenteVanafPeriodeFromJson(Map<String, dynamic> json) {
  return _RenteVanafPeriode.fromJson(json);
}

/// @nodoc
mixin _$RenteVanafPeriode {
  double get rente => throw _privateConstructorUsedError;
  int get periode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RenteVanafPeriodeCopyWith<RenteVanafPeriode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RenteVanafPeriodeCopyWith<$Res> {
  factory $RenteVanafPeriodeCopyWith(
          RenteVanafPeriode value, $Res Function(RenteVanafPeriode) then) =
      _$RenteVanafPeriodeCopyWithImpl<$Res, RenteVanafPeriode>;
  @useResult
  $Res call({double rente, int periode});
}

/// @nodoc
class _$RenteVanafPeriodeCopyWithImpl<$Res, $Val extends RenteVanafPeriode>
    implements $RenteVanafPeriodeCopyWith<$Res> {
  _$RenteVanafPeriodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rente = null,
    Object? periode = null,
  }) {
    return _then(_value.copyWith(
      rente: null == rente
          ? _value.rente
          : rente // ignore: cast_nullable_to_non_nullable
              as double,
      periode: null == periode
          ? _value.periode
          : periode // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RenteVanafPeriodeCopyWith<$Res>
    implements $RenteVanafPeriodeCopyWith<$Res> {
  factory _$$_RenteVanafPeriodeCopyWith(_$_RenteVanafPeriode value,
          $Res Function(_$_RenteVanafPeriode) then) =
      __$$_RenteVanafPeriodeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double rente, int periode});
}

/// @nodoc
class __$$_RenteVanafPeriodeCopyWithImpl<$Res>
    extends _$RenteVanafPeriodeCopyWithImpl<$Res, _$_RenteVanafPeriode>
    implements _$$_RenteVanafPeriodeCopyWith<$Res> {
  __$$_RenteVanafPeriodeCopyWithImpl(
      _$_RenteVanafPeriode _value, $Res Function(_$_RenteVanafPeriode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rente = null,
    Object? periode = null,
  }) {
    return _then(_$_RenteVanafPeriode(
      rente: null == rente
          ? _value.rente
          : rente // ignore: cast_nullable_to_non_nullable
              as double,
      periode: null == periode
          ? _value.periode
          : periode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RenteVanafPeriode implements _RenteVanafPeriode {
  const _$_RenteVanafPeriode({required this.rente, required this.periode});

  factory _$_RenteVanafPeriode.fromJson(Map<String, dynamic> json) =>
      _$$_RenteVanafPeriodeFromJson(json);

  @override
  final double rente;
  @override
  final int periode;

  @override
  String toString() {
    return 'RenteVanafPeriode(rente: $rente, periode: $periode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RenteVanafPeriode &&
            (identical(other.rente, rente) || other.rente == rente) &&
            (identical(other.periode, periode) || other.periode == periode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rente, periode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RenteVanafPeriodeCopyWith<_$_RenteVanafPeriode> get copyWith =>
      __$$_RenteVanafPeriodeCopyWithImpl<_$_RenteVanafPeriode>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RenteVanafPeriodeToJson(
      this,
    );
  }
}

abstract class _RenteVanafPeriode implements RenteVanafPeriode {
  const factory _RenteVanafPeriode(
      {required final double rente,
      required final int periode}) = _$_RenteVanafPeriode;

  factory _RenteVanafPeriode.fromJson(Map<String, dynamic> json) =
      _$_RenteVanafPeriode.fromJson;

  @override
  double get rente;
  @override
  int get periode;
  @override
  @JsonKey(ignore: true)
  _$$_RenteVanafPeriodeCopyWith<_$_RenteVanafPeriode> get copyWith =>
      throw _privateConstructorUsedError;
}
