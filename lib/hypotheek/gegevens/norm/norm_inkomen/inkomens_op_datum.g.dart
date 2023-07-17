// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inkomens_op_datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InkomenOpDatum _$$_InkomenOpDatumFromJson(Map<String, dynamic> json) =>
    _$_InkomenOpDatum(
      datum: DateTime.parse(json['datum'] as String),
      inkomens: IList<Inkomen>.fromJson(json['inkomens'],
          (value) => Inkomen.fromJson(value as Map<String, dynamic>)),
    );

Map<String, dynamic> _$$_InkomenOpDatumToJson(_$_InkomenOpDatum instance) =>
    <String, dynamic>{
      'datum': instance.datum.toIso8601String(),
      'inkomens': instance.inkomens.toJson(
        (value) => value,
      ),
    };
