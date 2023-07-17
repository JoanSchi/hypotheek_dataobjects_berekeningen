// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hypotheek_dossier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HypotheekDossier _$$_HypotheekDossierFromJson(Map<String, dynamic> json) =>
    _$_HypotheekDossier(
      id: json['id'] as String? ?? '',
      hypotheken: json['hypotheken'] == null
          ? const IMapConst({})
          : IMap<String, Hypotheek>.fromJson(
              json['hypotheken'] as Map<String, dynamic>,
              (value) => value as String,
              (value) => Hypotheek.fromJson(value as Map<String, dynamic>)),
      eersteHypotheken: json['eersteHypotheken'] == null
          ? const IListConst([])
          : IList<String>.fromJson(
              json['eersteHypotheken'], (value) => value as String),
      omschrijving: json['omschrijving'] as String? ?? '',
      inkomensNormToepassen: json['inkomensNormToepassen'] as bool? ?? true,
      woningWaardeNormToepassen:
          json['woningWaardeNormToepassen'] as bool? ?? true,
      doelHypotheekOverzicht: $enumDecodeNullable(
              _$DoelHypotheekOverzichtEnumMap,
              json['doelHypotheekOverzicht']) ??
          DoelHypotheekOverzicht.nieuweWoning,
      starter: json['starter'] as bool? ?? false,
      eigenWoning: json['eigenWoning'] as bool? ?? false,
      ewrToepassen: json['ewrToepassen'] as bool? ?? true,
      ewrBerekenen: json['ewrBerekenen'] as bool? ?? false,
      ewr: (json['ewr'] as num?)?.toDouble() ?? 0.0,
      kosten: json['kosten'] == null
          ? const IListConst([])
          : IList<Waarde>.fromJson(json['kosten'],
              (value) => Waarde.fromJson(value as Map<String, dynamic>)),
      woningWaarde: (json['woningWaarde'] as num?)?.toDouble() ?? 0.0,
      oorspronkelijkeHoofdsom:
          (json['oorspronkelijkeHoofdsom'] as num?)?.toDouble() ?? 0.0,
      restSchuld: (json['restSchuld'] as num?)?.toDouble() ?? 0.0,
      dWoningWaarde: json['dWoningWaarde'] == null
          ? const IMapConst(<DateTime, WoningWaarde>{})
          : IMap<DateTime, WoningWaarde>.fromJson(
              json['dWoningWaarde'] as Map<String, dynamic>,
              (value) => DateTime.parse(value as String),
              (value) => WoningWaarde.fromJson(value as Map<String, dynamic>)),
      dKosten: json['dKosten'] == null
          ? const IMapConst(<DateTime, KostenWoningLening>{})
          : IMap<DateTime, KostenWoningLening>.fromJson(
              json['dKosten'] as Map<String, dynamic>,
              (value) => DateTime.parse(value as String),
              (value) =>
                  KostenWoningLening.fromJson(value as Map<String, dynamic>)),
      dNormenToepassen: json['dNormenToepassen'] == null
          ? const IMapConst(<DateTime, NormenToepassen>{})
          : IMap<DateTime, NormenToepassen>.fromJson(
              json['dNormenToepassen'] as Map<String, dynamic>,
              (value) => DateTime.parse(value as String),
              (value) =>
                  NormenToepassen.fromJson(value as Map<String, dynamic>)),
    );

Map<String, dynamic> _$$_HypotheekDossierToJson(_$_HypotheekDossier instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hypotheken': instance.hypotheken.toJson(
        (value) => value,
        (value) => value,
      ),
      'eersteHypotheken': instance.eersteHypotheken.toJson(
        (value) => value,
      ),
      'omschrijving': instance.omschrijving,
      'inkomensNormToepassen': instance.inkomensNormToepassen,
      'woningWaardeNormToepassen': instance.woningWaardeNormToepassen,
      'doelHypotheekOverzicht':
          _$DoelHypotheekOverzichtEnumMap[instance.doelHypotheekOverzicht]!,
      'starter': instance.starter,
      'eigenWoning': instance.eigenWoning,
      'ewrToepassen': instance.ewrToepassen,
      'ewrBerekenen': instance.ewrBerekenen,
      'ewr': instance.ewr,
      'kosten': instance.kosten.toJson(
        (value) => value,
      ),
      'woningWaarde': instance.woningWaarde,
      'oorspronkelijkeHoofdsom': instance.oorspronkelijkeHoofdsom,
      'restSchuld': instance.restSchuld,
      'dWoningWaarde': instance.dWoningWaarde.toJson(
        (value) => value.toIso8601String(),
        (value) => value,
      ),
      'dKosten': instance.dKosten.toJson(
        (value) => value.toIso8601String(),
        (value) => value,
      ),
      'dNormenToepassen': instance.dNormenToepassen.toJson(
        (value) => value.toIso8601String(),
        (value) => value,
      ),
    };

const _$DoelHypotheekOverzichtEnumMap = {
  DoelHypotheekOverzicht.nieuweWoning: 'nieuweWoning',
  DoelHypotheekOverzicht.huidigeWoning: 'huidigeWoning',
};
