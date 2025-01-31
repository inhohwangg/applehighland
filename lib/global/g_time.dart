import 'package:intl/intl.dart';

koreanTime(item) {
  return item == null
      ? ''
      : DateFormat('yyyy-MM-dd').format(DateTime.parse(item).toLocal());
}
