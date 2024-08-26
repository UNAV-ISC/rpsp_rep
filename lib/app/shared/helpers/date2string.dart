import 'package:intl/intl.dart';

String date2String(DateTime date) {
  return DateFormat('dd/MM/yyyy', 'es').format(date);
}
