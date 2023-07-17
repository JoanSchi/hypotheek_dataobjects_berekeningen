// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'termijn.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Termijn _$$_TermijnFromJson(Map<String, dynamic> json) => _$_Termijn(
      startPeriode: DateTime.parse(json['startPeriode'] as String),
      eindPeriode: DateTime.parse(json['eindPeriode'] as String),
      startDatum: DateTime.parse(json['startDatum'] as String),
      eindDatum: DateTime.parse(json['eindDatum'] as String),
      hypotheekVorm: $enumDecode(_$HypotheekVormEnumMap, json['hypotheekVorm']),
      rente: (json['rente'] as num).toDouble(),
      renteBedrag: (json['renteBedrag'] as num).toDouble(),
      lening: (json['lening'] as num).toDouble(),
      aflossen: (json['aflossen'] as num).toDouble(),
      extraAflossen: (json['extraAflossen'] as num).toDouble(),
      extraLenen: (json['extraLenen'] as num).toDouble(),
      periode: json['periode'] as int,
      periodesTotVolgendeRente: json['periodesTotVolgendeRente'] as int,
      aflossenTotaal: (json['aflossenTotaal'] as num).toDouble(),
      renteTotaal: (json['renteTotaal'] as num).toDouble(),
      extraLenenTotaal: (json['extraLenenTotaal'] as num).toDouble(),
      laatsteTermijn: json['laatsteTermijn'] as bool,
      laatsteVanPeriode: json['laatsteVanPeriode'] as bool,
    );

Map<String, dynamic> _$$_TermijnToJson(_$_Termijn instance) =>
    <String, dynamic>{
      'startPeriode': instance.startPeriode.toIso8601String(),
      'eindPeriode': instance.eindPeriode.toIso8601String(),
      'startDatum': instance.startDatum.toIso8601String(),
      'eindDatum': instance.eindDatum.toIso8601String(),
      'hypotheekVorm': _$HypotheekVormEnumMap[instance.hypotheekVorm]!,
      'rente': instance.rente,
      'renteBedrag': instance.renteBedrag,
      'lening': instance.lening,
      'aflossen': instance.aflossen,
      'extraAflossen': instance.extraAflossen,
      'extraLenen': instance.extraLenen,
      'periode': instance.periode,
      'periodesTotVolgendeRente': instance.periodesTotVolgendeRente,
      'aflossenTotaal': instance.aflossenTotaal,
      'renteTotaal': instance.renteTotaal,
      'extraLenenTotaal': instance.extraLenenTotaal,
      'laatsteTermijn': instance.laatsteTermijn,
      'laatsteVanPeriode': instance.laatsteVanPeriode,
    };

const _$HypotheekVormEnumMap = {
  HypotheekVorm.aflosvrij: 'aflosvrij',
  HypotheekVorm.lineair: 'lineair',
  HypotheekVorm.annuiteit: 'annuiteit',
};
