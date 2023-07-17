import 'package:intl/intl.dart';

class DatumId {
  static String toDayIdToString<T>(Iterable<T> list,
          {required String Function(T value) toString}) =>
      '${toDayId<T>(list, toString: toString)}';

  static int toDayId<T>(Iterable<T> list,
      {required String Function(T value) toString}) {
    int lastId = 0;

    for (T v in list) {
      int value = int.tryParse(toString(v)) ?? 0;
      if (lastId < value) {
        lastId = value;
      }
    }
    int toDayId =
        int.parse('${DateFormat('yyyyMMdd').format(DateTime.now())}001');
    if (toDayId <= lastId) {
      toDayId = lastId + 1;
    }
    return toDayId;
  }

  int get dateID {
    return int.parse('${DateFormat('yyyyMMdd').format(DateTime.now())}001');
  }

  String get secondsID {
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now());
  }
}
