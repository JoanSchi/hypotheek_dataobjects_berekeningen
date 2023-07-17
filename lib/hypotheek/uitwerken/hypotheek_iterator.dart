// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:collection';
import '../gegevens/hypotheek/hypotheek.dart';
import '../gegevens/hypotheek_dossier/hypotheek_dossier.dart';

final class HypotheekIterateItem extends LinkedListEntry<HypotheekIterateItem> {
  Hypotheek hypotheek;
  bool last = false;

  HypotheekIterateItem(
    this.hypotheek,
  );

  List<Hypotheek> get parallelHypotheken =>
      list?.map((e) => e.hypotheek).where((Hypotheek e) {
        // debugPrint(
        //     'id e ${e.id} id hypotheek ${hypotheek.id} not equal ${hypotheek != e} ${e.eindDatum.compareTo(hypotheek.startDatum)}');
        // debugPrint('date e ${e.eindDatum}');
        // debugPrint('date hypotheek ${hypotheek.startDatum}');
        // debugPrint(
        //     'toevoegen ${e != hypotheek && e.eindDatum.compareTo(hypotheek.startDatum) > 0}');
        return //e != hypotheek &&
            e.eindDatum.compareTo(hypotheek.startDatum) > 0;
      }).toList() ??
      const [];
}

class HypotheekIterator {
  static Iterable<Hypotheek> all(HypotheekDossier hypotheekDossier) sync* {
    final hypotheken = hypotheekDossier.hypotheken;
    List<String> eerste = hypotheekDossier.eersteHypotheken.unlock;

    while (eerste.isNotEmpty) {
      int index = 0;
      DateTime? datum;

      for (int i = 0; i < eerste.length; i++) {
        DateTime d = hypotheken[eerste[i]]!.startDatum;

        if (datum == null || d.compareTo(datum) < 0) {
          index = i;
          datum = d;
        }
      }

      Hypotheek? hypotheek = hypotheken[eerste[index]];

      if (hypotheek == null) {
        return;
      }

      String volgende = hypotheek.volgende;

      if (volgende.isEmpty) {
        eerste.removeAt(index);
      } else {
        eerste[index] = volgende;
      }

      yield hypotheek;
    }
  }

  static Iterable<Hypotheek> allesBehalveVerlengingId(
      HypotheekDossier hypotheekDossier, String id) sync* {
    final hypotheken = hypotheekDossier.hypotheken;
    List<String> eerste = hypotheekDossier.eersteHypotheken.unlock;

    while (eerste.isNotEmpty) {
      int index = 0;
      DateTime? datum;

      for (int i = 0; i < eerste.length; i++) {
        DateTime d = hypotheken[eerste[i]]!.startDatum;

        if (datum == null || d.compareTo(datum) < 0) {
          index = i;
          datum = d;
        }
      }

      Hypotheek? hypotheek = hypotheken[eerste[index]];

      if (hypotheek == null) {
        return;
      }

      String volgende = hypotheek.volgende;

      if (volgende.isEmpty || hypotheek.id == id) {
        eerste.removeAt(index);
      } else {
        eerste[index] = volgende;
      }

      yield hypotheek;
    }
  }

  //
  //
  //

  // Iterable<Hypotheek> all() sync* {
  //   LinkedList<HypotheekIterateItem> linkedList = LinkedList();

  //   for (String id in eersteHypotheken) {
  //     Hypotheek? hypotheek = hypotheken[id];
  //     if (hypotheek == null) {
  //       assert(false, 'Id uit eersteHypotheken niet gevonden!');
  //       continue;
  //     }
  //     linkedList.add(HypotheekIterateItem(hypotheek));
  //   }

  //   while (true) {
  //     HypotheekIterateItem? iItem;

  //     for (HypotheekIterateItem e in linkedList) {
  //       if (iItem == null ||
  //           e.hypotheek.startDatum.compareTo(iItem.hypotheek.startDatum) < 0) {
  //         iItem = e;
  //       }
  //     }

  //     final HypotheekIterateItem? entry = iItem;

  //     if (entry == null) break;

  //     iItem = entry.next;

  //     if (entry.hypotheek.volgende.isNotEmpty) {
  //       entry.hypotheek = hypotheken[entry.hypotheek.volgende]!;
  //     } else {
  //       linkedList.remove(entry);
  //     }

  //     yield entry.hypotheek;
  //   }
  // }

  // HypotheekIterateItem onlyWithParallel(Hypotheek hypotheek) {
  //   LinkedList<HypotheekIterateItem> linkedList = LinkedList();

  //   for (String id in eersteHypotheken) {
  //     Hypotheek? hypotheek = hypotheken[id];
  //     if (hypotheek == null) {
  //       assert(false, 'Id uit eersteHypotheken niet gevonden!');
  //       continue;
  //     }
  //     linkedList.add(HypotheekIterateItem(hypotheek));
  //   }

  //   while (true) {
  //     HypotheekIterateItem? iItem;

  //     for (HypotheekIterateItem e in linkedList) {
  //       if (e.last) continue;

  //       if (e.hypotheek == hypotheek) {
  //         debugPrint('returned hypotheek ${e.hypotheek.id}');
  //         return e;
  //       }
  //       if (iItem == null ||
  //           e.hypotheek.startDatum.compareTo(iItem.hypotheek.startDatum) < 0) {
  //         iItem = e;
  //       }
  //     }

  //     final HypotheekIterateItem? entry = iItem;

  //     if (entry == null) break;

  //     iItem = entry.next;

  //     if (entry.hypotheek.volgende.isNotEmpty) {
  //       entry.hypotheek = hypotheken[entry.hypotheek.volgende]!;
  //     } else {
  //       entry.last = true;
  //     }
  //   }
  //   return HypotheekIterateItem(hypotheek);
  // }

  // Iterable<HypotheekIterateItem> parallelMetStartDatum(
  //   Hypotheek? vanaf,
  // ) sync* {
  //   LinkedList<HypotheekIterateItem> linkedList = LinkedList();

  //   for (String id in eersteHypotheken) {
  //     Hypotheek? hypotheek = hypotheken[id];
  //     if (hypotheek == null) {
  //       assert(false, 'Id uit eersteHypotheken niet gevonden!');
  //       continue;
  //     }
  //     linkedList.add(HypotheekIterateItem(hypotheek));
  //   }

  //   bool found = vanaf == null;

  //   while (true) {
  //     HypotheekIterateItem? iItem;

  //     for (HypotheekIterateItem e in linkedList) {
  //       if (e.last) continue;

  //       if (iItem == null ||
  //           e.hypotheek.startDatum.compareTo(iItem.hypotheek.startDatum) < 0) {
  //         iItem = e;
  //       }
  //     }

  //     final HypotheekIterateItem? entry = iItem;

  //     if (entry == null) break;

  //     iItem = entry.next;

  //     if (entry.hypotheek.volgende.isNotEmpty) {
  //       entry.hypotheek = hypotheken[entry.hypotheek.volgende]!;
  //     } else {
  //       entry.last = true;
  //     }

  //     if (found || entry.hypotheek == vanaf) {
  //       found = true;
  //       yield entry;
  //     }
  //   }
  // }

  // Iterable<HypotheekIterateItem> parallelTm(
  //     {Hypotheek? vanaf, Hypotheek? tm}) sync* {
  //   LinkedList<HypotheekIterateItem> linkedList = LinkedList();

  //   for (String id in eersteHypotheken) {
  //     Hypotheek? hypotheek = hypotheken[id];
  //     if (hypotheek == null) {
  //       assert(false, 'Id uit eersteHypotheken niet gevonden!');
  //       continue;
  //     }
  //     linkedList.add(HypotheekIterateItem(hypotheek));
  //   }

  //   while (true) {
  //     HypotheekIterateItem? iItem;

  //     for (HypotheekIterateItem e in linkedList) {
  //       if (e.last) continue;

  //       if (iItem == null ||
  //           e.hypotheek.startDatum.compareTo(iItem.hypotheek.startDatum) < 0) {
  //         iItem = e;
  //       }
  //     }

  //     final HypotheekIterateItem? entry = iItem;

  //     if (entry == null) break;

  //     iItem = entry.next;

  //     if (entry.hypotheek.volgende.isNotEmpty) {
  //       entry.hypotheek = hypotheken[entry.hypotheek.volgende]!;
  //     } else {
  //       entry.last = true;
  //     }

  //     if (vanaf != null && vanaf == entry.hypotheek) {
  //       yield entry;
  //       vanaf = null;
  //     } else if (tm != null && tm == entry.hypotheek) {
  //       yield entry;
  //       break;
  //     } else {
  //       yield entry;
  //     }
  //   }
  // }

  static Iterable<Hypotheek> parallelStartDatum(
      HypotheekDossier hypotheekDossier,
      Hypotheek hypotheek,
      DateTime startDatum) sync* {
    final hypotheken = hypotheekDossier.hypotheken;
    final eersteHypotheken = hypotheekDossier.eersteHypotheken;

    for (String id in eersteHypotheken) {
      while (id.isEmpty) {
        Hypotheek? h = hypotheken[id];

        if (h == null) {
          break;
        }
        id = h.volgende;

        if (h.id != hypotheek.id &&
            h.startDatum.compareTo(startDatum) <= 0 &&
            startDatum.compareTo(h.eindDatum) < 0) {
          yield h;
          break;
        }
      }
    }
  }
}
