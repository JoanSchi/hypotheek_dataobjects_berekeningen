// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'rest_schuld_hypotheken.freezed.dart';
// part 'rest_schuld_hypotheken.g.dart';

// @freezed
// class RestSchuldHypotheken with _$RestSchuldHypotheken {
//   const RestSchuldHypotheken._();

//   const factory RestSchuldHypotheken({
//     required DateTime datum,
//     required IList<String> hypotheekIds,
//   }) = _RestSchuldHypotheken;

//   factory RestSchuldHypotheken.fromJson(Map<String, Object?> json) =>
//       _$RestSchuldHypothekenFromJson(json);
// }

import '../hypotheek/hypotheek.dart';

sealed class VervolgLening {}

class HerFinancieren extends VervolgLening {
  final DateTime datum;
  final List<String> ids;
  double restSchuld;

  HerFinancieren({
    required this.datum,
    required String id,
    required this.restSchuld,
  }) : ids = [id];

  String get id => ids.join(', ');
}

class LeningVerlengen extends VervolgLening {
  final Hypotheek hypotheek;

  LeningVerlengen(
    this.hypotheek,
  );

  String get id => hypotheek.id;
}
