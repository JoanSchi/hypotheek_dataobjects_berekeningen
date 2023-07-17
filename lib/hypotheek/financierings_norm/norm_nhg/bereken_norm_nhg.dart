// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import '../gegevens/norm/norm.dart';
// import '../uitwerken/status_parrallele_leningen_op_datum.dart';

// class BerekenNormNhg {
//   final DateTime datum;
//   // final GedeeldeTijdsafhankelijkeGegevens gedeeldeGegevens;
//   final StatusParalleleLeningenOpDatum statusParalleleLeningenOpDatum;

//   BerekenNormNhg({
//     // required this.gedeeldeGegevens,
//     required this.statusParalleleLeningenOpDatum,
//     required this.datum,
//   });

//   NormNhg bereken() {
//     const maxNHG = 405000.0;

//     // TO DO Woningwaarde
//     double normLening = 5555;
//     //gedeeldeGegevens.woningWaarde;
//     double lenenVoorVerduurzamen = 0.0;

//     if (normLening > maxNHG) {
//       return NormNhg(
//           omschrijving: 'NHG',
//           berichten: ['NHG: Maximaal $maxNHG + 6% verduurzamen'].lock);
//     }

//     normLening = (gedeeldeGegevens.taxatie > normLening)
//         ? gedeeldeGegevens.taxatie
//         : normLening;

//     if (normLening >= maxNHG) {
//       normLening = maxNHG;
//     }

//     lenenVoorVerduurzamen =
//         gedeeldeGegevens.verduurzaamKosten > normLening * 0.06
//             ? normLening * 0.06
//             : gedeeldeGegevens.verduurzaamKosten;

//     normLening += lenenVoorVerduurzamen;

//     double somParalleleLeningen = statusParalleleLeningenOpDatum
//         .opDatum(datum)
//         .fold<double>(
//             0.0, (previousValue, element) => previousValue + element.lening);

//     return NormNhg(
//         omschrijving: 'NHG',
//         toepassen: true,
//         normLening: normLening,
//         teLenen: normLening - somParalleleLeningen,
//         verduurzaam: lenenVoorVerduurzamen);
//   }
// }
