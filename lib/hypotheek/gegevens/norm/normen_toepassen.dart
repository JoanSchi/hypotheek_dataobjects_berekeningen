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

import 'package:freezed_annotation/freezed_annotation.dart';

part 'normen_toepassen.freezed.dart';
part 'normen_toepassen.g.dart';

@freezed
class NormenToepassen with _$NormenToepassen {
  const NormenToepassen._();

  const factory NormenToepassen({
    @Default(false) bool woningWaarde,
    @Default(false) bool inkomen,
  }) = _NormenToepassen;

  factory NormenToepassen.fromJson(Map<String, Object?> json) =>
      _$NormenToepassenFromJson(json);
}
