import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../gegevens/hypotheek/hypotheek.dart';
import '../gegevens/hypotheek_dossier/hypotheek_dossier.dart';
import '../gegevens/norm/norm.dart';
import '../uitwerken/hypotheek_verwerken.dart';

class BerekenNormWoningWaarde {
  HypotheekDossier hypotheekDossier;
  Hypotheek hypotheek;
  List<DateTime> datums;

  BerekenNormWoningWaarde(
      {required this.hypotheekDossier,
      required this.hypotheek,
      List<DateTime>? datums})
      : datums = datums ?? [hypotheek.startDatum];

  (HypotheekDossier, Hypotheek) bereken() {
    hypotheek = hypotheek.copyWith(
        dNormWoningWaarde: hypotheek.dNormWoningWaarde.addAll({
      for (DateTime datum in datums) datum: _bereken(datum: datum)
    }.lock));

    hypotheekDossier = hypotheekDossier.copyWith(
        hypotheken: hypotheekDossier.hypotheken.add(hypotheek.id, hypotheek));

    return (hypotheekDossier, hypotheek);
  }

  NormWoningWaarde _bereken({required DateTime datum}) {
    final woningWaarde = hypotheekDossier.dWoningWaarde[datum]?.waarde ?? 0.0;

    // //Taxatie verbouwing

    // if (gedeeldeTijdsafhankelijkeGegevens.verbouwenToepassen) {
    //   normlening = normlening < gedeeldeTijdsafhankelijkeGegevens.taxatie
    //       ? gedeeldeTijdsafhankelijkeGegevens.taxatie
    //       : normlening;

    //   lenenVoorVerduurzamen =
    //       gedeeldeTijdsafhankelijkeGegevens.verduurzaamKosten;

    //   final ruimteVerduurzamen = normlening * 0.06;

    //   lenenVoorVerduurzamen = (lenenVoorVerduurzamen > ruimteVerduurzamen)
    //       ? ruimteVerduurzamen
    //       : lenenVoorVerduurzamen;
    // }

    //Woningwaarde uit Waarde of Taxatie

    NormWoningWaarde normWoningWaarde;
    if (woningWaarde == 0.0) {
      normWoningWaarde = NormWoningWaarde(
          fout: true, berichten: const IListConst(['geen_woningwaarde']));
    } else {
      double normLening = woningWaarde;
      double lenenVoorVerduurzamen = 0.0;

      var (hd, h, statusParalleleLeningen) =
          HypotheekVerwerken.statusParralleleLeningen(
              datum: datum,
              hypotheekDossier: hypotheekDossier,
              hypotheek: hypotheek);

      hypotheekDossier = hd;
      hypotheek = h;

      double somParalleleLeningen = statusParalleleLeningen.fold<double>(
          0.0, (previousValue, element) => previousValue + element.lening);

      final teLenen = normLening + lenenVoorVerduurzamen - somParalleleLeningen;

      normWoningWaarde = NormWoningWaarde(
          normLening: normLening + lenenVoorVerduurzamen,
          teLenen: teLenen < 0.0 ? 0.0 : teLenen,
          verduurzaam: lenenVoorVerduurzamen);
    }
    return normWoningWaarde;
  }
}
