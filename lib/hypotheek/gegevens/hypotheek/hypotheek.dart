import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import '../lening_aanpassen/lening_aanpassen.dart';
import '../norm/norm.dart';
import '../rente_vanaf_periode/rente_vanaf_periode.dart';
import '../status_lening/status_lening.dart';
import '../termijn/termijn.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hypotheek.freezed.dart';
part 'hypotheek.g.dart';

enum HypotheekVorm { aflosvrij, lineair, annuiteit }

enum OptiesHypotheekToevoegen {
  nieuw,
  verlengen,
}

@freezed
class Hypotheek with _$Hypotheek {
  const Hypotheek._();

  const factory Hypotheek({
    required String id,
    required String omschrijving,
    required OptiesHypotheekToevoegen optiesHypotheekToevoegen,
    @Default(0) double lening,
    @Default(0) double gewensteLening,
    // @Default(NormInkomen(omschrijving: 'Inkomen')) NormInkomen normInkomen,
    // @Default(NormWoningwaarde(omschrijving: 'Woningwaarde'))
    // NormWoningwaarde normWoningwaarde,
    // @Default(NormNhg(omschrijving: 'NHG')) NormNhg normNhg,
    required DateTime startDatum,
    required bool periodePerMaand,
    @Default(true) bool eersteGebrokenMaandAlleenRente,
    required DateTime eindDatum,
    required int periodeInMaanden,
    required int aflosTermijnInMaanden,
    required HypotheekVorm hypotheekvorm,
    @Default(IListConst([])) IList<Termijn> termijnen,
    required double rente,
    @Default(IListConst([])) IList<RenteVanafPeriode> renteVanafPeriode,
    required double boeteVrijPercentage,
    required double minLening,
    @Default(IListConst([])) IList<LeningAanpassen> aanpassenLening,
    @Default("") String volgende,
    @Default("") String vorige,
    @Default(IMapConst({})) IMap<String, int> order,
    // required DateTime datumNormGegevens,
    required bool deelsAfgelosteLening,
    required DateTime datumDeelsAfgelosteLening,
    required bool afgesloten,
    @Default(0.0) double restSchuld,
    // @Default(null) DateTime? woningWaarde,
    // @Default(null) DateTime? kosten,
    // @Default(null) DateTime? kostenVerbouwen,
    // @Default(true) bool nhgMogelijk,

    @Default(IMapConst(<DateTime, NormInkomen>{}))
    IMap<DateTime, NormInkomen> dNormInkomen,
    @Default(IMapConst(<DateTime, NormWoningWaarde>{}))
    IMap<DateTime, NormWoningWaarde> dNormWoningWaarde,
    @Default(IMapConst(<DateTime, NormNhg>{})) IMap<DateTime, NormNhg> dNormNhg,
    @Default(IMapConst(<DateTime, IList<StatusLening>>{}))
    IMap<DateTime, IList<StatusLening>> dStatusParralleleLeningen,
    @Default(null) double? maxLening,
  }) = $Hypotheek;

  factory Hypotheek.fromJson(Map<String, Object?> json) =>
      _$HypotheekFromJson(json);

  int get aflosTermijnInJaren => aflosTermijnInMaanden ~/ 12;

  int get periodeInJaren => periodeInMaanden ~/ 12;
}
