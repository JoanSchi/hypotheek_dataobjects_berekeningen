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

part 'kosten_woning_lening.freezed.dart';
part 'kosten_woning_lening.g.dart';

@freezed
class KostenWoningLening with _$KostenWoningLening {
  const KostenWoningLening._();

  const factory KostenWoningLening({
    @Default(IListConst([])) IList<String> ids,
    @Default(IListConst([])) IList<Waarde> kosten,
  }) = _KostenWoningLening;

  factory KostenWoningLening.fromJson(Map<String, Object?> json) =>
      _$KostenWoningLeningFromJson(json);

  double totaleKosten({double woningWaarde = 0.0, double lening = 0.0}) =>
      kosten.fold(0.0, (double previous, Waarde w) {
        return previous +
            switch (w.eenheid) {
              Eenheid.percentageWoningWaarde => woningWaarde / 100.0 * w.getal,
              Eenheid.bedrag => w.getal,
              Eenheid.percentageLening => lening / 100.0 * w.getal,
              Eenheid.percentageTaxatie || Eenheid.percentageLening => 0.0
            };
      });

  static const borgNHG = Waarde(
      id: 'borgNHG',
      omschrijving: 'Borgtochtprovisie NHG',
      getal: 0.6,
      eenheid: Eenheid.percentageWoningWaarde,
      standaard: true,
      aftrekbaar: true);

  static List<Waarde> lijstSuggestieKosten({
    required bool overdrachtBelasting,
    required bool nhg,
  }) =>
      [
        if (overdrachtBelasting)
          const Waarde(
              id: 'overdrachtBelasting',
              omschrijving: 'Overdracht Belasting',
              getal: 2.0,
              eenheid: Eenheid.percentageWoningWaarde,
              standaard: true,
              aftrekbaar: false),
        if (nhg) borgNHG,
        const Waarde(
            id: 'bouwkundigRapport',
            omschrijving: 'Bouwkundig Rapport',
            getal: 500.0,
            eenheid: Eenheid.bedrag,
            standaard: true,
            aftrekbaar: true),
        const Waarde(
            id: 'bankgarantie',
            omschrijving: 'Bankgarantie',
            getal: 250.0,
            eenheid: Eenheid.bedrag,
            standaard: true,
            aftrekbaar: true),
        const Waarde(
            id: 'adviesBemiddeling',
            omschrijving: 'Advies bemiddeling',
            getal: 2000.0,
            eenheid: Eenheid.bedrag,
            standaard: true,
            aftrekbaar: true),
        const Waarde(
            id: 'aankoopmakelaar',
            omschrijving: 'Aankoopmakelaar',
            getal: 3000.0,
            eenheid: Eenheid.bedrag,
            standaard: true,
            aftrekbaar: true),
        const Waarde(
            id: 'taxatie',
            omschrijving: 'Taxatie',
            getal: 500.0,
            eenheid: Eenheid.bedrag,
            standaard: true,
            aftrekbaar: true),
        const Waarde(
          id: 'notaris',
          omschrijving: 'Notaris',
          getal: 1200.0,
          eenheid: Eenheid.bedrag,
          standaard: true,
          aftrekbaar: true,
        ),
      ];

  static const leegKosten = Waarde(
      id: 'eigen',
      omschrijving: '',
      getal: 0.0,
      eenheid: Eenheid.bedrag,
      standaard: false,
      aftrekbaar: false,
      verduurzamen: false);
}
