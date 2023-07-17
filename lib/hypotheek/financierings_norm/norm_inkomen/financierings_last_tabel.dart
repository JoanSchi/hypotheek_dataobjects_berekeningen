// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math' as math;
import '../../gegevens/norm/norm_inkomen/inkomens_op_datum.dart';
import 'aow_box3_tabel.dart';
import 'aow_tabel.dart';
import 'niet_aow_box3_tabel.dart';
import 'niet_aow_tabel.dart';

class FinNormInk {
  static const bereik = 'bereik',
      jaar = 'jaar',
      versie = 'versie',
      toetsRente = 'toetsRente',
      brutoInkomen = 'brutoInkomen',
      percentage = 'percentage';

  static const nietAOW = 'nietAow',
      nietAowBox3 = 'nietAowBox3',
      aow = 'aow',
      aowBox3 = 'aowBox3';
}

class FinancieringsLastTabel {
  Map tabel;
  bool aow;
  int box;
  double toetsInkomen;
  int _indexInkomen = -1;
  double _toetsRente = 0.0;
  int _indexRente = 0;
  int jaar;
  int toetsJaar = -1;

  FinancieringsLastTabel({
    required this.aow,
    required this.box,
    this.toetsInkomen = 0.0,
    this.jaar = -1,
  }) : tabel = (aow
            ? (box == 1 ? aowTabel : aowBox3Tabel)
            : (box == 1 ? nietAowTabel : nietAowBox3Tabel)) {
    //Toetsjaar

    List<int> bereik = tabel[FinNormInk.bereik] as List<int>;

    toetsJaar = bereik.firstWhere((element) => element == jaar,
        orElse: () => bereik[1]);

    //Index Inkomen

    _indexInkomen = tabel[toetsJaar][FinNormInk.brutoInkomen].lastIndexWhere(
        (brutoInkomenUitLijst) => toetsInkomen >= brutoInkomenUitLijst);
  }

  double percentageLast(double toetsRente) {
    if (_toetsRente != toetsRente) {
      _toetsRente = toetsRente;

      _indexRente = tabel[toetsJaar][FinNormInk.toetsRente]
          .lastIndexWhere((renteLijst) => toetsRente >= renteLijst);
    }
    return tabel[toetsJaar][FinNormInk.percentage][_indexInkomen][_indexRente];
  }
}

class FiLastKey {
  final double toetsRente;
  final int jaar;
  final bool aow;
  final int box;

  FiLastKey({
    required this.toetsRente,
    required this.jaar,
    required this.aow,
    required this.box,
  });
}

class FinancieringsLast {
  DateTime startDatum;
  InkomenOpDatum inkomen;
  bool alleenstaande;
  Map<FiLastKey, FinancieringsLastTabel> financieringsLastMap = {};

  static const String energieClassificeringNulopdeMeter = 'NulopdeMeter';
  static const String energieClassificeringEnergieIndex = 'EnergieIndex';

  FinancieringsLast({
    required this.startDatum,
    required this.inkomen,
    required this.alleenstaande,
  });

  double finanancieringsLastPercentage({
    int box = 1,
    bool aow = false,
    required double toetsRente,
  }) {
    final key = FiLastKey(
        aow: aow, box: box, jaar: startDatum.year, toetsRente: toetsRente);

    return (financieringsLastMap[key] ??
            (financieringsLastMap[key] = FinancieringsLastTabel(
              aow: aow,
              box: box,
              jaar: startDatum.year,
              toetsInkomen: totaalToetsInkomen,
            )))
        .percentageLast(toetsRente);
  }

  double get totaalInkomen => inkomen.totaal;

  double get totaalToetsInkomen {
    return inkomen.factorAflopend([1.0, 0.9]);
  }

  static double toetsRente({required int periodesMnd, required double rente}) {
    if (periodesMnd < 10 * 12 && rente < 5.0) {
      return 5.0;
    } else {
      return rente;
    }
  }

  double verduurzamen(
      {required double verduurzaamKosten, String energieClassificering = ''}) {
    double verduurzamen;
    if (totaalToetsInkomen < 33000) {
      verduurzamen = 0.0;
    } else {
      switch (energieClassificering) {
        case energieClassificeringNulopdeMeter:
          {
            verduurzamen = math.min(25000, verduurzaamKosten);
            break;
          }
        case energieClassificeringEnergieIndex:
          {
            verduurzamen = math.min(15000, verduurzaamKosten);
            break;
          }
        default:
          {
            verduurzamen = math.min(9000, verduurzaamKosten);
          }
      }
    }
    return verduurzamen;
  }
}
