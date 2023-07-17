import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../../../schulden/gegevens/schulden.dart';

class VindSchuldenOpDatum {
  static Map<DateTime, double> vindSchuldenOpDatums(
      {required IList<Schuld> schulden, required List<DateTime> opDatums}) {
    Map<DateTime, double> schuldenOpDatum = {};

    for (Schuld schuld in schulden) {
      for (DateTime opDatum in opDatums) {
        if (schuld.beginDatum.compareTo(opDatum) <= 0 &&
            opDatum.compareTo(schuld.eindDatum) <= 0) {
          schuldenOpDatum[opDatum] =
              (schuldenOpDatum[opDatum] ?? 0.0 + schuld.maandLast(opDatum));
        }
      }
    }
    return schuldenOpDatum;
  }

   static double vindSchuldOpDatum(
      {required IList<Schuld> schulden, required DateTime opDatum}) {
    
    double somSchuldOpDatum = 0.0;
    
    for (Schuld schuld in schulden) {
     
        if (schuld.beginDatum.compareTo(opDatum) <= 0 &&
            opDatum.compareTo(schuld.eindDatum) <= 0) {
          somSchuldOpDatum += schuld.maandLast(opDatum);
        }
      
    }
    return somSchuldOpDatum;
  }
}
