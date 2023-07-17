// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kosten_verbouwen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KostenVerbouwen _$$_KostenVerbouwenFromJson(Map<String, dynamic> json) =>
    _$_KostenVerbouwen(
      ids: json['ids'] == null
          ? const IListConst([])
          : IList<String>.fromJson(json['ids'], (value) => value as String),
      kosten: json['kosten'] == null
          ? const IListConst([])
          : IList<Waarde>.fromJson(json['kosten'],
              (value) => Waarde.fromJson(value as Map<String, dynamic>)),
      taxatie: (json['taxatie'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$_KostenVerbouwenToJson(_$_KostenVerbouwen instance) =>
    <String, dynamic>{
      'ids': instance.ids.toJson(
        (value) => value,
      ),
      'kosten': instance.kosten.toJson(
        (value) => value,
      ),
      'taxatie': instance.taxatie,
    };
