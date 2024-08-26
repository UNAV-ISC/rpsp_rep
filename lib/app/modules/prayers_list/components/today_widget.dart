part of '../views/add_prayers_list_view.dart';

class _TodayWidget extends StatelessWidget {
  todayRow() {
    String dateTemp = DateFormat('EEEE d - MMMM', 'es').format(DateTime.now());

//  dateTemp = dateTemp[0].toUpperCase();
    final first = dateTemp.substring(0, 1).toUpperCase();

    dateTemp = first + dateTemp.substring(1, dateTemp.length);
    final fixedDate = dateTemp.replaceAll(RegExp('-'), 'de');
    return fixedDate;
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    String day = DateFormat('dd', 'es').format(today);
    // final first = day.substring(0, 1).toUpperCase();

    // day = first + day.substring(1, day.length);
    String month = DateFormat('MMM', 'es').format(today);
    return Row(
      children: [
        Text(
          day,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 2),
        Wrap(
          spacing: -2,
          direction: Axis.vertical,
          children: [
            Text(month, style: const TextStyle(fontSize: 10)),
            Text(today.year.toString(), style: const TextStyle(fontSize: 10)),
          ],
        )
      ],
    );
  }
}
