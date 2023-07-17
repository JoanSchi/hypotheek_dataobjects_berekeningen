import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../gereedschap/kalender.dart';
import '../uitwerken/aflopend_krediet_verwerken.dart';
import '../uitwerken/autolease_verwerken.dart';
import '../uitwerken/doorlopendkrediet_verwerken.dart';
import '../uitwerken/verzendkrediet_verwerken.dart';

part 'schulden.freezed.dart';
part 'schulden.g.dart';

enum AKbetaling {
  ingangsdatum,
  perEerstVolgendeMaand,
}

enum DateStatus {
  now,
  before,
  after,
}

enum SchuldenCategorie {
  aflopendKrediet,
  doorlopendKrediet,
  verzendhuiskrediet,
  autolease
}

enum VKbedrag {
  totaal,
  mnd,
}

enum StatusBerekening { berekend, nietBerekend, fout }

@freezed
class SchuldenOverzicht with _$SchuldenOverzicht {
  const factory SchuldenOverzicht(
      {@Default(IListConst([])) IList<Schuld> lijst}) = _SchuldenOverzicht;

  factory SchuldenOverzicht.fromJson(Map<String, Object?> json) =>
      _$SchuldenOverzichtFromJson(json);
}

@freezed
class Schuld with _$Schuld {
  const Schuld._();

  const factory Schuld.leaseAuto({
    required String id,
    required SchuldenCategorie categorie,
    required String omschrijving,
    required DateTime beginDatum,
    required StatusBerekening statusBerekening,
    required String error,
    //
    required double mndBedrag,
    required int jaren,
    required int maanden,
  }) = LeaseAuto;

  const factory Schuld.verzendKrediet({
    required String id,
    required SchuldenCategorie categorie,
    required String omschrijving,
    required DateTime beginDatum,
    required StatusBerekening statusBerekening,
    required String error,
    //
    required double totaalBedrag,
    required double mndBedrag,
    required double slotTermijn,
    required int maanden,
    required int minMaanden,
    required int maxMaanden,
    required VKbedrag vkBedrag,
    required bool heeftSlotTermijn,
    required int decimalen,
  }) = VerzendKrediet;

  const factory Schuld.doorlopendKrediet({
    required String id,
    required SchuldenCategorie categorie,
    required String omschrijving,
    required DateTime beginDatum,
    required StatusBerekening statusBerekening,
    required String error,
    //
    required double bedrag,
    required DateTime eindDatumGebruiker,
    required bool heeftEindDatum,
  }) = DoorlopendKrediet;

  const factory Schuld.aflopendKrediet(
      {required String id,
      required SchuldenCategorie categorie,
      required String omschrijving,
      required DateTime beginDatum,
      required StatusBerekening statusBerekening,
      required String error,
      //
      required double lening,
      required double rente,
      required double termijnBedragMnd,
      required double minTermijnBedragMnd,
      required int maanden,
      required int minMaanden,
      required int maxMaanden,
      required double minAflossenPerMaand,
      required double maxAflossenPerMaand,
      required double defaultAflossenPerMaand,
      required IList<AKtermijnAnn> termijnen,
      required double somInterest,
      required double somAnn,
      required double slotTermijn,
      required int decimalen,
      required bool eersteGebrokenMaandAlleenRente,
      required AKbetaling betaling}) = AflopendKrediet;

  factory Schuld.fromJson(Map<String, Object?> json) => _$SchuldFromJson(json);

  DateStatus dateStatus(DateTime huidigeDatum) {
    huidigeDatum = Kalender.datumAlleen(huidigeDatum);

    if (beginDatum.compareTo(huidigeDatum) > 0) {
      return DateStatus.before;
    }

    if (eindDatum.compareTo(huidigeDatum) >= 0) {
      return DateStatus.now;
    }
    return DateStatus.after;
  }

  DateTime get eindDatum {
    return map(leaseAuto: (LeaseAuto leaseAuto) {
      return LeaseAutoVerwerken.eindDatum(leaseAuto);
    }, aflopendKrediet: (AflopendKrediet ak) {
      return AflopendKredietVerwerken.eindDatum(ak);
    }, verzendKrediet: (VerzendKrediet vk) {
      return VerzendKredietVerwerken.eindDatum(vk);
    }, doorlopendKrediet: (DoorlopendKrediet dk) {
      return DoorlopendKredietVerwerken.eindDatum(dk);
    });
  }

  double maandLast(DateTime huidige) {
    return map(leaseAuto: (LeaseAuto leaseAuto) {
      return LeaseAutoVerwerken.maandLast(leaseAuto, huidige);
    }, aflopendKrediet: (AflopendKrediet value) {
      return 0;
    }, verzendKrediet: (VerzendKrediet vk) {
      return VerzendKredietVerwerken.maandLast(vk, huidige);
    }, doorlopendKrediet: (DoorlopendKrediet dk) {
      return DoorlopendKredietVerwerken.maandLast(dk, huidige);
    });
  }
}

@freezed
class AKtermijnAnn with _$AKtermijnAnn {
  const factory AKtermijnAnn(
      {required DateTime termijn,
      required double interest,
      required double aflossen,
      required double schuld,
      required double termijnBedrag}) = _AKtermijnAnn;

  factory AKtermijnAnn.fromJson(Map<String, Object?> json) =>
      _$AKtermijnAnnFromJson(json);
}
