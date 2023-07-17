import 'package:freezed_annotation/freezed_annotation.dart';

part 'schulden_op_datum.freezed.dart';
part 'schulden_op_datum.g.dart';

@freezed
class SchuldOpDatum with _$SchuldOpDatum {
  const SchuldOpDatum._();

  const factory SchuldOpDatum({
    required DateTime datum,
    required double schuld,
  }) = _SchuldOpDatum;

  factory SchuldOpDatum.fromJson(Map<String, Object?> json) =>
      _$SchuldOpDatumFromJson(json);
}
