// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hypotheek.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Hypotheek _$HypotheekFromJson(Map<String, dynamic> json) {
  return $Hypotheek.fromJson(json);
}

/// @nodoc
mixin _$Hypotheek {
  String get id => throw _privateConstructorUsedError;
  String get omschrijving => throw _privateConstructorUsedError;
  OptiesHypotheekToevoegen get optiesHypotheekToevoegen =>
      throw _privateConstructorUsedError;
  double get lening => throw _privateConstructorUsedError;
  double get gewensteLening =>
      throw _privateConstructorUsedError; // @Default(NormInkomen(omschrijving: 'Inkomen')) NormInkomen normInkomen,
// @Default(NormWoningwaarde(omschrijving: 'Woningwaarde'))
// NormWoningwaarde normWoningwaarde,
// @Default(NormNhg(omschrijving: 'NHG')) NormNhg normNhg,
  DateTime get startDatum => throw _privateConstructorUsedError;
  bool get periodePerMaand => throw _privateConstructorUsedError;
  bool get eersteGebrokenMaandAlleenRente => throw _privateConstructorUsedError;
  DateTime get eindDatum => throw _privateConstructorUsedError;
  int get periodeInMaanden => throw _privateConstructorUsedError;
  int get aflosTermijnInMaanden => throw _privateConstructorUsedError;
  HypotheekVorm get hypotheekvorm => throw _privateConstructorUsedError;
  IList<Termijn> get termijnen => throw _privateConstructorUsedError;
  double get rente => throw _privateConstructorUsedError;
  IList<RenteVanafPeriode> get renteVanafPeriode =>
      throw _privateConstructorUsedError;
  double get boeteVrijPercentage => throw _privateConstructorUsedError;
  double get minLening => throw _privateConstructorUsedError;
  IList<LeningAanpassen> get aanpassenLening =>
      throw _privateConstructorUsedError;
  String get volgende => throw _privateConstructorUsedError;
  String get vorige => throw _privateConstructorUsedError;
  IMap<String, int> get order =>
      throw _privateConstructorUsedError; // required DateTime datumNormGegevens,
  bool get deelsAfgelosteLening => throw _privateConstructorUsedError;
  DateTime get datumDeelsAfgelosteLening => throw _privateConstructorUsedError;
  bool get afgesloten => throw _privateConstructorUsedError;
  double get restSchuld =>
      throw _privateConstructorUsedError; // @Default(null) DateTime? woningWaarde,
// @Default(null) DateTime? kosten,
// @Default(null) DateTime? kostenVerbouwen,
// @Default(true) bool nhgMogelijk,
  IMap<DateTime, NormInkomen> get dNormInkomen =>
      throw _privateConstructorUsedError;
  IMap<DateTime, NormWoningWaarde> get dNormWoningWaarde =>
      throw _privateConstructorUsedError;
  IMap<DateTime, NormNhg> get dNormNhg => throw _privateConstructorUsedError;
  IMap<DateTime, IList<StatusLening>> get dStatusParralleleLeningen =>
      throw _privateConstructorUsedError;
  double? get maxLening => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HypotheekCopyWith<Hypotheek> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HypotheekCopyWith<$Res> {
  factory $HypotheekCopyWith(Hypotheek value, $Res Function(Hypotheek) then) =
      _$HypotheekCopyWithImpl<$Res, Hypotheek>;
  @useResult
  $Res call(
      {String id,
      String omschrijving,
      OptiesHypotheekToevoegen optiesHypotheekToevoegen,
      double lening,
      double gewensteLening,
      DateTime startDatum,
      bool periodePerMaand,
      bool eersteGebrokenMaandAlleenRente,
      DateTime eindDatum,
      int periodeInMaanden,
      int aflosTermijnInMaanden,
      HypotheekVorm hypotheekvorm,
      IList<Termijn> termijnen,
      double rente,
      IList<RenteVanafPeriode> renteVanafPeriode,
      double boeteVrijPercentage,
      double minLening,
      IList<LeningAanpassen> aanpassenLening,
      String volgende,
      String vorige,
      IMap<String, int> order,
      bool deelsAfgelosteLening,
      DateTime datumDeelsAfgelosteLening,
      bool afgesloten,
      double restSchuld,
      IMap<DateTime, NormInkomen> dNormInkomen,
      IMap<DateTime, NormWoningWaarde> dNormWoningWaarde,
      IMap<DateTime, NormNhg> dNormNhg,
      IMap<DateTime, IList<StatusLening>> dStatusParralleleLeningen,
      double? maxLening});
}

/// @nodoc
class _$HypotheekCopyWithImpl<$Res, $Val extends Hypotheek>
    implements $HypotheekCopyWith<$Res> {
  _$HypotheekCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? omschrijving = null,
    Object? optiesHypotheekToevoegen = null,
    Object? lening = null,
    Object? gewensteLening = null,
    Object? startDatum = null,
    Object? periodePerMaand = null,
    Object? eersteGebrokenMaandAlleenRente = null,
    Object? eindDatum = null,
    Object? periodeInMaanden = null,
    Object? aflosTermijnInMaanden = null,
    Object? hypotheekvorm = null,
    Object? termijnen = null,
    Object? rente = null,
    Object? renteVanafPeriode = null,
    Object? boeteVrijPercentage = null,
    Object? minLening = null,
    Object? aanpassenLening = null,
    Object? volgende = null,
    Object? vorige = null,
    Object? order = null,
    Object? deelsAfgelosteLening = null,
    Object? datumDeelsAfgelosteLening = null,
    Object? afgesloten = null,
    Object? restSchuld = null,
    Object? dNormInkomen = null,
    Object? dNormWoningWaarde = null,
    Object? dNormNhg = null,
    Object? dStatusParralleleLeningen = null,
    Object? maxLening = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      omschrijving: null == omschrijving
          ? _value.omschrijving
          : omschrijving // ignore: cast_nullable_to_non_nullable
              as String,
      optiesHypotheekToevoegen: null == optiesHypotheekToevoegen
          ? _value.optiesHypotheekToevoegen
          : optiesHypotheekToevoegen // ignore: cast_nullable_to_non_nullable
              as OptiesHypotheekToevoegen,
      lening: null == lening
          ? _value.lening
          : lening // ignore: cast_nullable_to_non_nullable
              as double,
      gewensteLening: null == gewensteLening
          ? _value.gewensteLening
          : gewensteLening // ignore: cast_nullable_to_non_nullable
              as double,
      startDatum: null == startDatum
          ? _value.startDatum
          : startDatum // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodePerMaand: null == periodePerMaand
          ? _value.periodePerMaand
          : periodePerMaand // ignore: cast_nullable_to_non_nullable
              as bool,
      eersteGebrokenMaandAlleenRente: null == eersteGebrokenMaandAlleenRente
          ? _value.eersteGebrokenMaandAlleenRente
          : eersteGebrokenMaandAlleenRente // ignore: cast_nullable_to_non_nullable
              as bool,
      eindDatum: null == eindDatum
          ? _value.eindDatum
          : eindDatum // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodeInMaanden: null == periodeInMaanden
          ? _value.periodeInMaanden
          : periodeInMaanden // ignore: cast_nullable_to_non_nullable
              as int,
      aflosTermijnInMaanden: null == aflosTermijnInMaanden
          ? _value.aflosTermijnInMaanden
          : aflosTermijnInMaanden // ignore: cast_nullable_to_non_nullable
              as int,
      hypotheekvorm: null == hypotheekvorm
          ? _value.hypotheekvorm
          : hypotheekvorm // ignore: cast_nullable_to_non_nullable
              as HypotheekVorm,
      termijnen: null == termijnen
          ? _value.termijnen
          : termijnen // ignore: cast_nullable_to_non_nullable
              as IList<Termijn>,
      rente: null == rente
          ? _value.rente
          : rente // ignore: cast_nullable_to_non_nullable
              as double,
      renteVanafPeriode: null == renteVanafPeriode
          ? _value.renteVanafPeriode
          : renteVanafPeriode // ignore: cast_nullable_to_non_nullable
              as IList<RenteVanafPeriode>,
      boeteVrijPercentage: null == boeteVrijPercentage
          ? _value.boeteVrijPercentage
          : boeteVrijPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      minLening: null == minLening
          ? _value.minLening
          : minLening // ignore: cast_nullable_to_non_nullable
              as double,
      aanpassenLening: null == aanpassenLening
          ? _value.aanpassenLening
          : aanpassenLening // ignore: cast_nullable_to_non_nullable
              as IList<LeningAanpassen>,
      volgende: null == volgende
          ? _value.volgende
          : volgende // ignore: cast_nullable_to_non_nullable
              as String,
      vorige: null == vorige
          ? _value.vorige
          : vorige // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as IMap<String, int>,
      deelsAfgelosteLening: null == deelsAfgelosteLening
          ? _value.deelsAfgelosteLening
          : deelsAfgelosteLening // ignore: cast_nullable_to_non_nullable
              as bool,
      datumDeelsAfgelosteLening: null == datumDeelsAfgelosteLening
          ? _value.datumDeelsAfgelosteLening
          : datumDeelsAfgelosteLening // ignore: cast_nullable_to_non_nullable
              as DateTime,
      afgesloten: null == afgesloten
          ? _value.afgesloten
          : afgesloten // ignore: cast_nullable_to_non_nullable
              as bool,
      restSchuld: null == restSchuld
          ? _value.restSchuld
          : restSchuld // ignore: cast_nullable_to_non_nullable
              as double,
      dNormInkomen: null == dNormInkomen
          ? _value.dNormInkomen
          : dNormInkomen // ignore: cast_nullable_to_non_nullable
              as IMap<DateTime, NormInkomen>,
      dNormWoningWaarde: null == dNormWoningWaarde
          ? _value.dNormWoningWaarde
          : dNormWoningWaarde // ignore: cast_nullable_to_non_nullable
              as IMap<DateTime, NormWoningWaarde>,
      dNormNhg: null == dNormNhg
          ? _value.dNormNhg
          : dNormNhg // ignore: cast_nullable_to_non_nullable
              as IMap<DateTime, NormNhg>,
      dStatusParralleleLeningen: null == dStatusParralleleLeningen
          ? _value.dStatusParralleleLeningen
          : dStatusParralleleLeningen // ignore: cast_nullable_to_non_nullable
              as IMap<DateTime, IList<StatusLening>>,
      maxLening: freezed == maxLening
          ? _value.maxLening
          : maxLening // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$$HypotheekCopyWith<$Res> implements $HypotheekCopyWith<$Res> {
  factory _$$$HypotheekCopyWith(
          _$$Hypotheek value, $Res Function(_$$Hypotheek) then) =
      __$$$HypotheekCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String omschrijving,
      OptiesHypotheekToevoegen optiesHypotheekToevoegen,
      double lening,
      double gewensteLening,
      DateTime startDatum,
      bool periodePerMaand,
      bool eersteGebrokenMaandAlleenRente,
      DateTime eindDatum,
      int periodeInMaanden,
      int aflosTermijnInMaanden,
      HypotheekVorm hypotheekvorm,
      IList<Termijn> termijnen,
      double rente,
      IList<RenteVanafPeriode> renteVanafPeriode,
      double boeteVrijPercentage,
      double minLening,
      IList<LeningAanpassen> aanpassenLening,
      String volgende,
      String vorige,
      IMap<String, int> order,
      bool deelsAfgelosteLening,
      DateTime datumDeelsAfgelosteLening,
      bool afgesloten,
      double restSchuld,
      IMap<DateTime, NormInkomen> dNormInkomen,
      IMap<DateTime, NormWoningWaarde> dNormWoningWaarde,
      IMap<DateTime, NormNhg> dNormNhg,
      IMap<DateTime, IList<StatusLening>> dStatusParralleleLeningen,
      double? maxLening});
}

/// @nodoc
class __$$$HypotheekCopyWithImpl<$Res>
    extends _$HypotheekCopyWithImpl<$Res, _$$Hypotheek>
    implements _$$$HypotheekCopyWith<$Res> {
  __$$$HypotheekCopyWithImpl(
      _$$Hypotheek _value, $Res Function(_$$Hypotheek) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? omschrijving = null,
    Object? optiesHypotheekToevoegen = null,
    Object? lening = null,
    Object? gewensteLening = null,
    Object? startDatum = null,
    Object? periodePerMaand = null,
    Object? eersteGebrokenMaandAlleenRente = null,
    Object? eindDatum = null,
    Object? periodeInMaanden = null,
    Object? aflosTermijnInMaanden = null,
    Object? hypotheekvorm = null,
    Object? termijnen = null,
    Object? rente = null,
    Object? renteVanafPeriode = null,
    Object? boeteVrijPercentage = null,
    Object? minLening = null,
    Object? aanpassenLening = null,
    Object? volgende = null,
    Object? vorige = null,
    Object? order = null,
    Object? deelsAfgelosteLening = null,
    Object? datumDeelsAfgelosteLening = null,
    Object? afgesloten = null,
    Object? restSchuld = null,
    Object? dNormInkomen = null,
    Object? dNormWoningWaarde = null,
    Object? dNormNhg = null,
    Object? dStatusParralleleLeningen = null,
    Object? maxLening = freezed,
  }) {
    return _then(_$$Hypotheek(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      omschrijving: null == omschrijving
          ? _value.omschrijving
          : omschrijving // ignore: cast_nullable_to_non_nullable
              as String,
      optiesHypotheekToevoegen: null == optiesHypotheekToevoegen
          ? _value.optiesHypotheekToevoegen
          : optiesHypotheekToevoegen // ignore: cast_nullable_to_non_nullable
              as OptiesHypotheekToevoegen,
      lening: null == lening
          ? _value.lening
          : lening // ignore: cast_nullable_to_non_nullable
              as double,
      gewensteLening: null == gewensteLening
          ? _value.gewensteLening
          : gewensteLening // ignore: cast_nullable_to_non_nullable
              as double,
      startDatum: null == startDatum
          ? _value.startDatum
          : startDatum // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodePerMaand: null == periodePerMaand
          ? _value.periodePerMaand
          : periodePerMaand // ignore: cast_nullable_to_non_nullable
              as bool,
      eersteGebrokenMaandAlleenRente: null == eersteGebrokenMaandAlleenRente
          ? _value.eersteGebrokenMaandAlleenRente
          : eersteGebrokenMaandAlleenRente // ignore: cast_nullable_to_non_nullable
              as bool,
      eindDatum: null == eindDatum
          ? _value.eindDatum
          : eindDatum // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodeInMaanden: null == periodeInMaanden
          ? _value.periodeInMaanden
          : periodeInMaanden // ignore: cast_nullable_to_non_nullable
              as int,
      aflosTermijnInMaanden: null == aflosTermijnInMaanden
          ? _value.aflosTermijnInMaanden
          : aflosTermijnInMaanden // ignore: cast_nullable_to_non_nullable
              as int,
      hypotheekvorm: null == hypotheekvorm
          ? _value.hypotheekvorm
          : hypotheekvorm // ignore: cast_nullable_to_non_nullable
              as HypotheekVorm,
      termijnen: null == termijnen
          ? _value.termijnen
          : termijnen // ignore: cast_nullable_to_non_nullable
              as IList<Termijn>,
      rente: null == rente
          ? _value.rente
          : rente // ignore: cast_nullable_to_non_nullable
              as double,
      renteVanafPeriode: null == renteVanafPeriode
          ? _value.renteVanafPeriode
          : renteVanafPeriode // ignore: cast_nullable_to_non_nullable
              as IList<RenteVanafPeriode>,
      boeteVrijPercentage: null == boeteVrijPercentage
          ? _value.boeteVrijPercentage
          : boeteVrijPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      minLening: null == minLening
          ? _value.minLening
          : minLening // ignore: cast_nullable_to_non_nullable
              as double,
      aanpassenLening: null == aanpassenLening
          ? _value.aanpassenLening
          : aanpassenLening // ignore: cast_nullable_to_non_nullable
              as IList<LeningAanpassen>,
      volgende: null == volgende
          ? _value.volgende
          : volgende // ignore: cast_nullable_to_non_nullable
              as String,
      vorige: null == vorige
          ? _value.vorige
          : vorige // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as IMap<String, int>,
      deelsAfgelosteLening: null == deelsAfgelosteLening
          ? _value.deelsAfgelosteLening
          : deelsAfgelosteLening // ignore: cast_nullable_to_non_nullable
              as bool,
      datumDeelsAfgelosteLening: null == datumDeelsAfgelosteLening
          ? _value.datumDeelsAfgelosteLening
          : datumDeelsAfgelosteLening // ignore: cast_nullable_to_non_nullable
              as DateTime,
      afgesloten: null == afgesloten
          ? _value.afgesloten
          : afgesloten // ignore: cast_nullable_to_non_nullable
              as bool,
      restSchuld: null == restSchuld
          ? _value.restSchuld
          : restSchuld // ignore: cast_nullable_to_non_nullable
              as double,
      dNormInkomen: null == dNormInkomen
          ? _value.dNormInkomen
          : dNormInkomen // ignore: cast_nullable_to_non_nullable
              as IMap<DateTime, NormInkomen>,
      dNormWoningWaarde: null == dNormWoningWaarde
          ? _value.dNormWoningWaarde
          : dNormWoningWaarde // ignore: cast_nullable_to_non_nullable
              as IMap<DateTime, NormWoningWaarde>,
      dNormNhg: null == dNormNhg
          ? _value.dNormNhg
          : dNormNhg // ignore: cast_nullable_to_non_nullable
              as IMap<DateTime, NormNhg>,
      dStatusParralleleLeningen: null == dStatusParralleleLeningen
          ? _value.dStatusParralleleLeningen
          : dStatusParralleleLeningen // ignore: cast_nullable_to_non_nullable
              as IMap<DateTime, IList<StatusLening>>,
      maxLening: freezed == maxLening
          ? _value.maxLening
          : maxLening // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$$Hypotheek extends $Hypotheek {
  const _$$Hypotheek(
      {required this.id,
      required this.omschrijving,
      required this.optiesHypotheekToevoegen,
      this.lening = 0,
      this.gewensteLening = 0,
      required this.startDatum,
      required this.periodePerMaand,
      this.eersteGebrokenMaandAlleenRente = true,
      required this.eindDatum,
      required this.periodeInMaanden,
      required this.aflosTermijnInMaanden,
      required this.hypotheekvorm,
      this.termijnen = const IListConst([]),
      required this.rente,
      this.renteVanafPeriode = const IListConst([]),
      required this.boeteVrijPercentage,
      required this.minLening,
      this.aanpassenLening = const IListConst([]),
      this.volgende = "",
      this.vorige = "",
      this.order = const IMapConst({}),
      required this.deelsAfgelosteLening,
      required this.datumDeelsAfgelosteLening,
      required this.afgesloten,
      this.restSchuld = 0.0,
      this.dNormInkomen = const IMapConst(<DateTime, NormInkomen>{}),
      this.dNormWoningWaarde = const IMapConst(<DateTime, NormWoningWaarde>{}),
      this.dNormNhg = const IMapConst(<DateTime, NormNhg>{}),
      this.dStatusParralleleLeningen =
          const IMapConst(<DateTime, IList<StatusLening>>{}),
      this.maxLening = null})
      : super._();

  factory _$$Hypotheek.fromJson(Map<String, dynamic> json) =>
      _$$$HypotheekFromJson(json);

  @override
  final String id;
  @override
  final String omschrijving;
  @override
  final OptiesHypotheekToevoegen optiesHypotheekToevoegen;
  @override
  @JsonKey()
  final double lening;
  @override
  @JsonKey()
  final double gewensteLening;
// @Default(NormInkomen(omschrijving: 'Inkomen')) NormInkomen normInkomen,
// @Default(NormWoningwaarde(omschrijving: 'Woningwaarde'))
// NormWoningwaarde normWoningwaarde,
// @Default(NormNhg(omschrijving: 'NHG')) NormNhg normNhg,
  @override
  final DateTime startDatum;
  @override
  final bool periodePerMaand;
  @override
  @JsonKey()
  final bool eersteGebrokenMaandAlleenRente;
  @override
  final DateTime eindDatum;
  @override
  final int periodeInMaanden;
  @override
  final int aflosTermijnInMaanden;
  @override
  final HypotheekVorm hypotheekvorm;
  @override
  @JsonKey()
  final IList<Termijn> termijnen;
  @override
  final double rente;
  @override
  @JsonKey()
  final IList<RenteVanafPeriode> renteVanafPeriode;
  @override
  final double boeteVrijPercentage;
  @override
  final double minLening;
  @override
  @JsonKey()
  final IList<LeningAanpassen> aanpassenLening;
  @override
  @JsonKey()
  final String volgende;
  @override
  @JsonKey()
  final String vorige;
  @override
  @JsonKey()
  final IMap<String, int> order;
// required DateTime datumNormGegevens,
  @override
  final bool deelsAfgelosteLening;
  @override
  final DateTime datumDeelsAfgelosteLening;
  @override
  final bool afgesloten;
  @override
  @JsonKey()
  final double restSchuld;
// @Default(null) DateTime? woningWaarde,
// @Default(null) DateTime? kosten,
// @Default(null) DateTime? kostenVerbouwen,
// @Default(true) bool nhgMogelijk,
  @override
  @JsonKey()
  final IMap<DateTime, NormInkomen> dNormInkomen;
  @override
  @JsonKey()
  final IMap<DateTime, NormWoningWaarde> dNormWoningWaarde;
  @override
  @JsonKey()
  final IMap<DateTime, NormNhg> dNormNhg;
  @override
  @JsonKey()
  final IMap<DateTime, IList<StatusLening>> dStatusParralleleLeningen;
  @override
  @JsonKey()
  final double? maxLening;

  @override
  String toString() {
    return 'Hypotheek(id: $id, omschrijving: $omschrijving, optiesHypotheekToevoegen: $optiesHypotheekToevoegen, lening: $lening, gewensteLening: $gewensteLening, startDatum: $startDatum, periodePerMaand: $periodePerMaand, eersteGebrokenMaandAlleenRente: $eersteGebrokenMaandAlleenRente, eindDatum: $eindDatum, periodeInMaanden: $periodeInMaanden, aflosTermijnInMaanden: $aflosTermijnInMaanden, hypotheekvorm: $hypotheekvorm, termijnen: $termijnen, rente: $rente, renteVanafPeriode: $renteVanafPeriode, boeteVrijPercentage: $boeteVrijPercentage, minLening: $minLening, aanpassenLening: $aanpassenLening, volgende: $volgende, vorige: $vorige, order: $order, deelsAfgelosteLening: $deelsAfgelosteLening, datumDeelsAfgelosteLening: $datumDeelsAfgelosteLening, afgesloten: $afgesloten, restSchuld: $restSchuld, dNormInkomen: $dNormInkomen, dNormWoningWaarde: $dNormWoningWaarde, dNormNhg: $dNormNhg, dStatusParralleleLeningen: $dStatusParralleleLeningen, maxLening: $maxLening)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$Hypotheek &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.omschrijving, omschrijving) ||
                other.omschrijving == omschrijving) &&
            (identical(other.optiesHypotheekToevoegen, optiesHypotheekToevoegen) ||
                other.optiesHypotheekToevoegen == optiesHypotheekToevoegen) &&
            (identical(other.lening, lening) || other.lening == lening) &&
            (identical(other.gewensteLening, gewensteLening) ||
                other.gewensteLening == gewensteLening) &&
            (identical(other.startDatum, startDatum) ||
                other.startDatum == startDatum) &&
            (identical(other.periodePerMaand, periodePerMaand) ||
                other.periodePerMaand == periodePerMaand) &&
            (identical(other.eersteGebrokenMaandAlleenRente,
                    eersteGebrokenMaandAlleenRente) ||
                other.eersteGebrokenMaandAlleenRente ==
                    eersteGebrokenMaandAlleenRente) &&
            (identical(other.eindDatum, eindDatum) ||
                other.eindDatum == eindDatum) &&
            (identical(other.periodeInMaanden, periodeInMaanden) ||
                other.periodeInMaanden == periodeInMaanden) &&
            (identical(other.aflosTermijnInMaanden, aflosTermijnInMaanden) ||
                other.aflosTermijnInMaanden == aflosTermijnInMaanden) &&
            (identical(other.hypotheekvorm, hypotheekvorm) ||
                other.hypotheekvorm == hypotheekvorm) &&
            const DeepCollectionEquality().equals(other.termijnen, termijnen) &&
            (identical(other.rente, rente) || other.rente == rente) &&
            const DeepCollectionEquality()
                .equals(other.renteVanafPeriode, renteVanafPeriode) &&
            (identical(other.boeteVrijPercentage, boeteVrijPercentage) ||
                other.boeteVrijPercentage == boeteVrijPercentage) &&
            (identical(other.minLening, minLening) ||
                other.minLening == minLening) &&
            const DeepCollectionEquality()
                .equals(other.aanpassenLening, aanpassenLening) &&
            (identical(other.volgende, volgende) ||
                other.volgende == volgende) &&
            (identical(other.vorige, vorige) || other.vorige == vorige) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.deelsAfgelosteLening, deelsAfgelosteLening) ||
                other.deelsAfgelosteLening == deelsAfgelosteLening) &&
            (identical(other.datumDeelsAfgelosteLening, datumDeelsAfgelosteLening) ||
                other.datumDeelsAfgelosteLening == datumDeelsAfgelosteLening) &&
            (identical(other.afgesloten, afgesloten) ||
                other.afgesloten == afgesloten) &&
            (identical(other.restSchuld, restSchuld) ||
                other.restSchuld == restSchuld) &&
            (identical(other.dNormInkomen, dNormInkomen) ||
                other.dNormInkomen == dNormInkomen) &&
            (identical(other.dNormWoningWaarde, dNormWoningWaarde) ||
                other.dNormWoningWaarde == dNormWoningWaarde) &&
            (identical(other.dNormNhg, dNormNhg) ||
                other.dNormNhg == dNormNhg) &&
            (identical(other.dStatusParralleleLeningen, dStatusParralleleLeningen) ||
                other.dStatusParralleleLeningen == dStatusParralleleLeningen) &&
            (identical(other.maxLening, maxLening) || other.maxLening == maxLening));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        omschrijving,
        optiesHypotheekToevoegen,
        lening,
        gewensteLening,
        startDatum,
        periodePerMaand,
        eersteGebrokenMaandAlleenRente,
        eindDatum,
        periodeInMaanden,
        aflosTermijnInMaanden,
        hypotheekvorm,
        const DeepCollectionEquality().hash(termijnen),
        rente,
        const DeepCollectionEquality().hash(renteVanafPeriode),
        boeteVrijPercentage,
        minLening,
        const DeepCollectionEquality().hash(aanpassenLening),
        volgende,
        vorige,
        order,
        deelsAfgelosteLening,
        datumDeelsAfgelosteLening,
        afgesloten,
        restSchuld,
        dNormInkomen,
        dNormWoningWaarde,
        dNormNhg,
        dStatusParralleleLeningen,
        maxLening
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$HypotheekCopyWith<_$$Hypotheek> get copyWith =>
      __$$$HypotheekCopyWithImpl<_$$Hypotheek>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$$HypotheekToJson(
      this,
    );
  }
}

abstract class $Hypotheek extends Hypotheek {
  const factory $Hypotheek(
      {required final String id,
      required final String omschrijving,
      required final OptiesHypotheekToevoegen optiesHypotheekToevoegen,
      final double lening,
      final double gewensteLening,
      required final DateTime startDatum,
      required final bool periodePerMaand,
      final bool eersteGebrokenMaandAlleenRente,
      required final DateTime eindDatum,
      required final int periodeInMaanden,
      required final int aflosTermijnInMaanden,
      required final HypotheekVorm hypotheekvorm,
      final IList<Termijn> termijnen,
      required final double rente,
      final IList<RenteVanafPeriode> renteVanafPeriode,
      required final double boeteVrijPercentage,
      required final double minLening,
      final IList<LeningAanpassen> aanpassenLening,
      final String volgende,
      final String vorige,
      final IMap<String, int> order,
      required final bool deelsAfgelosteLening,
      required final DateTime datumDeelsAfgelosteLening,
      required final bool afgesloten,
      final double restSchuld,
      final IMap<DateTime, NormInkomen> dNormInkomen,
      final IMap<DateTime, NormWoningWaarde> dNormWoningWaarde,
      final IMap<DateTime, NormNhg> dNormNhg,
      final IMap<DateTime, IList<StatusLening>> dStatusParralleleLeningen,
      final double? maxLening}) = _$$Hypotheek;
  const $Hypotheek._() : super._();

  factory $Hypotheek.fromJson(Map<String, dynamic> json) =
      _$$Hypotheek.fromJson;

  @override
  String get id;
  @override
  String get omschrijving;
  @override
  OptiesHypotheekToevoegen get optiesHypotheekToevoegen;
  @override
  double get lening;
  @override
  double get gewensteLening;
  @override // @Default(NormInkomen(omschrijving: 'Inkomen')) NormInkomen normInkomen,
// @Default(NormWoningwaarde(omschrijving: 'Woningwaarde'))
// NormWoningwaarde normWoningwaarde,
// @Default(NormNhg(omschrijving: 'NHG')) NormNhg normNhg,
  DateTime get startDatum;
  @override
  bool get periodePerMaand;
  @override
  bool get eersteGebrokenMaandAlleenRente;
  @override
  DateTime get eindDatum;
  @override
  int get periodeInMaanden;
  @override
  int get aflosTermijnInMaanden;
  @override
  HypotheekVorm get hypotheekvorm;
  @override
  IList<Termijn> get termijnen;
  @override
  double get rente;
  @override
  IList<RenteVanafPeriode> get renteVanafPeriode;
  @override
  double get boeteVrijPercentage;
  @override
  double get minLening;
  @override
  IList<LeningAanpassen> get aanpassenLening;
  @override
  String get volgende;
  @override
  String get vorige;
  @override
  IMap<String, int> get order;
  @override // required DateTime datumNormGegevens,
  bool get deelsAfgelosteLening;
  @override
  DateTime get datumDeelsAfgelosteLening;
  @override
  bool get afgesloten;
  @override
  double get restSchuld;
  @override // @Default(null) DateTime? woningWaarde,
// @Default(null) DateTime? kosten,
// @Default(null) DateTime? kostenVerbouwen,
// @Default(true) bool nhgMogelijk,
  IMap<DateTime, NormInkomen> get dNormInkomen;
  @override
  IMap<DateTime, NormWoningWaarde> get dNormWoningWaarde;
  @override
  IMap<DateTime, NormNhg> get dNormNhg;
  @override
  IMap<DateTime, IList<StatusLening>> get dStatusParralleleLeningen;
  @override
  double? get maxLening;
  @override
  @JsonKey(ignore: true)
  _$$$HypotheekCopyWith<_$$Hypotheek> get copyWith =>
      throw _privateConstructorUsedError;
}
