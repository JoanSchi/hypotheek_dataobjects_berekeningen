// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'norm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NormInkomen _$$NormInkomenFromJson(Map<String, dynamic> json) =>
    _$NormInkomen(
      fout: json['fout'] as bool? ?? false,
      berichten: json['berichten'] == null
          ? const IListConst([])
          : IList<String>.fromJson(
              json['berichten'], (value) => value as String),
      periode: json['periode'] as int? ?? 0,
      toetsRenteGemiddeld:
          (json['toetsRenteGemiddeld'] as num?)?.toDouble() ?? 0.0,
      teLenen: (json['teLenen'] as num?)?.toDouble() ?? 0.0,
      normLening: (json['normLening'] as num?)?.toDouble() ?? 0.0,
      extraMaandLast: (json['extraMaandLast'] as num?)?.toDouble() ?? 0.0,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NormInkomenToJson(_$NormInkomen instance) =>
    <String, dynamic>{
      'fout': instance.fout,
      'berichten': instance.berichten.toJson(
        (value) => value,
      ),
      'periode': instance.periode,
      'toetsRenteGemiddeld': instance.toetsRenteGemiddeld,
      'teLenen': instance.teLenen,
      'normLening': instance.normLening,
      'extraMaandLast': instance.extraMaandLast,
      'runtimeType': instance.$type,
    };

_$NormWoningWaarde _$$NormWoningWaardeFromJson(Map<String, dynamic> json) =>
    _$NormWoningWaarde(
      fout: json['fout'] as bool? ?? false,
      berichten: json['berichten'] == null
          ? const IListConst([])
          : IList<String>.fromJson(
              json['berichten'], (value) => value as String),
      normLening: (json['normLening'] as num?)?.toDouble() ?? 0.0,
      verduurzaam: (json['verduurzaam'] as num?)?.toDouble() ?? 0.0,
      teLenen: (json['teLenen'] as num?)?.toDouble() ?? 0.0,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NormWoningWaardeToJson(_$NormWoningWaarde instance) =>
    <String, dynamic>{
      'fout': instance.fout,
      'berichten': instance.berichten.toJson(
        (value) => value,
      ),
      'normLening': instance.normLening,
      'verduurzaam': instance.verduurzaam,
      'teLenen': instance.teLenen,
      'runtimeType': instance.$type,
    };

_$NormNhg _$$NormNhgFromJson(Map<String, dynamic> json) => _$NormNhg(
      fout: json['fout'] as bool? ?? false,
      berichten: json['berichten'] == null
          ? const IListConst([])
          : IList<String>.fromJson(
              json['berichten'], (value) => value as String),
      normLening: (json['normLening'] as num?)?.toDouble() ?? 0.0,
      verduurzaam: (json['verduurzaam'] as num?)?.toDouble() ?? 0.0,
      teLenen: (json['teLenen'] as num?)?.toDouble() ?? 0.0,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NormNhgToJson(_$NormNhg instance) => <String, dynamic>{
      'fout': instance.fout,
      'berichten': instance.berichten.toJson(
        (value) => value,
      ),
      'normLening': instance.normLening,
      'verduurzaam': instance.verduurzaam,
      'teLenen': instance.teLenen,
      'runtimeType': instance.$type,
    };

_$_InkomensNormOpDatum _$$_InkomensNormOpDatumFromJson(
        Map<String, dynamic> json) =>
    _$_InkomensNormOpDatum(
      datum: DateTime.parse(json['datum'] as String),
      toetsRenteGemiddeld: (json['toetsRenteGemiddeld'] as num).toDouble(),
      periode: json['periode'] as int,
      teLenen: (json['teLenen'] as num).toDouble(),
      normLening: (json['normLening'] as num).toDouble(),
      verduurzamen: (json['verduurzamen'] as num?)?.toDouble() ?? 0.0,
      normLabel: json['normLabel'] == null
          ? const NormLabel()
          : NormLabel.fromJson(json['normLabel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_InkomensNormOpDatumToJson(
        _$_InkomensNormOpDatum instance) =>
    <String, dynamic>{
      'datum': instance.datum.toIso8601String(),
      'toetsRenteGemiddeld': instance.toetsRenteGemiddeld,
      'periode': instance.periode,
      'teLenen': instance.teLenen,
      'normLening': instance.normLening,
      'verduurzamen': instance.verduurzamen,
      'normLabel': instance.normLabel,
    };

_$_NormLabel _$$_NormLabelFromJson(Map<String, dynamic> json) => _$_NormLabel(
      jaar: json['jaar'] as int? ?? 0,
      label: json['label'] as String? ?? '',
      extraMaandLast: (json['extraMaandLast'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$_NormLabelToJson(_$_NormLabel instance) =>
    <String, dynamic>{
      'jaar': instance.jaar,
      'label': instance.label,
      'extraMaandLast': instance.extraMaandLast,
    };
