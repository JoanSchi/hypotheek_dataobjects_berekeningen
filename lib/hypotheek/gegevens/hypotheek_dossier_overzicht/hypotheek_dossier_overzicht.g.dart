// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hypotheek_dossier_overzicht.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HypotheekDossierOverzicht _$$_HypotheekDossierOverzichtFromJson(
        Map<String, dynamic> json) =>
    _$_HypotheekDossierOverzicht(
      hypotheekDossiers: json['hypotheekDossiers'] == null
          ? const IMapConst({})
          : IMap<String, HypotheekDossier>.fromJson(
              json['hypotheekDossiers'] as Map<String, dynamic>,
              (value) => value as String,
              (value) =>
                  HypotheekDossier.fromJson(value as Map<String, dynamic>)),
      geselecteerd: json['geselecteerd'] as String? ?? '',
    );

Map<String, dynamic> _$$_HypotheekDossierOverzichtToJson(
        _$_HypotheekDossierOverzicht instance) =>
    <String, dynamic>{
      'hypotheekDossiers': instance.hypotheekDossiers.toJson(
        (value) => value,
        (value) => value,
      ),
      'geselecteerd': instance.geselecteerd,
    };
