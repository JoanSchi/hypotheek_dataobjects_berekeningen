// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kosten_woning_lening.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KostenWoningLening _$$_KostenWoningLeningFromJson(
        Map<String, dynamic> json) =>
    _$_KostenWoningLening(
      ids: json['ids'] == null
          ? const IListConst([])
          : IList<String>.fromJson(json['ids'], (value) => value as String),
      kosten: json['kosten'] == null
          ? const IListConst([])
          : IList<Waarde>.fromJson(json['kosten'],
              (value) => Waarde.fromJson(value as Map<String, dynamic>)),
    );

Map<String, dynamic> _$$_KostenWoningLeningToJson(
        _$_KostenWoningLening instance) =>
    <String, dynamic>{
      'ids': instance.ids.toJson(
        (value) => value,
      ),
      'kosten': instance.kosten.toJson(
        (value) => value,
      ),
    };
