// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'woningwaarde.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WoningWaarde _$$_WoningWaardeFromJson(Map<String, dynamic> json) =>
    _$_WoningWaarde(
      ids: json['ids'] == null
          ? const IListConst([])
          : IList<String>.fromJson(json['ids'], (value) => value as String),
      waarde: json['waarde'] ?? 0.0,
    );

Map<String, dynamic> _$$_WoningWaardeToJson(_$_WoningWaarde instance) =>
    <String, dynamic>{
      'ids': instance.ids.toJson(
        (value) => value,
      ),
      'waarde': instance.waarde,
    };
