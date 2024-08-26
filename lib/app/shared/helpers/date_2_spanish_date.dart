import 'package:intl/intl.dart';

String today() {
  String dateTemp = DateFormat('EEEE d - MMMM', 'es').format(DateTime.now());

//  dateTemp = dateTemp[0].toUpperCase();
  final first = dateTemp.substring(0, 1).toUpperCase();

  dateTemp = first + dateTemp.substring(1, dateTemp.length);
  final fixedDate = dateTemp.replaceAll(RegExp('-'), 'de');
  return fixedDate;
}

String todayWithYear() {
  String dateTemp =
      DateFormat('EEEE d - MMMM - yyy', 'es').format(DateTime.now());

//  dateTemp = dateTemp[0].toUpperCase();
  final first = dateTemp.substring(0, 1).toUpperCase();

  dateTemp = first + dateTemp.substring(1, dateTemp.length);
  final fixedDate = dateTemp.replaceAll(RegExp('-'), 'de');
  return fixedDate;
}

String todayOnlyDay() {
  String dateTemp = DateFormat('EEEE dd', 'es').format(DateTime.now());

//  dateTemp = dateTemp[0].toUpperCase();
  final first = dateTemp.substring(0, 1).toUpperCase();

  dateTemp = first + dateTemp.substring(1, dateTemp.length);
  // final fixedDate = dateTemp.replaceAll(RegExp('-'), 'de');
  return dateTemp;
}
