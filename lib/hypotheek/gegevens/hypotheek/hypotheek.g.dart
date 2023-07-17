// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hypotheek.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$Hypotheek _$$$HypotheekFromJson(Map<String, dynamic> json) => _$$Hypotheek(
      id: json['id'] as String,
      omschrijving: json['omschrijving'] as String,
      optiesHypotheekToevoegen: $enumDecode(
          _$OptiesHypotheekToevoegenEnumMap, json['optiesHypotheekToevoegen']),
      lening: (json['lening'] as num?)?.toDouble() ?? 0,
      gewensteLening: (json['gewensteLening'] as num?)?.toDouble() ?? 0,
      startDatum: DateTime.parse(json['startDatum'] as String),
      periodePerMaand: json['periodePerMaand'] as bool,
      eersteGebrokenMaandAlleenRente:
          json['eersteGebrokenMaandAlleenRente'] as bool? ?? true,
      eindDatum: DateTime.parse(json['eindDatum'] as String),
      periodeInMaanden: json['periodeInMaanden'] as int,
      aflosTermijnInMaanden: json['aflosTermijnInMaanden'] as int,
      hypotheekvorm: $enumDecode(_$HypotheekVormEnumMap, json['hypotheekvorm']),
      termijnen: json['termijnen'] == null
          ? const IListConst([])
          : IList<Termijn>.fromJson(json['termijnen'],
              (value) => Termijn.fromJson(value as Map<String, dynamic>)),
      rente: (json['rente'] as num).toDouble(),
      renteVanafPeriode: json['renteVanafPeriode'] == null
          ? const IListConst([])
          : IList<RenteVanafPeriode>.fromJson(
              json['renteVanafPeriode'],
              (value) =>
                  RenteVanafPeriode.fromJson(value as Map<String, dynamic>)),
      boeteVrijPercentage: (json['boeteVrijPercentage'] as num).toDouble(),
      minLening: (json['minLening'] as num).toDouble(),
      aanpassenLening: json['aanpassenLening'] == null
          ? const IListConst([])
          : IList<LeningAanpassen>.fromJson(
              json['aanpassenLening'],
              (value) =>
                  LeningAanpassen.fromJson(value as Map<String, dynamic>)),
      volgende: json['volgende'] as String? ?? "",
      vorige: json['vorige'] as String? ?? "",
      order: json['order'] == null
          ? const IMapConst({})
          : IMap<String, int>.fromJson(json['order'] as Map<String, dynamic>,
              (value) => value as String, (value) => value as int),
      deelsAfgelosteLening: json['deelsAfgelosteLening'] as bool,
      datumDeelsAfgelosteLening:
          DateTime.parse(json['datumDeelsAfgelosteLening'] as String),
      afgesloten: json['afgesloten'] as bool,
      restSchuld: (json['restSchuld'] as num?)?.toDouble() ?? 0.0,
      dNormInkomen: json['dNormInkomen'] == null
          ? const IMapConst(<DateTime, NormInkomen>{})
          : IMap<DateTime, NormInkomen>.fromJson(
              json['dNormInkomen'] as Map<String, dynamic>,
              (value) => DateTime.parse(value as String),
              (value) => NormInkomen.fromJson(value as Map<String, dynamic>)),
      dNormWoningWaarde: json['dNormWoningWaarde'] == null
          ? const IMapConst(<DateTime, NormWoningWaarde>{})
          : IMap<DateTime, NormWoningWaarde>.fromJson(
              json['dNormWoningWaarde'] as Map<String, dynamic>,
              (value) => DateTime.parse(value as String),
              (value) =>
                  NormWoningWaarde.fromJson(value as Map<String, dynamic>)),
      dNormNhg: json['dNormNhg'] == null
          ? const IMapConst(<DateTime, NormNhg>{})
          : IMap<DateTime, NormNhg>.fromJson(
              json['dNormNhg'] as Map<String, dynamic>,
              (value) => DateTime.parse(value as String),
              (value) => NormNhg.fromJson(value as Map<String, dynamic>)),
      dStatusParralleleLeningen: json['dStatusParralleleLeningen'] == null
          ? const IMapConst(<DateTime, IList<StatusLening>>{})
          : IMap<DateTime, IList<StatusLening>>.fromJson(
              json['dStatusParralleleLeningen'] as Map<String, dynamic>,
              (value) => DateTime.parse(value as String),
              (value) => IList<StatusLening>.fromJson(
                  value,
                  (value) =>
                      StatusLening.fromJson(value as Map<String, dynamic>))),
      maxLening: (json['maxLening'] as num?)?.toDouble() ?? null,
    );

Map<String, dynamic> _$$$HypotheekToJson(_$$Hypotheek instance) =>
    <String, dynamic>{
      'id': instance.id,
      'omschrijving': instance.omschrijving,
      'optiesHypotheekToevoegen':
          _$OptiesHypotheekToevoegenEnumMap[instance.optiesHypotheekToevoegen]!,
      'lening': instance.lening,
      'gewensteLening': instance.gewensteLening,
      'startDatum': instance.startDatum.toIso8601String(),
      'periodePerMaand': instance.periodePerMaand,
      'eersteGebrokenMaandAlleenRente': instance.eersteGebrokenMaandAlleenRente,
      'eindDatum': instance.eindDatum.toIso8601String(),
      'periodeInMaanden': instance.periodeInMaanden,
      'aflosTermijnInMaanden': instance.aflosTermijnInMaanden,
      'hypotheekvorm': _$HypotheekVormEnumMap[instance.hypotheekvorm]!,
      'termijnen': instance.termijnen.toJson(
        (value) => value,
      ),
      'rente': instance.rente,
      'renteVanafPeriode': instance.renteVanafPeriode.toJson(
        (value) => value,
      ),
      'boeteVrijPercentage': instance.boeteVrijPercentage,
      'minLening': instance.minLening,
      'aanpassenLening': instance.aanpassenLening.toJson(
        (value) => value,
      ),
      'volgende': instance.volgende,
      'vorige': instance.vorige,
      'order': instance.order.toJson(
        (value) => value,
        (value) => value,
      ),
      'deelsAfgelosteLening': instance.deelsAfgelosteLening,
      'datumDeelsAfgelosteLening':
          instance.datumDeelsAfgelosteLening.toIso8601String(),
      'afgesloten': instance.afgesloten,
      'restSchuld': instance.restSchuld,
      'dNormInkomen': instance.dNormInkomen.toJson(
        (value) => value.toIso8601String(),
        (value) => value,
      ),
      'dNormWoningWaarde': instance.dNormWoningWaarde.toJson(
        (value) => value.toIso8601String(),
        (value) => value,
      ),
      'dNormNhg': instance.dNormNhg.toJson(
        (value) => value.toIso8601String(),
        (value) => value,
      ),
      'dStatusParralleleLeningen': instance.dStatusParralleleLeningen.toJson(
        (value) => value.toIso8601String(),
        (value) => value.toJson(
          (value) => value,
        ),
      ),
      'maxLening': instance.maxLening,
    };

const _$OptiesHypotheekToevoegenEnumMap = {
  OptiesHypotheekToevoegen.nieuw: 'nieuw',
  OptiesHypotheekToevoegen.verlengen: 'verlengen',
};

const _$HypotheekVormEnumMap = {
  HypotheekVorm.aflosvrij: 'aflosvrij',
  HypotheekVorm.lineair: 'lineair',
  HypotheekVorm.annuiteit: 'annuiteit',
};
