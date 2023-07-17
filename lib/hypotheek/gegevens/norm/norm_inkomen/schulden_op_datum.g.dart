// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schulden_op_datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SchuldOpDatum _$$_SchuldOpDatumFromJson(Map<String, dynamic> json) =>
    _$_SchuldOpDatum(
      datum: DateTime.parse(json['datum'] as String),
      schuld: (json['schuld'] as num).toDouble(),
    );

Map<String, dynamic> _$$_SchuldOpDatumToJson(_$_SchuldOpDatum instance) =>
    <String, dynamic>{
      'datum': instance.datum.toIso8601String(),
      'schuld': instance.schuld,
    };
