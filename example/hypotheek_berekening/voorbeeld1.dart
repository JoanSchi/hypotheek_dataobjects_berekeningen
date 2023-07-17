import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hypotheek_dataobjects_berekeningen/gereedschap/kalender.dart';
import 'package:hypotheek_dataobjects_berekeningen/hypotheek/financierings_norm/norm_inkomen/vind_inkomens_op_datum.dart';
import 'package:hypotheek_dataobjects_berekeningen/hypotheek/gegevens/hypotheek/hypotheek.dart';
import 'package:hypotheek_dataobjects_berekeningen/hypotheek/gegevens/hypotheek_dossier/hypotheek_dossier.dart';
import 'package:hypotheek_dataobjects_berekeningen/hypotheek/gegevens/norm/norm.dart';
import 'package:hypotheek_dataobjects_berekeningen/hypotheek/gegevens/norm/norm_inkomen/inkomens_op_datum.dart';
import 'package:hypotheek_dataobjects_berekeningen/hypotheek/uitwerken/hypotheek_bewerken.dart';
import 'package:hypotheek_dataobjects_berekeningen/hypotheek_document/hypotheek_document.dart';
import 'package:hypotheek_dataobjects_berekeningen/inkomen/gegevens/inkomen.dart';

class VoorBeeld1 {
  final IList<Inkomen> inkomen;
  final IList<Inkomen> inkomenPartner;

  VoorBeeld1()
      : inkomen = [
          Inkomen(
              datum: DateTime(2021, 6),
              partner: false,
              indexatie: 0.0,
              pensioen: false,
              periodeInkomen: PeriodeInkomen.jaar,
              brutoInkomen: 20000,
              dertiendeMaand: false,
              vakantiegeld: false)
        ].lock,
        inkomenPartner = <Inkomen>[
          // Inkomen(
          //     datum: DateTime(2021, 6),
          //     partner: false,
          //     indexatie: 1,
          //     pensioen: false,
          //     periodeInkomen: PeriodeInkomen.jaar,
          //     brutoInkomen: 20000,
          //     dertiendeMaand: false,
          //     vakantiegeld: true)
        ].lock {
    final hypotheekDocument = HypotheekDocument(
      inkomenOverzicht:
          InkomensOverzicht(inkomen: inkomen, inkomenPartner: inkomenPartner),
    );

    List<InkomenOpDatum> inkomensOpDatum = VindInkomensOpDatum(
      startDatum: Kalender.datumAlleen(DateTime.now()),
      inkomenLijst: inkomen,
      inkomenLijstPartner: inkomenPartner,
    ).zoek();

    HypotheekDossier hypotheekDossier = HypotheekDossier();
    String id = '';
    (hypotheekDossier, id) = HypotheekBewerken.nieuw(
        inkomensOpDatum: inkomensOpDatum,
        vorigeHypotheekDossier: hypotheekDossier,
        teVerlengen: [],
        teHerFinancieren: []);

    Hypotheek? hypotheek = hypotheekDossier.hypotheken[id];

    if (hypotheek == null) {
      return;
    }

    (hypotheekDossier, hypotheek) =
        HypotheekBewerken.vergelijkTmHypotheekEnBereken(
            vorigeHypotheekDossier: hypotheekDossier,
            hypotheekDossier: hypotheekDossier,
            hypotheek: hypotheek,
            inkomensOpDatum: inkomensOpDatum,
            zetMaximaleLening: true);

    NormInkomen? normInkomen = hypotheek.dNormInkomen.values.firstOrNull;

    print('Norm inkomen: ${normInkomen?.teLenen}');
  }
}
