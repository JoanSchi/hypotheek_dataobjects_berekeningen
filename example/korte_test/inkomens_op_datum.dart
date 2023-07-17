import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hypotheek_dataobjects_berekeningen/hypotheek/financierings_norm/norm_inkomen/vind_inkomens_op_datum.dart';
import 'package:hypotheek_dataobjects_berekeningen/hypotheek/gegevens/norm/norm_inkomen/inkomens_op_datum.dart';
import 'package:hypotheek_dataobjects_berekeningen/inkomen/gegevens/inkomen.dart';
import 'package:intl/intl.dart';

main() {
  inkomenOpDatumFunctions();
  // _test(
  //     omschrijving: 'Simpel',
  //     startDatum: DateTime(2023, 1, 1),
  //     inkomenLijst: [
  //       Inkomen(
  //           brutoInkomen: 5500,
  //           datum: DateTime(2022, 06, 01),
  //           dertiendeMaand: true,
  //           indexatie: 1,
  //           partner: false,
  //           pensioen: false,
  //           periodeInkomen: PeriodeInkomen.jaar,
  //           vakantiegeld: true)
  //     ].lock,
  //     inkomenLijstPartner: [
  //       Inkomen(
  //           brutoInkomen: 2200,
  //           datum: DateTime(2022, 01, 01),
  //           dertiendeMaand: true,
  //           indexatie: 1,
  //           partner: true,
  //           pensioen: false,
  //           periodeInkomen: PeriodeInkomen.jaar,
  //           vakantiegeld: true)
  //     ].lock);

  _test(
      jarenInToekomst: 6,
      startDatum: DateTime(2023, 1, 1),
      inkomenLijst: [
        Inkomen(
            brutoInkomen: 5500,
            datum: DateTime(2022, 06, 01),
            dertiendeMaand: true,
            indexatie: 1,
            partner: false,
            pensioen: false,
            periodeInkomen: PeriodeInkomen.jaar,
            vakantiegeld: false),
        Inkomen(
            brutoInkomen: 5500,
            datum: DateTime(2024, 07, 01),
            dertiendeMaand: true,
            indexatie: 1,
            partner: false,
            pensioen: false,
            periodeInkomen: PeriodeInkomen.jaar,
            vakantiegeld: false)
      ].lock,
      inkomenLijstPartner: [
        Inkomen(
            brutoInkomen: 2200,
            datum: DateTime(2022, 01, 01),
            dertiendeMaand: true,
            indexatie: 1,
            partner: true,
            pensioen: false,
            periodeInkomen: PeriodeInkomen.jaar,
            vakantiegeld: true),
        Inkomen(
            brutoInkomen: 2200,
            datum: DateTime(2023, 07, 01),
            dertiendeMaand: true,
            indexatie: 1,
            partner: true,
            pensioen: false,
            periodeInkomen: PeriodeInkomen.jaar,
            vakantiegeld: true),
        Inkomen(
            brutoInkomen: 2200,
            datum: DateTime(2024, 07, 01),
            dertiendeMaand: true,
            indexatie: 1,
            partner: true,
            pensioen: false,
            periodeInkomen: PeriodeInkomen.jaar,
            vakantiegeld: true),
      ].lock);
}

_test(
    {String omschrijving = 'test',
    required DateTime startDatum,
    IList<Inkomen> inkomenLijst = const IListConst<Inkomen>([]),
    IList<Inkomen> inkomenLijstPartner = const IListConst<Inkomen>([]),
    int jarenInToekomst = 10,
    int pensioenJarenInToekomst = 10}) {
  print('--- $omschrijving ----');

  final inkomensOpDatumLijst = VindInkomensOpDatum(
          startDatum: startDatum,
          inkomenLijst: inkomenLijst,
          inkomenLijstPartner: inkomenLijstPartner,
          jarenInToekomst: jarenInToekomst,
          pensioenJarenInToekomst: pensioenJarenInToekomst)
      .zoek();

  final df = DateFormat('dd-MM-yyyy');

  for (InkomenOpDatum inkomensOpDatum in inkomensOpDatumLijst) {
    String naDatum(int index) {
      final DateTime? datum = inkomensOpDatum.inkomens.getOrNull(index)?.datum;
      return datum == null ? ':(' : df.format(datum);
    }

    print('${df.format(inkomensOpDatum.datum)} '
        ' -> ${naDatum(0)}'
        ' -> ${naDatum(1)}');
  }
}

void inkomenOpDatumFunctions() {
  final t = InkomenOpDatum(
    datum: DateTime(2023, 07, 01),
    inkomens: [
      Inkomen(
          brutoInkomen: 4000,
          datum: DateTime(2023, 07, 01),
          dertiendeMaand: true,
          indexatie: 1,
          partner: false,
          pensioen: false,
          periodeInkomen: PeriodeInkomen.jaar,
          vakantiegeld: false),
      // Inkomen(
      //     brutoInkomen: 2000,
      //     datum: DateTime(2023, 07, 01),
      //     dertiendeMaand: true,
      //     indexatie: 1,
      //     partner: true,
      //     pensioen: false,
      //     periodeInkomen: PeriodeInkomen.jaar,
      //     vakantiegeld: false)
    ].lock,
  );

  print('${t.factorAflopend([1.0, 0.5])}');
}
