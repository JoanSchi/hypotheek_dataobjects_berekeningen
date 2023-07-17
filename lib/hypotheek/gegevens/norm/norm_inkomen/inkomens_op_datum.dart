import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../../../../inkomen/gegevens/inkomen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'inkomens_op_datum.freezed.dart';
part 'inkomens_op_datum.g.dart';

@freezed
class InkomenOpDatum with _$InkomenOpDatum {
  const InkomenOpDatum._();

  const factory InkomenOpDatum({
    required DateTime datum,
    required IList<Inkomen> inkomens,
  }) = _InkomenOpDatum;

  factory InkomenOpDatum.fromJson(Map<String, Object?> json) =>
      _$InkomenOpDatumFromJson(json);

  double factorAflopend(List<double> factor) {
    final aflopend = <double>[
      for (Inkomen inkomen in inkomens) inkomen.indexatieTotaalBrutoJaar(datum),
    ]..sort((double a, double b) => b.compareTo(a));

    int length = aflopend.length;
    int lengthFactor = factor.length;
    double som = 0;

    for (int index = 0; index < length; index++) {
      som += aflopend[index] * (index < lengthFactor ? factor[index] : 1.0);
    }
    return som;
  }

  double get totaal => inkomens.fold(
      0.0,
      (double vorige, Inkomen inkomen) =>
          vorige + inkomen.indexatieTotaalBrutoJaar(datum));

  Iterable<Inkomen> toIterable() {
    return (inkomens.length == 2 &&
            inkomens[0].pensioen &&
            !inkomens[1].pensioen)
        ? inkomens.reversed
        : inkomens;
  }
}
