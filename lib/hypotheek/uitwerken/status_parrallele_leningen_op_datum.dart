// import 'package:hypotheek_berekeningen/hypotheek/gegevens/hypotheek_dossier/hypotheek_dossier.dart';

// import '../gegevens/hypotheek/hypotheek.dart';
// import '../gegevens/status_lening/status_lening.dart';
// import 'hypotheek_iterator.dart';
// import 'hypotheek_verwerken.dart';

// class StatusParalleleLeningenOpDatum {
//   final List<Hypotheek> parallelHypotheken;
//   final Map<DateTime, List<StatusLening>> statusParralleleLeningenOpDatum;

//   StatusParalleleLeningenOpDatum.leeg()
//       : parallelHypotheken = [],
//         statusParralleleLeningenOpDatum = {};

//   StatusParalleleLeningenOpDatum(
//       {required HypotheekDossier hypotheekDossier,
//       required DateTime startDatum,
//       required String hypotheekId})
//       : 
//         statusParralleleLeningenOpDatum = {};

//   List<StatusLening> opDatum(DateTime datum) {
//     return statusParralleleLeningenOpDatum[datum] ??
//         (statusParralleleLeningenOpDatum[datum] =
//             HypotheekVerwerken.statusParralleleLeningen(
//                 datum, hypotheekDossier));
//   }
// }
