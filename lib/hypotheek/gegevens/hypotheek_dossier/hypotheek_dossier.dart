import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../extra_of_kosten_lening/extra_of_kosten_lening.dart';
import '../gedeeld/kosten_woning_lening.dart';
import '../gedeeld/woningwaarde.dart';
import '../hypotheek/hypotheek.dart';
import '../norm/normen_toepassen.dart';

part 'hypotheek_dossier.freezed.dart';
part 'hypotheek_dossier.g.dart';

enum DoelHypotheekOverzicht { nieuweWoning, huidigeWoning }

@freezed
class HypotheekDossier with _$HypotheekDossier {
  const HypotheekDossier._();

  const factory HypotheekDossier({
    @Default('') String id,
    @Default(IMapConst({})) IMap<String, Hypotheek> hypotheken,
    @Default(IListConst([])) IList<String> eersteHypotheken,
    @Default('') String omschrijving,
    @Default(true) bool inkomensNormToepassen,
    @Default(true) bool woningWaardeNormToepassen,
    @Default(DoelHypotheekOverzicht.nieuweWoning)
    DoelHypotheekOverzicht doelHypotheekOverzicht,
    @Default(false) bool starter,
    @Default(false) bool eigenWoning,

    //EigenWoningReserve
    @Default(true) bool ewrToepassen,
    @Default(false) bool ewrBerekenen,
    @Default(0.0) double ewr,

    //Huidige/Vorige Woning
    @Default(IListConst([])) IList<Waarde> kosten,
    @Default(0.0) double woningWaarde,
    @Default(0.0) double oorspronkelijkeHoofdsom,
    @Default(0.0) double restSchuld,

    //Gegevens op datum
    @Default(IMapConst(<DateTime, WoningWaarde>{}))
    IMap<DateTime, WoningWaarde> dWoningWaarde,
    @Default(IMapConst(<DateTime, KostenWoningLening>{}))
    IMap<DateTime, KostenWoningLening> dKosten,

    //Finacieringsnorm
    @Default(IMapConst(<DateTime, NormenToepassen>{}))
    IMap<DateTime, NormenToepassen> dNormenToepassen,
  }) = _HypotheekDossier;

  factory HypotheekDossier.fromJson(Map<String, Object?> json) =>
      _$HypotheekDossierFromJson(json);

  double get totaleKosten => kosten.fold(0.0, (double previous, Waarde w) {
        double value;
        switch (w.eenheid) {
          case Eenheid.percentageTaxatie:
          case Eenheid.percentageWoningWaarde:
          case Eenheid.percentageLening:
            value = 0.0;
            assert(false,
                'Percentage niet geimplenteerd voor Kosten in  HypotheekDossier');
            break;
          case Eenheid.bedrag:
            value = w.getal;
            break;
        }
        return previous + value;
      });
}
