// Copyright (C) 2023 Joan Schipper
//
// This file is part of hypotheek_berekeningen.
//
// hypotheek_berekeningen is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// hypotheek_berekeningen is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with hypotheek_berekeningen.  If not, see <http://www.gnu.org/licenses/>.

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../extra_of_kosten_lening/extra_of_kosten_lening.dart';

part 'kosten_verbouwen.freezed.dart';
part 'kosten_verbouwen.g.dart';

@freezed
class KostenVerbouwen with _$KostenVerbouwen {
  const KostenVerbouwen._();

  const factory KostenVerbouwen({
    @Default(IListConst([])) IList<String> ids,
    @Default(IListConst([])) IList<Waarde> kosten,
    @Default(0.0) double taxatie,
  }) = _KostenVerbouwen;

  factory KostenVerbouwen.fromJson(Map<String, Object?> json) =>
      _$KostenVerbouwenFromJson(json);

  double get totaleKosten => kosten.fold(0.0, (double previous, Waarde w) {
        double value;
        switch (w.eenheid) {
          case Eenheid.percentageTaxatie:
            value = taxatie / 100.0 * w.getal;
            break;
          case Eenheid.bedrag:
            value = w.getal;
            break;
          case Eenheid.percentageWoningWaarde:
          case Eenheid.percentageLening:
            assert(false,
                '${w.eenheid} niet geimplementeerd in VerbouwVerduurzaamKosten');
            value = 0.0;
            break;
        }
        return previous + value;
      });

  double get verduurzaamKosten => kosten.fold(0.0, (double previous, Waarde w) {
        double value;
        if (w.verduurzamen) {
          switch (w.eenheid) {
            case Eenheid.percentageTaxatie:
              value = taxatie / 100.0 * w.getal;
              break;
            case Eenheid.bedrag:
              value = w.getal;
              break;
            case Eenheid.percentageWoningWaarde:
            case Eenheid.percentageLening:
              assert(false,
                  '${w.eenheid} niet geimplementeerd in VerbouwVerduurzaamKosten');
              value = 0.0;
              break;
          }
        } else {
          value = 0.0;
        }
        return previous + value;
      });
}
