// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class NhgNorm {
  final int jaar;
  final double aankoopBedrag;
  final double percentageVerduurzamen;
  const NhgNorm({
    required this.jaar,
    required this.aankoopBedrag,
    required this.percentageVerduurzamen,
  });
}

class NhgNormTabel {
  static const _lijst = <NhgNorm>{
    NhgNorm(jaar: 2023, aankoopBedrag: 405000, percentageVerduurzamen: 6.0)
  };

  static NhgNorm? nhgNorm(DateTime datum) {
    NhgNorm? nhgNorm;

    for (var n in _lijst) {
      if (datum.year == n.jaar) {
        return n;
      }
      nhgNorm = n;
    }
    return nhgNorm;
  }
}
