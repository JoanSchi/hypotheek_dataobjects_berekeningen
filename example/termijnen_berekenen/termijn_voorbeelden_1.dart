import 'package:hypotheek_dataobjects_berekeningen/hypotheek/gegevens/hypotheek/hypotheek.dart';
import 'package:hypotheek_dataobjects_berekeningen/hypotheek/gegevens/lening_aanpassen/lening_aanpassen.dart';
import 'package:hypotheek_dataobjects_berekeningen/hypotheek/gegevens/rente_vanaf_periode/rente_vanaf_periode.dart';
import 'package:hypotheek_dataobjects_berekeningen/hypotheek/uitwerken/hypotheek_termijnen.dart';

import 'termijnen_to_file.dart';

class TermijnVoorbeelden {
  static void termijnVoorbeelden1({required String path}) {
    ///
    ///
    ///
    ///

    final extraAflossen = [
      LeningAanpassen.termijnen(
          bedrag: 20000,
          datum: DateTime(2024, 1, 15),
          intervalInMaanden: 12,
          aantal: 4),
      LeningAanpassen.termijnen(
          bedrag: 5000,
          datum: DateTime(2030, 1, 4),
          intervalInMaanden: 1,
          aantal: 4),
      LeningAanpassen.termijnen(
          bedrag: 2000,
          datum: DateTime(2044, 1, 1),
          intervalInMaanden: 6,
          aantal: 3),
      LeningAanpassen.eenmalig(
        bedrag: 2000,
        datum: DateTime(2045, 1, 1),
      )
    ];
    final extraLenen = [
      LeningAanpassen.eenmalig(
          datum: DateTime(2025, 1, 15),
          bedrag: 18800,
          leningAanpassenOpties: LeningAanpassenOpties.verhogen),
      LeningAanpassen.eenmalig(
          datum: DateTime(2025, 6, 1),
          bedrag: 20000,
          leningAanpassenOpties: LeningAanpassenOpties.verhogen),
    ];

    final renteVanafPeriode = [
      const RenteVanafPeriode(rente: 4.1, periode: 0),
      const RenteVanafPeriode(rente: 3.0, periode: 120),
      const RenteVanafPeriode(rente: 2.5, periode: 240),
      const RenteVanafPeriode(rente: 2.7, periode: 241)
    ];

    /// Annuiteit 30 jaar
    ///
    ///
    ///

    HypotheekTermijnen t = HypotheekTermijnen(
        hoofdsom: 188000,
        rente: 5.0,
        startDatum: DateTime(2023, 4, 15),
        datumLening: DateTime(2023, 4, 15),
        hypotheekVorm: HypotheekVorm.annuiteit,
        aflosTermijnInMaanden: 360,
        periodeInMaanden: 360,
        eersteGebrokenMaandAlleenRente: true,
        perMaand: true,
        extraAflossen: extraAflossen,
        extraLenen: extraLenen,
        renteVanafPeriode: renteVanafPeriode);
    t.termijnenAanmaken();

    WriteToFile.writeHypotheekTermijnen(
        path: path,
        fileName: 'Termijn Voorbeelden 1',
        naam: 'Annuiteit',
        hypotheekTermijnen: t);

    /// Annuiteit na 240
    ///
    ///
    ///

    final double tussenLening = t.termijnen
        .firstWhere((element) =>
            element.startDatum.compareTo(DateTime(2043, 5, 1)) == 0)
        .lening;

    t = HypotheekTermijnen(
      hoofdsom: 188000,
      lening: tussenLening,
      rente: 5.0,
      startDatum: DateTime(2043, 5, 1),
      datumLening: DateTime(2043, 5, 1),
      hypotheekVorm: HypotheekVorm.annuiteit,
      aflosTermijnInMaanden: 120,
      periodeInMaanden: 120,
      eersteGebrokenMaandAlleenRente: true,
      perMaand: true,
      extraAflossen: extraAflossen,
      extraLenen: extraLenen,
      renteVanafPeriode: renteVanafPeriode,
    );
    t.termijnenAanmaken();

    WriteToFile.writeHypotheekTermijnen(
        path: path,
        fileName: 'Termijn Voorbeelden 1',
        naam: 'Annuiteit na 240',
        hypotheekTermijnen: t,
        append: true);

    /// Annuiteit oppikken op 240 mnd
    ///
    ///
    ///

    t = HypotheekTermijnen(
        hoofdsom: 188000,
        lening: tussenLening,
        rente: 5.0,
        startDatum: DateTime(2023, 4, 15),
        datumLening: DateTime(2043, 5, 1),
        hypotheekVorm: HypotheekVorm.annuiteit,
        aflosTermijnInMaanden: 360,
        periodeInMaanden: 360,
        eersteGebrokenMaandAlleenRente: true,
        perMaand: true,
        extraAflossen: extraAflossen,
        extraLenen: extraLenen,
        renteVanafPeriode: renteVanafPeriode);

    t.termijnenAanmaken();

    WriteToFile.writeHypotheekTermijnen(
        path: path,
        fileName: 'Termijn Voorbeelden 1',
        naam: 'Annuiteit oppikken op 240 mnd',
        hypotheekTermijnen: t,
        append: true);

    ///
    ///
    ///
    ///

    t = HypotheekTermijnen(
        hoofdsom: 188000,
        rente: 5.0,
        startDatum: DateTime(2023, 4, 15),
        datumLening: DateTime(2023, 4, 15),
        hypotheekVorm: HypotheekVorm.lineair,
        aflosTermijnInMaanden: 360,
        periodeInMaanden: 360,
        eersteGebrokenMaandAlleenRente: true,
        perMaand: true,
        extraAflossen: extraAflossen,
        extraLenen: extraLenen,
        renteVanafPeriode: renteVanafPeriode);
    t.termijnenAanmaken();

    WriteToFile.writeHypotheekTermijnen(
        path: path,
        fileName: 'Termijn Voorbeelden 1',
        naam: 'Lineair',
        hypotheekTermijnen: t,
        append: true);

    /// Gebroken maar wel meteen aflossen
    ///
    ///
    ///

    t = HypotheekTermijnen(
        hoofdsom: 188000,
        rente: 5.0,
        startDatum: DateTime(2023, 4, 15),
        datumLening: DateTime(2023, 4, 15),
        hypotheekVorm: HypotheekVorm.lineair,
        aflosTermijnInMaanden: 360,
        periodeInMaanden: 360,
        eersteGebrokenMaandAlleenRente: false,
        perMaand: true,
        extraAflossen: extraAflossen,
        extraLenen: extraLenen,
        renteVanafPeriode: renteVanafPeriode);
    t.termijnenAanmaken();

    WriteToFile.writeHypotheekTermijnen(
        path: path,
        fileName: 'Termijn Voorbeelden 1',
        naam: 'Lineair gebroken en aflossen',
        hypotheekTermijnen: t,
        append: true);

    /// Lineair oppikken op 240 mnd
    ///
    ///
    ///

    t = HypotheekTermijnen(
        hoofdsom: 188000,
        lening: t.termijnen
            .firstWhere((element) =>
                element.startDatum.compareTo(DateTime(2043, 5, 1)) == 0)
            .lening,
        rente: 5.0,
        startDatum: DateTime(2023, 4, 15),
        datumLening: DateTime(2043, 5, 1),
        hypotheekVorm: HypotheekVorm.lineair,
        aflosTermijnInMaanden: 360,
        periodeInMaanden: 360,
        eersteGebrokenMaandAlleenRente: false,
        perMaand: true,
        extraAflossen: extraAflossen,
        extraLenen: extraLenen,
        renteVanafPeriode: renteVanafPeriode);

    t.termijnenAanmaken();

    WriteToFile.writeHypotheekTermijnen(
        path: path,
        fileName: 'Termijn Voorbeelden 1',
        naam: 'Lineair oppikken op 240 mnd, gebroken en aflossen',
        hypotheekTermijnen: t,
        append: true);

    /// Aflosvrij
    ///
    ///
    ///

    t = HypotheekTermijnen(
        hoofdsom: 188000,
        rente: 5.0,
        startDatum: DateTime(2023, 4, 15),
        datumLening: DateTime(2023, 4, 15),
        hypotheekVorm: HypotheekVorm.aflosvrij,
        aflosTermijnInMaanden: 360,
        periodeInMaanden: 360,
        eersteGebrokenMaandAlleenRente: true,
        perMaand: true,
        extraAflossen: extraAflossen,
        extraLenen: extraLenen,
        renteVanafPeriode: renteVanafPeriode);
    t.termijnenAanmaken();

    WriteToFile.writeHypotheekTermijnen(
        path: path,
        fileName: 'Termijn Voorbeelden 1',
        naam: 'Aflosvrij',
        hypotheekTermijnen: t,
        append: true);
  }
}
