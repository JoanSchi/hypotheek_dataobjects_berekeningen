// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'norm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Norm _$NormFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'normInkomen':
      return NormInkomen.fromJson(json);
    case 'normWoningWaarde':
      return NormWoningWaarde.fromJson(json);
    case 'normNhg':
      return NormNhg.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Norm',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Norm {
  bool get fout => throw _privateConstructorUsedError;
  IList<String> get berichten => throw _privateConstructorUsedError;
  double get teLenen => throw _privateConstructorUsedError;
  double get normLening => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool fout,
            IList<String> berichten,
            int periode,
            double toetsRenteGemiddeld,
            double teLenen,
            double normLening,
            double extraMaandLast)
        normInkomen,
    required TResult Function(bool fout, IList<String> berichten,
            double normLening, double verduurzaam, double teLenen)
        normWoningWaarde,
    required TResult Function(bool fout, IList<String> berichten,
            double normLening, double verduurzaam, double teLenen)
        normNhg,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool fout,
            IList<String> berichten,
            int periode,
            double toetsRenteGemiddeld,
            double teLenen,
            double normLening,
            double extraMaandLast)?
        normInkomen,
    TResult? Function(bool fout, IList<String> berichten, double normLening,
            double verduurzaam, double teLenen)?
        normWoningWaarde,
    TResult? Function(bool fout, IList<String> berichten, double normLening,
            double verduurzaam, double teLenen)?
        normNhg,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool fout,
            IList<String> berichten,
            int periode,
            double toetsRenteGemiddeld,
            double teLenen,
            double normLening,
            double extraMaandLast)?
        normInkomen,
    TResult Function(bool fout, IList<String> berichten, double normLening,
            double verduurzaam, double teLenen)?
        normWoningWaarde,
    TResult Function(bool fout, IList<String> berichten, double normLening,
            double verduurzaam, double teLenen)?
        normNhg,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NormInkomen value) normInkomen,
    required TResult Function(NormWoningWaarde value) normWoningWaarde,
    required TResult Function(NormNhg value) normNhg,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NormInkomen value)? normInkomen,
    TResult? Function(NormWoningWaarde value)? normWoningWaarde,
    TResult? Function(NormNhg value)? normNhg,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NormInkomen value)? normInkomen,
    TResult Function(NormWoningWaarde value)? normWoningWaarde,
    TResult Function(NormNhg value)? normNhg,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NormCopyWith<Norm> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NormCopyWith<$Res> {
  factory $NormCopyWith(Norm value, $Res Function(Norm) then) =
      _$NormCopyWithImpl<$Res, Norm>;
  @useResult
  $Res call(
      {bool fout, IList<String> berichten, double teLenen, double normLening});
}

/// @nodoc
class _$NormCopyWithImpl<$Res, $Val extends Norm>
    implements $NormCopyWith<$Res> {
  _$NormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fout = null,
    Object? berichten = null,
    Object? teLenen = null,
    Object? normLening = null,
  }) {
    return _then(_value.copyWith(
      fout: null == fout
          ? _value.fout
          : fout // ignore: cast_nullable_to_non_nullable
              as bool,
      berichten: null == berichten
          ? _value.berichten
          : berichten // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      teLenen: null == teLenen
          ? _value.teLenen
          : teLenen // ignore: cast_nullable_to_non_nullable
              as double,
      normLening: null == normLening
          ? _value.normLening
          : normLening // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NormInkomenCopyWith<$Res> implements $NormCopyWith<$Res> {
  factory _$$NormInkomenCopyWith(
          _$NormInkomen value, $Res Function(_$NormInkomen) then) =
      __$$NormInkomenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool fout,
      IList<String> berichten,
      int periode,
      double toetsRenteGemiddeld,
      double teLenen,
      double normLening,
      double extraMaandLast});
}

/// @nodoc
class __$$NormInkomenCopyWithImpl<$Res>
    extends _$NormCopyWithImpl<$Res, _$NormInkomen>
    implements _$$NormInkomenCopyWith<$Res> {
  __$$NormInkomenCopyWithImpl(
      _$NormInkomen _value, $Res Function(_$NormInkomen) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fout = null,
    Object? berichten = null,
    Object? periode = null,
    Object? toetsRenteGemiddeld = null,
    Object? teLenen = null,
    Object? normLening = null,
    Object? extraMaandLast = null,
  }) {
    return _then(_$NormInkomen(
      fout: null == fout
          ? _value.fout
          : fout // ignore: cast_nullable_to_non_nullable
              as bool,
      berichten: null == berichten
          ? _value.berichten
          : berichten // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      periode: null == periode
          ? _value.periode
          : periode // ignore: cast_nullable_to_non_nullable
              as int,
      toetsRenteGemiddeld: null == toetsRenteGemiddeld
          ? _value.toetsRenteGemiddeld
          : toetsRenteGemiddeld // ignore: cast_nullable_to_non_nullable
              as double,
      teLenen: null == teLenen
          ? _value.teLenen
          : teLenen // ignore: cast_nullable_to_non_nullable
              as double,
      normLening: null == normLening
          ? _value.normLening
          : normLening // ignore: cast_nullable_to_non_nullable
              as double,
      extraMaandLast: null == extraMaandLast
          ? _value.extraMaandLast
          : extraMaandLast // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NormInkomen extends NormInkomen {
  const _$NormInkomen(
      {this.fout = false,
      this.berichten = const IListConst([]),
      this.periode = 0,
      this.toetsRenteGemiddeld = 0.0,
      this.teLenen = 0.0,
      this.normLening = 0.0,
      this.extraMaandLast = 0.0,
      final String? $type})
      : $type = $type ?? 'normInkomen',
        super._();

  factory _$NormInkomen.fromJson(Map<String, dynamic> json) =>
      _$$NormInkomenFromJson(json);

  @override
  @JsonKey()
  final bool fout;
  @override
  @JsonKey()
  final IList<String> berichten;
  @override
  @JsonKey()
  final int periode;
  @override
  @JsonKey()
  final double toetsRenteGemiddeld;
  @override
  @JsonKey()
  final double teLenen;
  @override
  @JsonKey()
  final double normLening;
  @override
  @JsonKey()
  final double extraMaandLast;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Norm.normInkomen(fout: $fout, berichten: $berichten, periode: $periode, toetsRenteGemiddeld: $toetsRenteGemiddeld, teLenen: $teLenen, normLening: $normLening, extraMaandLast: $extraMaandLast)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NormInkomen &&
            (identical(other.fout, fout) || other.fout == fout) &&
            const DeepCollectionEquality().equals(other.berichten, berichten) &&
            (identical(other.periode, periode) || other.periode == periode) &&
            (identical(other.toetsRenteGemiddeld, toetsRenteGemiddeld) ||
                other.toetsRenteGemiddeld == toetsRenteGemiddeld) &&
            (identical(other.teLenen, teLenen) || other.teLenen == teLenen) &&
            (identical(other.normLening, normLening) ||
                other.normLening == normLening) &&
            (identical(other.extraMaandLast, extraMaandLast) ||
                other.extraMaandLast == extraMaandLast));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fout,
      const DeepCollectionEquality().hash(berichten),
      periode,
      toetsRenteGemiddeld,
      teLenen,
      normLening,
      extraMaandLast);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NormInkomenCopyWith<_$NormInkomen> get copyWith =>
      __$$NormInkomenCopyWithImpl<_$NormInkomen>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool fout,
            IList<String> berichten,
            int periode,
            double toetsRenteGemiddeld,
            double teLenen,
            double normLening,
            double extraMaandLast)
        normInkomen,
    required TResult Function(bool fout, IList<String> berichten,
            double normLening, double verduurzaam, double teLenen)
        normWoningWaarde,
    required TResult Function(bool fout, IList<String> berichten,
            double normLening, double verduurzaam, double teLenen)
        normNhg,
  }) {
    return normInkomen(fout, berichten, periode, toetsRenteGemiddeld, teLenen,
        normLening, extraMaandLast);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool fout,
            IList<String> berichten,
            int periode,
            double toetsRenteGemiddeld,
            double teLenen,
            double normLening,
            double extraMaandLast)?
        normInkomen,
    TResult? Function(bool fout, IList<String> berichten, double normLening,
            double verduurzaam, double teLenen)?
        normWoningWaarde,
    TResult? Function(bool fout, IList<String> berichten, double normLening,
            double verduurzaam, double teLenen)?
        normNhg,
  }) {
    return normInkomen?.call(fout, berichten, periode, toetsRenteGemiddeld,
        teLenen, normLening, extraMaandLast);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool fout,
            IList<String> berichten,
            int periode,
            double toetsRenteGemiddeld,
            double teLenen,
            double normLening,
            double extraMaandLast)?
        normInkomen,
    TResult Function(bool fout, IList<String> berichten, double normLening,
            double verduurzaam, double teLenen)?
        normWoningWaarde,
    TResult Function(bool fout, IList<String> berichten, double normLening,
            double verduurzaam, double teLenen)?
        normNhg,
    required TResult orElse(),
  }) {
    if (normInkomen != null) {
      return normInkomen(fout, berichten, periode, toetsRenteGemiddeld, teLenen,
          normLening, extraMaandLast);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NormInkomen value) normInkomen,
    required TResult Function(NormWoningWaarde value) normWoningWaarde,
    required TResult Function(NormNhg value) normNhg,
  }) {
    return normInkomen(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NormInkomen value)? normInkomen,
    TResult? Function(NormWoningWaarde value)? normWoningWaarde,
    TResult? Function(NormNhg value)? normNhg,
  }) {
    return normInkomen?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NormInkomen value)? normInkomen,
    TResult Function(NormWoningWaarde value)? normWoningWaarde,
    TResult Function(NormNhg value)? normNhg,
    required TResult orElse(),
  }) {
    if (normInkomen != null) {
      return normInkomen(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NormInkomenToJson(
      this,
    );
  }
}

abstract class NormInkomen extends Norm {
  const factory NormInkomen(
      {final bool fout,
      final IList<String> berichten,
      final int periode,
      final double toetsRenteGemiddeld,
      final double teLenen,
      final double normLening,
      final double extraMaandLast}) = _$NormInkomen;
  const NormInkomen._() : super._();

  factory NormInkomen.fromJson(Map<String, dynamic> json) =
      _$NormInkomen.fromJson;

  @override
  bool get fout;
  @override
  IList<String> get berichten;
  int get periode;
  double get toetsRenteGemiddeld;
  @override
  double get teLenen;
  @override
  double get normLening;
  double get extraMaandLast;
  @override
  @JsonKey(ignore: true)
  _$$NormInkomenCopyWith<_$NormInkomen> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NormWoningWaardeCopyWith<$Res>
    implements $NormCopyWith<$Res> {
  factory _$$NormWoningWaardeCopyWith(
          _$NormWoningWaarde value, $Res Function(_$NormWoningWaarde) then) =
      __$$NormWoningWaardeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool fout,
      IList<String> berichten,
      double normLening,
      double verduurzaam,
      double teLenen});
}

/// @nodoc
class __$$NormWoningWaardeCopyWithImpl<$Res>
    extends _$NormCopyWithImpl<$Res, _$NormWoningWaarde>
    implements _$$NormWoningWaardeCopyWith<$Res> {
  __$$NormWoningWaardeCopyWithImpl(
      _$NormWoningWaarde _value, $Res Function(_$NormWoningWaarde) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fout = null,
    Object? berichten = null,
    Object? normLening = null,
    Object? verduurzaam = null,
    Object? teLenen = null,
  }) {
    return _then(_$NormWoningWaarde(
      fout: null == fout
          ? _value.fout
          : fout // ignore: cast_nullable_to_non_nullable
              as bool,
      berichten: null == berichten
          ? _value.berichten
          : berichten // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      normLening: null == normLening
          ? _value.normLening
          : normLening // ignore: cast_nullable_to_non_nullable
              as double,
      verduurzaam: null == verduurzaam
          ? _value.verduurzaam
          : verduurzaam // ignore: cast_nullable_to_non_nullable
              as double,
      teLenen: null == teLenen
          ? _value.teLenen
          : teLenen // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NormWoningWaarde extends NormWoningWaarde {
  const _$NormWoningWaarde(
      {this.fout = false,
      this.berichten = const IListConst([]),
      this.normLening = 0.0,
      this.verduurzaam = 0.0,
      this.teLenen = 0.0,
      final String? $type})
      : $type = $type ?? 'normWoningWaarde',
        super._();

  factory _$NormWoningWaarde.fromJson(Map<String, dynamic> json) =>
      _$$NormWoningWaardeFromJson(json);

  @override
  @JsonKey()
  final bool fout;
  @override
  @JsonKey()
  final IList<String> berichten;
  @override
  @JsonKey()
  final double normLening;
  @override
  @JsonKey()
  final double verduurzaam;
  @override
  @JsonKey()
  final double teLenen;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Norm.normWoningWaarde(fout: $fout, berichten: $berichten, normLening: $normLening, verduurzaam: $verduurzaam, teLenen: $teLenen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NormWoningWaarde &&
            (identical(other.fout, fout) || other.fout == fout) &&
            const DeepCollectionEquality().equals(other.berichten, berichten) &&
            (identical(other.normLening, normLening) ||
                other.normLening == normLening) &&
            (identical(other.verduurzaam, verduurzaam) ||
                other.verduurzaam == verduurzaam) &&
            (identical(other.teLenen, teLenen) || other.teLenen == teLenen));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fout,
      const DeepCollectionEquality().hash(berichten),
      normLening,
      verduurzaam,
      teLenen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NormWoningWaardeCopyWith<_$NormWoningWaarde> get copyWith =>
      __$$NormWoningWaardeCopyWithImpl<_$NormWoningWaarde>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool fout,
            IList<String> berichten,
            int periode,
            double toetsRenteGemiddeld,
            double teLenen,
            double normLening,
            double extraMaandLast)
        normInkomen,
    required TResult Function(bool fout, IList<String> berichten,
            double normLening, double verduurzaam, double teLenen)
        normWoningWaarde,
    required TResult Function(bool fout, IList<String> berichten,
            double normLening, double verduurzaam, double teLenen)
        normNhg,
  }) {
    return normWoningWaarde(fout, berichten, normLening, verduurzaam, teLenen);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool fout,
            IList<String> berichten,
            int periode,
            double toetsRenteGemiddeld,
            double teLenen,
            double normLening,
            double extraMaandLast)?
        normInkomen,
    TResult? Function(bool fout, IList<String> berichten, double normLening,
            double verduurzaam, double teLenen)?
        normWoningWaarde,
    TResult? Function(bool fout, IList<String> berichten, double normLening,
            double verduurzaam, double teLenen)?
        normNhg,
  }) {
    return normWoningWaarde?.call(
        fout, berichten, normLening, verduurzaam, teLenen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool fout,
            IList<String> berichten,
            int periode,
            double toetsRenteGemiddeld,
            double teLenen,
            double normLening,
            double extraMaandLast)?
        normInkomen,
    TResult Function(bool fout, IList<String> berichten, double normLening,
            double verduurzaam, double teLenen)?
        normWoningWaarde,
    TResult Function(bool fout, IList<String> berichten, double normLening,
            double verduurzaam, double teLenen)?
        normNhg,
    required TResult orElse(),
  }) {
    if (normWoningWaarde != null) {
      return normWoningWaarde(
          fout, berichten, normLening, verduurzaam, teLenen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NormInkomen value) normInkomen,
    required TResult Function(NormWoningWaarde value) normWoningWaarde,
    required TResult Function(NormNhg value) normNhg,
  }) {
    return normWoningWaarde(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NormInkomen value)? normInkomen,
    TResult? Function(NormWoningWaarde value)? normWoningWaarde,
    TResult? Function(NormNhg value)? normNhg,
  }) {
    return normWoningWaarde?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NormInkomen value)? normInkomen,
    TResult Function(NormWoningWaarde value)? normWoningWaarde,
    TResult Function(NormNhg value)? normNhg,
    required TResult orElse(),
  }) {
    if (normWoningWaarde != null) {
      return normWoningWaarde(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NormWoningWaardeToJson(
      this,
    );
  }
}

abstract class NormWoningWaarde extends Norm {
  const factory NormWoningWaarde(
      {final bool fout,
      final IList<String> berichten,
      final double normLening,
      final double verduurzaam,
      final double teLenen}) = _$NormWoningWaarde;
  const NormWoningWaarde._() : super._();

  factory NormWoningWaarde.fromJson(Map<String, dynamic> json) =
      _$NormWoningWaarde.fromJson;

  @override
  bool get fout;
  @override
  IList<String> get berichten;
  @override
  double get normLening;
  double get verduurzaam;
  @override
  double get teLenen;
  @override
  @JsonKey(ignore: true)
  _$$NormWoningWaardeCopyWith<_$NormWoningWaarde> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NormNhgCopyWith<$Res> implements $NormCopyWith<$Res> {
  factory _$$NormNhgCopyWith(_$NormNhg value, $Res Function(_$NormNhg) then) =
      __$$NormNhgCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool fout,
      IList<String> berichten,
      double normLening,
      double verduurzaam,
      double teLenen});
}

/// @nodoc
class __$$NormNhgCopyWithImpl<$Res> extends _$NormCopyWithImpl<$Res, _$NormNhg>
    implements _$$NormNhgCopyWith<$Res> {
  __$$NormNhgCopyWithImpl(_$NormNhg _value, $Res Function(_$NormNhg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fout = null,
    Object? berichten = null,
    Object? normLening = null,
    Object? verduurzaam = null,
    Object? teLenen = null,
  }) {
    return _then(_$NormNhg(
      fout: null == fout
          ? _value.fout
          : fout // ignore: cast_nullable_to_non_nullable
              as bool,
      berichten: null == berichten
          ? _value.berichten
          : berichten // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      normLening: null == normLening
          ? _value.normLening
          : normLening // ignore: cast_nullable_to_non_nullable
              as double,
      verduurzaam: null == verduurzaam
          ? _value.verduurzaam
          : verduurzaam // ignore: cast_nullable_to_non_nullable
              as double,
      teLenen: null == teLenen
          ? _value.teLenen
          : teLenen // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NormNhg extends NormNhg {
  const _$NormNhg(
      {this.fout = false,
      this.berichten = const IListConst([]),
      this.normLening = 0.0,
      this.verduurzaam = 0.0,
      this.teLenen = 0.0,
      final String? $type})
      : $type = $type ?? 'normNhg',
        super._();

  factory _$NormNhg.fromJson(Map<String, dynamic> json) =>
      _$$NormNhgFromJson(json);

  @override
  @JsonKey()
  final bool fout;
  @override
  @JsonKey()
  final IList<String> berichten;
  @override
  @JsonKey()
  final double normLening;
  @override
  @JsonKey()
  final double verduurzaam;
  @override
  @JsonKey()
  final double teLenen;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Norm.normNhg(fout: $fout, berichten: $berichten, normLening: $normLening, verduurzaam: $verduurzaam, teLenen: $teLenen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NormNhg &&
            (identical(other.fout, fout) || other.fout == fout) &&
            const DeepCollectionEquality().equals(other.berichten, berichten) &&
            (identical(other.normLening, normLening) ||
                other.normLening == normLening) &&
            (identical(other.verduurzaam, verduurzaam) ||
                other.verduurzaam == verduurzaam) &&
            (identical(other.teLenen, teLenen) || other.teLenen == teLenen));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fout,
      const DeepCollectionEquality().hash(berichten),
      normLening,
      verduurzaam,
      teLenen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NormNhgCopyWith<_$NormNhg> get copyWith =>
      __$$NormNhgCopyWithImpl<_$NormNhg>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool fout,
            IList<String> berichten,
            int periode,
            double toetsRenteGemiddeld,
            double teLenen,
            double normLening,
            double extraMaandLast)
        normInkomen,
    required TResult Function(bool fout, IList<String> berichten,
            double normLening, double verduurzaam, double teLenen)
        normWoningWaarde,
    required TResult Function(bool fout, IList<String> berichten,
            double normLening, double verduurzaam, double teLenen)
        normNhg,
  }) {
    return normNhg(fout, berichten, normLening, verduurzaam, teLenen);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool fout,
            IList<String> berichten,
            int periode,
            double toetsRenteGemiddeld,
            double teLenen,
            double normLening,
            double extraMaandLast)?
        normInkomen,
    TResult? Function(bool fout, IList<String> berichten, double normLening,
            double verduurzaam, double teLenen)?
        normWoningWaarde,
    TResult? Function(bool fout, IList<String> berichten, double normLening,
            double verduurzaam, double teLenen)?
        normNhg,
  }) {
    return normNhg?.call(fout, berichten, normLening, verduurzaam, teLenen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool fout,
            IList<String> berichten,
            int periode,
            double toetsRenteGemiddeld,
            double teLenen,
            double normLening,
            double extraMaandLast)?
        normInkomen,
    TResult Function(bool fout, IList<String> berichten, double normLening,
            double verduurzaam, double teLenen)?
        normWoningWaarde,
    TResult Function(bool fout, IList<String> berichten, double normLening,
            double verduurzaam, double teLenen)?
        normNhg,
    required TResult orElse(),
  }) {
    if (normNhg != null) {
      return normNhg(fout, berichten, normLening, verduurzaam, teLenen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NormInkomen value) normInkomen,
    required TResult Function(NormWoningWaarde value) normWoningWaarde,
    required TResult Function(NormNhg value) normNhg,
  }) {
    return normNhg(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NormInkomen value)? normInkomen,
    TResult? Function(NormWoningWaarde value)? normWoningWaarde,
    TResult? Function(NormNhg value)? normNhg,
  }) {
    return normNhg?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NormInkomen value)? normInkomen,
    TResult Function(NormWoningWaarde value)? normWoningWaarde,
    TResult Function(NormNhg value)? normNhg,
    required TResult orElse(),
  }) {
    if (normNhg != null) {
      return normNhg(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NormNhgToJson(
      this,
    );
  }
}

abstract class NormNhg extends Norm {
  const factory NormNhg(
      {final bool fout,
      final IList<String> berichten,
      final double normLening,
      final double verduurzaam,
      final double teLenen}) = _$NormNhg;
  const NormNhg._() : super._();

  factory NormNhg.fromJson(Map<String, dynamic> json) = _$NormNhg.fromJson;

  @override
  bool get fout;
  @override
  IList<String> get berichten;
  @override
  double get normLening;
  double get verduurzaam;
  @override
  double get teLenen;
  @override
  @JsonKey(ignore: true)
  _$$NormNhgCopyWith<_$NormNhg> get copyWith =>
      throw _privateConstructorUsedError;
}

InkomensNormOpDatum _$InkomensNormOpDatumFromJson(Map<String, dynamic> json) {
  return _InkomensNormOpDatum.fromJson(json);
}

/// @nodoc
mixin _$InkomensNormOpDatum {
  DateTime get datum => throw _privateConstructorUsedError;
  double get toetsRenteGemiddeld => throw _privateConstructorUsedError;
  int get periode => throw _privateConstructorUsedError;
  double get teLenen => throw _privateConstructorUsedError;
  double get normLening => throw _privateConstructorUsedError;
  double get verduurzamen => throw _privateConstructorUsedError;
  NormLabel get normLabel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InkomensNormOpDatumCopyWith<InkomensNormOpDatum> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InkomensNormOpDatumCopyWith<$Res> {
  factory $InkomensNormOpDatumCopyWith(
          InkomensNormOpDatum value, $Res Function(InkomensNormOpDatum) then) =
      _$InkomensNormOpDatumCopyWithImpl<$Res, InkomensNormOpDatum>;
  @useResult
  $Res call(
      {DateTime datum,
      double toetsRenteGemiddeld,
      int periode,
      double teLenen,
      double normLening,
      double verduurzamen,
      NormLabel normLabel});

  $NormLabelCopyWith<$Res> get normLabel;
}

/// @nodoc
class _$InkomensNormOpDatumCopyWithImpl<$Res, $Val extends InkomensNormOpDatum>
    implements $InkomensNormOpDatumCopyWith<$Res> {
  _$InkomensNormOpDatumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datum = null,
    Object? toetsRenteGemiddeld = null,
    Object? periode = null,
    Object? teLenen = null,
    Object? normLening = null,
    Object? verduurzamen = null,
    Object? normLabel = null,
  }) {
    return _then(_value.copyWith(
      datum: null == datum
          ? _value.datum
          : datum // ignore: cast_nullable_to_non_nullable
              as DateTime,
      toetsRenteGemiddeld: null == toetsRenteGemiddeld
          ? _value.toetsRenteGemiddeld
          : toetsRenteGemiddeld // ignore: cast_nullable_to_non_nullable
              as double,
      periode: null == periode
          ? _value.periode
          : periode // ignore: cast_nullable_to_non_nullable
              as int,
      teLenen: null == teLenen
          ? _value.teLenen
          : teLenen // ignore: cast_nullable_to_non_nullable
              as double,
      normLening: null == normLening
          ? _value.normLening
          : normLening // ignore: cast_nullable_to_non_nullable
              as double,
      verduurzamen: null == verduurzamen
          ? _value.verduurzamen
          : verduurzamen // ignore: cast_nullable_to_non_nullable
              as double,
      normLabel: null == normLabel
          ? _value.normLabel
          : normLabel // ignore: cast_nullable_to_non_nullable
              as NormLabel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NormLabelCopyWith<$Res> get normLabel {
    return $NormLabelCopyWith<$Res>(_value.normLabel, (value) {
      return _then(_value.copyWith(normLabel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_InkomensNormOpDatumCopyWith<$Res>
    implements $InkomensNormOpDatumCopyWith<$Res> {
  factory _$$_InkomensNormOpDatumCopyWith(_$_InkomensNormOpDatum value,
          $Res Function(_$_InkomensNormOpDatum) then) =
      __$$_InkomensNormOpDatumCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime datum,
      double toetsRenteGemiddeld,
      int periode,
      double teLenen,
      double normLening,
      double verduurzamen,
      NormLabel normLabel});

  @override
  $NormLabelCopyWith<$Res> get normLabel;
}

/// @nodoc
class __$$_InkomensNormOpDatumCopyWithImpl<$Res>
    extends _$InkomensNormOpDatumCopyWithImpl<$Res, _$_InkomensNormOpDatum>
    implements _$$_InkomensNormOpDatumCopyWith<$Res> {
  __$$_InkomensNormOpDatumCopyWithImpl(_$_InkomensNormOpDatum _value,
      $Res Function(_$_InkomensNormOpDatum) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datum = null,
    Object? toetsRenteGemiddeld = null,
    Object? periode = null,
    Object? teLenen = null,
    Object? normLening = null,
    Object? verduurzamen = null,
    Object? normLabel = null,
  }) {
    return _then(_$_InkomensNormOpDatum(
      datum: null == datum
          ? _value.datum
          : datum // ignore: cast_nullable_to_non_nullable
              as DateTime,
      toetsRenteGemiddeld: null == toetsRenteGemiddeld
          ? _value.toetsRenteGemiddeld
          : toetsRenteGemiddeld // ignore: cast_nullable_to_non_nullable
              as double,
      periode: null == periode
          ? _value.periode
          : periode // ignore: cast_nullable_to_non_nullable
              as int,
      teLenen: null == teLenen
          ? _value.teLenen
          : teLenen // ignore: cast_nullable_to_non_nullable
              as double,
      normLening: null == normLening
          ? _value.normLening
          : normLening // ignore: cast_nullable_to_non_nullable
              as double,
      verduurzamen: null == verduurzamen
          ? _value.verduurzamen
          : verduurzamen // ignore: cast_nullable_to_non_nullable
              as double,
      normLabel: null == normLabel
          ? _value.normLabel
          : normLabel // ignore: cast_nullable_to_non_nullable
              as NormLabel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InkomensNormOpDatum implements _InkomensNormOpDatum {
  const _$_InkomensNormOpDatum(
      {required this.datum,
      required this.toetsRenteGemiddeld,
      required this.periode,
      required this.teLenen,
      required this.normLening,
      this.verduurzamen = 0.0,
      this.normLabel = const NormLabel()});

  factory _$_InkomensNormOpDatum.fromJson(Map<String, dynamic> json) =>
      _$$_InkomensNormOpDatumFromJson(json);

  @override
  final DateTime datum;
  @override
  final double toetsRenteGemiddeld;
  @override
  final int periode;
  @override
  final double teLenen;
  @override
  final double normLening;
  @override
  @JsonKey()
  final double verduurzamen;
  @override
  @JsonKey()
  final NormLabel normLabel;

  @override
  String toString() {
    return 'InkomensNormOpDatum(datum: $datum, toetsRenteGemiddeld: $toetsRenteGemiddeld, periode: $periode, teLenen: $teLenen, normLening: $normLening, verduurzamen: $verduurzamen, normLabel: $normLabel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InkomensNormOpDatum &&
            (identical(other.datum, datum) || other.datum == datum) &&
            (identical(other.toetsRenteGemiddeld, toetsRenteGemiddeld) ||
                other.toetsRenteGemiddeld == toetsRenteGemiddeld) &&
            (identical(other.periode, periode) || other.periode == periode) &&
            (identical(other.teLenen, teLenen) || other.teLenen == teLenen) &&
            (identical(other.normLening, normLening) ||
                other.normLening == normLening) &&
            (identical(other.verduurzamen, verduurzamen) ||
                other.verduurzamen == verduurzamen) &&
            (identical(other.normLabel, normLabel) ||
                other.normLabel == normLabel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, datum, toetsRenteGemiddeld,
      periode, teLenen, normLening, verduurzamen, normLabel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InkomensNormOpDatumCopyWith<_$_InkomensNormOpDatum> get copyWith =>
      __$$_InkomensNormOpDatumCopyWithImpl<_$_InkomensNormOpDatum>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InkomensNormOpDatumToJson(
      this,
    );
  }
}

abstract class _InkomensNormOpDatum implements InkomensNormOpDatum {
  const factory _InkomensNormOpDatum(
      {required final DateTime datum,
      required final double toetsRenteGemiddeld,
      required final int periode,
      required final double teLenen,
      required final double normLening,
      final double verduurzamen,
      final NormLabel normLabel}) = _$_InkomensNormOpDatum;

  factory _InkomensNormOpDatum.fromJson(Map<String, dynamic> json) =
      _$_InkomensNormOpDatum.fromJson;

  @override
  DateTime get datum;
  @override
  double get toetsRenteGemiddeld;
  @override
  int get periode;
  @override
  double get teLenen;
  @override
  double get normLening;
  @override
  double get verduurzamen;
  @override
  NormLabel get normLabel;
  @override
  @JsonKey(ignore: true)
  _$$_InkomensNormOpDatumCopyWith<_$_InkomensNormOpDatum> get copyWith =>
      throw _privateConstructorUsedError;
}

NormLabel _$NormLabelFromJson(Map<String, dynamic> json) {
  return _NormLabel.fromJson(json);
}

/// @nodoc
mixin _$NormLabel {
  int get jaar => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  double get extraMaandLast => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NormLabelCopyWith<NormLabel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NormLabelCopyWith<$Res> {
  factory $NormLabelCopyWith(NormLabel value, $Res Function(NormLabel) then) =
      _$NormLabelCopyWithImpl<$Res, NormLabel>;
  @useResult
  $Res call({int jaar, String label, double extraMaandLast});
}

/// @nodoc
class _$NormLabelCopyWithImpl<$Res, $Val extends NormLabel>
    implements $NormLabelCopyWith<$Res> {
  _$NormLabelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jaar = null,
    Object? label = null,
    Object? extraMaandLast = null,
  }) {
    return _then(_value.copyWith(
      jaar: null == jaar
          ? _value.jaar
          : jaar // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      extraMaandLast: null == extraMaandLast
          ? _value.extraMaandLast
          : extraMaandLast // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NormLabelCopyWith<$Res> implements $NormLabelCopyWith<$Res> {
  factory _$$_NormLabelCopyWith(
          _$_NormLabel value, $Res Function(_$_NormLabel) then) =
      __$$_NormLabelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int jaar, String label, double extraMaandLast});
}

/// @nodoc
class __$$_NormLabelCopyWithImpl<$Res>
    extends _$NormLabelCopyWithImpl<$Res, _$_NormLabel>
    implements _$$_NormLabelCopyWith<$Res> {
  __$$_NormLabelCopyWithImpl(
      _$_NormLabel _value, $Res Function(_$_NormLabel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jaar = null,
    Object? label = null,
    Object? extraMaandLast = null,
  }) {
    return _then(_$_NormLabel(
      jaar: null == jaar
          ? _value.jaar
          : jaar // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      extraMaandLast: null == extraMaandLast
          ? _value.extraMaandLast
          : extraMaandLast // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NormLabel implements _NormLabel {
  const _$_NormLabel(
      {this.jaar = 0, this.label = '', this.extraMaandLast = 0.0});

  factory _$_NormLabel.fromJson(Map<String, dynamic> json) =>
      _$$_NormLabelFromJson(json);

  @override
  @JsonKey()
  final int jaar;
  @override
  @JsonKey()
  final String label;
  @override
  @JsonKey()
  final double extraMaandLast;

  @override
  String toString() {
    return 'NormLabel(jaar: $jaar, label: $label, extraMaandLast: $extraMaandLast)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NormLabel &&
            (identical(other.jaar, jaar) || other.jaar == jaar) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.extraMaandLast, extraMaandLast) ||
                other.extraMaandLast == extraMaandLast));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, jaar, label, extraMaandLast);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NormLabelCopyWith<_$_NormLabel> get copyWith =>
      __$$_NormLabelCopyWithImpl<_$_NormLabel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NormLabelToJson(
      this,
    );
  }
}

abstract class _NormLabel implements NormLabel {
  const factory _NormLabel(
      {final int jaar,
      final String label,
      final double extraMaandLast}) = _$_NormLabel;

  factory _NormLabel.fromJson(Map<String, dynamic> json) =
      _$_NormLabel.fromJson;

  @override
  int get jaar;
  @override
  String get label;
  @override
  double get extraMaandLast;
  @override
  @JsonKey(ignore: true)
  _$$_NormLabelCopyWith<_$_NormLabel> get copyWith =>
      throw _privateConstructorUsedError;
}
