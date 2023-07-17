import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import '../../../gereedschap/kalender.dart';
import '../../../inkomen/gegevens/inkomen.dart';
import '../../gegevens/norm/norm_inkomen/inkomens_op_datum.dart';

class VindInkomensOpDatum {
  VindInkomensOpDatum({
    required this.startDatum,
    required this.inkomenLijst,
    required this.inkomenLijstPartner,
    this.jarenInToekomst,
    this.pensioenJarenInToekomst,
  });

  final DateTime startDatum;
  final IList<Inkomen> inkomenLijst;
  final IList<Inkomen> inkomenLijstPartner;
  final int? jarenInToekomst;
  final int? pensioenJarenInToekomst;

  List<InkomenOpDatum> zoek() {
    int index = 0;
    int indexPartner = 0;
    int length = inkomenLijst.length;
    int lengthPartner = inkomenLijstPartner.length;
    DateTime datum = startDatum;
    bool volgende = true;
    bool volgendePensioen = true;
    DateTime? stopNaDatum = jarenInToekomst == null
        ? null
        : Kalender.voegPeriodeToe(startDatum,
            jaren: jarenInToekomst!, periodeOpties: PeriodeOpties.volgende);

    DateTime? stopNaDatumPensioen = pensioenJarenInToekomst == null
        ? null
        : Kalender.voegPeriodeToe(startDatum,
            jaren: pensioenJarenInToekomst!,
            periodeOpties: PeriodeOpties.volgende);

    if (inkomenLijst.isEmpty && inkomenLijstPartner.isEmpty) {
      return const [];
    }

    Inkomen? inkomen;
    Inkomen? inkomenPartner;
    DateTime vorigeDatum = DateTime(0);
    List<InkomenOpDatum> lijst = [];

    inkomenOpDatumToevoegen() {
      bool toevoegen = false;
      if (volgende) {
        toevoegen = true;
      } else if (volgendePensioen &&
          ((inkomen?.pensioen ?? false) ||
              (inkomenPartner?.pensioen ?? false))) {
        toevoegen = true;
      }
      if (toevoegen) {
        lijst.add(InkomenOpDatum(
            datum: datum,
            inkomens: [
              if (inkomen != null && inkomen.brutoInkomen > 0.0) inkomen,
              if (inkomenPartner != null && inkomenPartner.brutoInkomen > 0.0)
                inkomenPartner
            ].lock));
      }
    }

    while ((index < length || indexPartner < lengthPartner) &&
        (volgende || volgendePensioen)) {
      /// Sla eerst iteratie over:
      /// - Vorige inkomen zijn nog niet toegewezen.
      /// - Vorige datum mag niet eerste keer toegewezen worden anders is de datum in de tweede interatie gelijk.

      if (index != 0 || indexPartner != 0) {
        if (vorigeDatum.compareTo(datum) < 0) {
          inkomenOpDatumToevoegen();
        }
        vorigeDatum = datum;
      }

      if (index < length) {
        inkomen = inkomenLijst[index];
      }

      if (indexPartner < lengthPartner) {
        inkomenPartner = inkomenLijstPartner[indexPartner];
      }

      DateTime eerstVolgendeDatum;

      if (inkomen != null &&
          index < length &&
          inkomenPartner != null &&
          indexPartner < lengthPartner) {
        switch (inkomen.datum.compareTo(inkomenPartner.datum)) {
          case -1:
            {
              index++;
              break;
            }
          case 1:
            {
              indexPartner++;
              break;
            }

          default:
            {
              index++;
              indexPartner++;
            }
        }
      } else if (index < length) {
        index++;
      } else if (indexPartner < lengthPartner) {
        indexPartner++;
      } else {
        break;
      }

      if (inkomen != null && inkomenPartner != null) {
        eerstVolgendeDatum = inkomen.datum.compareTo(inkomenPartner.datum) < 0
            ? inkomenPartner.datum
            : inkomen.datum;
      } else if (inkomen != null) {
        eerstVolgendeDatum = inkomen.datum;
      } else if (inkomenPartner != null) {
        eerstVolgendeDatum = inkomenPartner.datum;
      } else {
        break;
      }

      if (datum.compareTo(eerstVolgendeDatum) < 0) {
        datum = eerstVolgendeDatum;
      }

      volgende = stopNaDatum == null || datum.compareTo(stopNaDatum) <= 0;
      volgendePensioen = stopNaDatumPensioen == null ||
          datum.compareTo(stopNaDatumPensioen) <= 0;
    }

    if (vorigeDatum.compareTo(datum) < 0) {
      inkomenOpDatumToevoegen();
    }

    return lijst;
  }
}
