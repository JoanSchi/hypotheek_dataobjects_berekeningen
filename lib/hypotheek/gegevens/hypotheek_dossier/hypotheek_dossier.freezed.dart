// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hypotheek_dossier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HypotheekDossier _$HypotheekDossierFromJson(Map<String, dynamic> json) {
  return _HypotheekDossier.fromJson(json);
}

/// @nodoc
mixin _$HypotheekDossier {
  String get id => throw _privateConstructorUsedError;
  IMap<String, Hypotheek> get hypotheken => throw _privateConstructorUsedError;
  IList<String> get eersteHypotheken => throw _privateConstructorUsedError;
  String get omschrijving => throw _privateConstructorUsedError;
  bool get inkomensNormToepassen => throw _privateConstructorUsedError;
  bool get woningWaardeNormToepassen => throw _privateConstructorUsedError;
  DoelHypotheekOverzicht get doelHypotheekOverzicht =>
      throw _privateConstructorUsedError;
  bool get starter => throw _privateConstructorUsedError;
  bool get eigenWoning =>
      throw _privateConstructorUsedError; //EigenWoningReserve
  bool get ewrToepassen => throw _privateConstructorUsedError;
  bool get ewrBerekenen => throw _privateConstructorUsedError;
  double get ewr => throw _privateConstructorUsedError; //Huidige/Vorige Woning
  IList<Waarde> get kosten => throw _privateConstructorUsedError;
  double get woningWaarde => throw _privateConstructorUsedError;
  double get oorspronkelijkeHoofdsom => throw _privateConstructorUsedError;
  double get restSchuld =>
      throw _privateConstructorUsedError; //Gegevens op datum
  IMap<DateTime, WoningWaarde> get dWoningWaarde =>
      throw _privateConstructorUsedError;
  IMap<DateTime, KostenWoningLening> get dKosten =>
      throw _privateConstructorUsedError; //Finacieringsnorm
  IMap<DateTime, NormenToepassen> get dNormenToepassen =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HypotheekDossierCopyWith<HypotheekDossier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HypotheekDossierCopyWith<$Res> {
  factory $HypotheekDossierCopyWith(
          HypotheekDossier value, $Res Function(HypotheekDossier) then) =
      _$HypotheekDossierCopyWithImpl<$Res, HypotheekDossier>;
  @useResult
  $Res call(
      {String id,
      IMap<String, Hypotheek> hypotheken,
      IList<String> eersteHypotheken,
      String omschrijving,
      bool inkomensNormToepassen,
      bool woningWaardeNormToepassen,
      DoelHypotheekOverzicht doelHypotheekOverzicht,
      bool starter,
      bool eigenWoning,
      bool ewrToepassen,
      bool ewrBerekenen,
      double ewr,
      IList<Waarde> kosten,
      double woningWaarde,
      double oorspronkelijkeHoofdsom,
      double restSchuld,
      IMap<DateTime, WoningWaarde> dWoningWaarde,
      IMap<DateTime, KostenWoningLening> dKosten,
      IMap<DateTime, NormenToepassen> dNormenToepassen});
}

/// @nodoc
class _$HypotheekDossierCopyWithImpl<$Res, $Val extends HypotheekDossier>
    implements $HypotheekDossierCopyWith<$Res> {
  _$HypotheekDossierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hypotheken = null,
    Object? eersteHypotheken = null,
    Object? omschrijving = null,
    Object? inkomensNormToepassen = null,
    Object? woningWaardeNormToepassen = null,
    Object? doelHypotheekOverzicht = null,
    Object? starter = null,
    Object? eigenWoning = null,
    Object? ewrToepassen = null,
    Object? ewrBerekenen = null,
    Object? ewr = null,
    Object? kosten = null,
    Object? woningWaarde = null,
    Object? oorspronkelijkeHoofdsom = null,
    Object? restSchuld = null,
    Object? dWoningWaarde = null,
    Object? dKosten = null,
    Object? dNormenToepassen = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hypotheken: null == hypotheken
          ? _value.hypotheken
          : hypotheken // ignore: cast_nullable_to_non_nullable
              as IMap<String, Hypotheek>,
      eersteHypotheken: null == eersteHypotheken
          ? _value.eersteHypotheken
          : eersteHypotheken // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      omschrijving: null == omschrijving
          ? _value.omschrijving
          : omschrijving // ignore: cast_nullable_to_non_nullable
              as String,
      inkomensNormToepassen: null == inkomensNormToepassen
          ? _value.inkomensNormToepassen
          : inkomensNormToepassen // ignore: cast_nullable_to_non_nullable
              as bool,
      woningWaardeNormToepassen: null == woningWaardeNormToepassen
          ? _value.woningWaardeNormToepassen
          : woningWaardeNormToepassen // ignore: cast_nullable_to_non_nullable
              as bool,
      doelHypotheekOverzicht: null == doelHypotheekOverzicht
          ? _value.doelHypotheekOverzicht
          : doelHypotheekOverzicht // ignore: cast_nullable_to_non_nullable
              as DoelHypotheekOverzicht,
      starter: null == starter
          ? _value.starter
          : starter // ignore: cast_nullable_to_non_nullable
              as bool,
      eigenWoning: null == eigenWoning
          ? _value.eigenWoning
          : eigenWoning // ignore: cast_nullable_to_non_nullable
              as bool,
      ewrToepassen: null == ewrToepassen
          ? _value.ewrToepassen
          : ewrToepassen // ignore: cast_nullable_to_non_nullable
              as bool,
      ewrBerekenen: null == ewrBerekenen
          ? _value.ewrBerekenen
          : ewrBerekenen // ignore: cast_nullable_to_non_nullable
              as bool,
      ewr: null == ewr
          ? _value.ewr
          : ewr // ignore: cast_nullable_to_non_nullable
              as double,
      kosten: null == kosten
          ? _value.kosten
          : kosten // ignore: cast_nullable_to_non_nullable
              as IList<Waarde>,
      woningWaarde: null == woningWaarde
          ? _value.woningWaarde
          : woningWaarde // ignore: cast_nullable_to_non_nullable
              as double,
      oorspronkelijkeHoofdsom: null == oorspronkelijkeHoofdsom
          ? _value.oorspronkelijkeHoofdsom
          : oorspronkelijkeHoofdsom // ignore: cast_nullable_to_non_nullable
              as double,
      restSchuld: null == restSchuld
          ? _value.restSchuld
          : restSchuld // ignore: cast_nullable_to_non_nullable
              as double,
      dWoningWaarde: null == dWoningWaarde
          ? _value.dWoningWaarde
          : dWoningWaarde // ignore: cast_nullable_to_non_nullable
              as IMap<DateTime, WoningWaarde>,
      dKosten: null == dKosten
          ? _value.dKosten
          : dKosten // ignore: cast_nullable_to_non_nullable
              as IMap<DateTime, KostenWoningLening>,
      dNormenToepassen: null == dNormenToepassen
          ? _value.dNormenToepassen
          : dNormenToepassen // ignore: cast_nullable_to_non_nullable
              as IMap<DateTime, NormenToepassen>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HypotheekDossierCopyWith<$Res>
    implements $HypotheekDossierCopyWith<$Res> {
  factory _$$_HypotheekDossierCopyWith(
          _$_HypotheekDossier value, $Res Function(_$_HypotheekDossier) then) =
      __$$_HypotheekDossierCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      IMap<String, Hypotheek> hypotheken,
      IList<String> eersteHypotheken,
      String omschrijving,
      bool inkomensNormToepassen,
      bool woningWaardeNormToepassen,
      DoelHypotheekOverzicht doelHypotheekOverzicht,
      bool starter,
      bool eigenWoning,
      bool ewrToepassen,
      bool ewrBerekenen,
      double ewr,
      IList<Waarde> kosten,
      double woningWaarde,
      double oorspronkelijkeHoofdsom,
      double restSchuld,
      IMap<DateTime, WoningWaarde> dWoningWaarde,
      IMap<DateTime, KostenWoningLening> dKosten,
      IMap<DateTime, NormenToepassen> dNormenToepassen});
}

/// @nodoc
class __$$_HypotheekDossierCopyWithImpl<$Res>
    extends _$HypotheekDossierCopyWithImpl<$Res, _$_HypotheekDossier>
    implements _$$_HypotheekDossierCopyWith<$Res> {
  __$$_HypotheekDossierCopyWithImpl(
      _$_HypotheekDossier _value, $Res Function(_$_HypotheekDossier) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hypotheken = null,
    Object? eersteHypotheken = null,
    Object? omschrijving = null,
    Object? inkomensNormToepassen = null,
    Object? woningWaardeNormToepassen = null,
    Object? doelHypotheekOverzicht = null,
    Object? starter = null,
    Object? eigenWoning = null,
    Object? ewrToepassen = null,
    Object? ewrBerekenen = null,
    Object? ewr = null,
    Object? kosten = null,
    Object? woningWaarde = null,
    Object? oorspronkelijkeHoofdsom = null,
    Object? restSchuld = null,
    Object? dWoningWaarde = null,
    Object? dKosten = null,
    Object? dNormenToepassen = null,
  }) {
    return _then(_$_HypotheekDossier(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hypotheken: null == hypotheken
          ? _value.hypotheken
          : hypotheken // ignore: cast_nullable_to_non_nullable
              as IMap<String, Hypotheek>,
      eersteHypotheken: null == eersteHypotheken
          ? _value.eersteHypotheken
          : eersteHypotheken // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      omschrijving: null == omschrijving
          ? _value.omschrijving
          : omschrijving // ignore: cast_nullable_to_non_nullable
              as String,
      inkomensNormToepassen: null == inkomensNormToepassen
          ? _value.inkomensNormToepassen
          : inkomensNormToepassen // ignore: cast_nullable_to_non_nullable
              as bool,
      woningWaardeNormToepassen: null == woningWaardeNormToepassen
          ? _value.woningWaardeNormToepassen
          : woningWaardeNormToepassen // ignore: cast_nullable_to_non_nullable
              as bool,
      doelHypotheekOverzicht: null == doelHypotheekOverzicht
          ? _value.doelHypotheekOverzicht
          : doelHypotheekOverzicht // ignore: cast_nullable_to_non_nullable
              as DoelHypotheekOverzicht,
      starter: null == starter
          ? _value.starter
          : starter // ignore: cast_nullable_to_non_nullable
              as bool,
      eigenWoning: null == eigenWoning
          ? _value.eigenWoning
          : eigenWoning // ignore: cast_nullable_to_non_nullable
              as bool,
      ewrToepassen: null == ewrToepassen
          ? _value.ewrToepassen
          : ewrToepassen // ignore: cast_nullable_to_non_nullable
              as bool,
      ewrBerekenen: null == ewrBerekenen
          ? _value.ewrBerekenen
          : ewrBerekenen // ignore: cast_nullable_to_non_nullable
              as bool,
      ewr: null == ewr
          ? _value.ewr
          : ewr // ignore: cast_nullable_to_non_nullable
              as double,
      kosten: null == kosten
          ? _value.kosten
          : kosten // ignore: cast_nullable_to_non_nullable
              as IList<Waarde>,
      woningWaarde: null == woningWaarde
          ? _value.woningWaarde
          : woningWaarde // ignore: cast_nullable_to_non_nullable
              as double,
      oorspronkelijkeHoofdsom: null == oorspronkelijkeHoofdsom
          ? _value.oorspronkelijkeHoofdsom
          : oorspronkelijkeHoofdsom // ignore: cast_nullable_to_non_nullable
              as double,
      restSchuld: null == restSchuld
          ? _value.restSchuld
          : restSchuld // ignore: cast_nullable_to_non_nullable
              as double,
      dWoningWaarde: null == dWoningWaarde
          ? _value.dWoningWaarde
          : dWoningWaarde // ignore: cast_nullable_to_non_nullable
              as IMap<DateTime, WoningWaarde>,
      dKosten: null == dKosten
          ? _value.dKosten
          : dKosten // ignore: cast_nullable_to_non_nullable
              as IMap<DateTime, KostenWoningLening>,
      dNormenToepassen: null == dNormenToepassen
          ? _value.dNormenToepassen
          : dNormenToepassen // ignore: cast_nullable_to_non_nullable
              as IMap<DateTime, NormenToepassen>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HypotheekDossier extends _HypotheekDossier {
  const _$_HypotheekDossier(
      {this.id = '',
      this.hypotheken = const IMapConst({}),
      this.eersteHypotheken = const IListConst([]),
      this.omschrijving = '',
      this.inkomensNormToepassen = true,
      this.woningWaardeNormToepassen = true,
      this.doelHypotheekOverzicht = DoelHypotheekOverzicht.nieuweWoning,
      this.starter = false,
      this.eigenWoning = false,
      this.ewrToepassen = true,
      this.ewrBerekenen = false,
      this.ewr = 0.0,
      this.kosten = const IListConst([]),
      this.woningWaarde = 0.0,
      this.oorspronkelijkeHoofdsom = 0.0,
      this.restSchuld = 0.0,
      this.dWoningWaarde = const IMapConst(<DateTime, WoningWaarde>{}),
      this.dKosten = const IMapConst(<DateTime, KostenWoningLening>{}),
      this.dNormenToepassen = const IMapConst(<DateTime, NormenToepassen>{})})
      : super._();

  factory _$_HypotheekDossier.fromJson(Map<String, dynamic> json) =>
      _$$_HypotheekDossierFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final IMap<String, Hypotheek> hypotheken;
  @override
  @JsonKey()
  final IList<String> eersteHypotheken;
  @override
  @JsonKey()
  final String omschrijving;
  @override
  @JsonKey()
  final bool inkomensNormToepassen;
  @override
  @JsonKey()
  final bool woningWaardeNormToepassen;
  @override
  @JsonKey()
  final DoelHypotheekOverzicht doelHypotheekOverzicht;
  @override
  @JsonKey()
  final bool starter;
  @override
  @JsonKey()
  final bool eigenWoning;
//EigenWoningReserve
  @override
  @JsonKey()
  final bool ewrToepassen;
  @override
  @JsonKey()
  final bool ewrBerekenen;
  @override
  @JsonKey()
  final double ewr;
//Huidige/Vorige Woning
  @override
  @JsonKey()
  final IList<Waarde> kosten;
  @override
  @JsonKey()
  final double woningWaarde;
  @override
  @JsonKey()
  final double oorspronkelijkeHoofdsom;
  @override
  @JsonKey()
  final double restSchuld;
//Gegevens op datum
  @override
  @JsonKey()
  final IMap<DateTime, WoningWaarde> dWoningWaarde;
  @override
  @JsonKey()
  final IMap<DateTime, KostenWoningLening> dKosten;
//Finacieringsnorm
  @override
  @JsonKey()
  final IMap<DateTime, NormenToepassen> dNormenToepassen;

  @override
  String toString() {
    return 'HypotheekDossier(id: $id, hypotheken: $hypotheken, eersteHypotheken: $eersteHypotheken, omschrijving: $omschrijving, inkomensNormToepassen: $inkomensNormToepassen, woningWaardeNormToepassen: $woningWaardeNormToepassen, doelHypotheekOverzicht: $doelHypotheekOverzicht, starter: $starter, eigenWoning: $eigenWoning, ewrToepassen: $ewrToepassen, ewrBerekenen: $ewrBerekenen, ewr: $ewr, kosten: $kosten, woningWaarde: $woningWaarde, oorspronkelijkeHoofdsom: $oorspronkelijkeHoofdsom, restSchuld: $restSchuld, dWoningWaarde: $dWoningWaarde, dKosten: $dKosten, dNormenToepassen: $dNormenToepassen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HypotheekDossier &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hypotheken, hypotheken) ||
                other.hypotheken == hypotheken) &&
            const DeepCollectionEquality()
                .equals(other.eersteHypotheken, eersteHypotheken) &&
            (identical(other.omschrijving, omschrijving) ||
                other.omschrijving == omschrijving) &&
            (identical(other.inkomensNormToepassen, inkomensNormToepassen) ||
                other.inkomensNormToepassen == inkomensNormToepassen) &&
            (identical(other.woningWaardeNormToepassen,
                    woningWaardeNormToepassen) ||
                other.woningWaardeNormToepassen == woningWaardeNormToepassen) &&
            (identical(other.doelHypotheekOverzicht, doelHypotheekOverzicht) ||
                other.doelHypotheekOverzicht == doelHypotheekOverzicht) &&
            (identical(other.starter, starter) || other.starter == starter) &&
            (identical(other.eigenWoning, eigenWoning) ||
                other.eigenWoning == eigenWoning) &&
            (identical(other.ewrToepassen, ewrToepassen) ||
                other.ewrToepassen == ewrToepassen) &&
            (identical(other.ewrBerekenen, ewrBerekenen) ||
                other.ewrBerekenen == ewrBerekenen) &&
            (identical(other.ewr, ewr) || other.ewr == ewr) &&
            const DeepCollectionEquality().equals(other.kosten, kosten) &&
            (identical(other.woningWaarde, woningWaarde) ||
                other.woningWaarde == woningWaarde) &&
            (identical(
                    other.oorspronkelijkeHoofdsom, oorspronkelijkeHoofdsom) ||
                other.oorspronkelijkeHoofdsom == oorspronkelijkeHoofdsom) &&
            (identical(other.restSchuld, restSchuld) ||
                other.restSchuld == restSchuld) &&
            (identical(other.dWoningWaarde, dWoningWaarde) ||
                other.dWoningWaarde == dWoningWaarde) &&
            (identical(other.dKosten, dKosten) || other.dKosten == dKosten) &&
            (identical(other.dNormenToepassen, dNormenToepassen) ||
                other.dNormenToepassen == dNormenToepassen));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        hypotheken,
        const DeepCollectionEquality().hash(eersteHypotheken),
        omschrijving,
        inkomensNormToepassen,
        woningWaardeNormToepassen,
        doelHypotheekOverzicht,
        starter,
        eigenWoning,
        ewrToepassen,
        ewrBerekenen,
        ewr,
        const DeepCollectionEquality().hash(kosten),
        woningWaarde,
        oorspronkelijkeHoofdsom,
        restSchuld,
        dWoningWaarde,
        dKosten,
        dNormenToepassen
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HypotheekDossierCopyWith<_$_HypotheekDossier> get copyWith =>
      __$$_HypotheekDossierCopyWithImpl<_$_HypotheekDossier>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HypotheekDossierToJson(
      this,
    );
  }
}

abstract class _HypotheekDossier extends HypotheekDossier {
  const factory _HypotheekDossier(
          {final String id,
          final IMap<String, Hypotheek> hypotheken,
          final IList<String> eersteHypotheken,
          final String omschrijving,
          final bool inkomensNormToepassen,
          final bool woningWaardeNormToepassen,
          final DoelHypotheekOverzicht doelHypotheekOverzicht,
          final bool starter,
          final bool eigenWoning,
          final bool ewrToepassen,
          final bool ewrBerekenen,
          final double ewr,
          final IList<Waarde> kosten,
          final double woningWaarde,
          final double oorspronkelijkeHoofdsom,
          final double restSchuld,
          final IMap<DateTime, WoningWaarde> dWoningWaarde,
          final IMap<DateTime, KostenWoningLening> dKosten,
          final IMap<DateTime, NormenToepassen> dNormenToepassen}) =
      _$_HypotheekDossier;
  const _HypotheekDossier._() : super._();

  factory _HypotheekDossier.fromJson(Map<String, dynamic> json) =
      _$_HypotheekDossier.fromJson;

  @override
  String get id;
  @override
  IMap<String, Hypotheek> get hypotheken;
  @override
  IList<String> get eersteHypotheken;
  @override
  String get omschrijving;
  @override
  bool get inkomensNormToepassen;
  @override
  bool get woningWaardeNormToepassen;
  @override
  DoelHypotheekOverzicht get doelHypotheekOverzicht;
  @override
  bool get starter;
  @override
  bool get eigenWoning;
  @override //EigenWoningReserve
  bool get ewrToepassen;
  @override
  bool get ewrBerekenen;
  @override
  double get ewr;
  @override //Huidige/Vorige Woning
  IList<Waarde> get kosten;
  @override
  double get woningWaarde;
  @override
  double get oorspronkelijkeHoofdsom;
  @override
  double get restSchuld;
  @override //Gegevens op datum
  IMap<DateTime, WoningWaarde> get dWoningWaarde;
  @override
  IMap<DateTime, KostenWoningLening> get dKosten;
  @override //Finacieringsnorm
  IMap<DateTime, NormenToepassen> get dNormenToepassen;
  @override
  @JsonKey(ignore: true)
  _$$_HypotheekDossierCopyWith<_$_HypotheekDossier> get copyWith =>
      throw _privateConstructorUsedError;
}
