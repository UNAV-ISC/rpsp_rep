part of '../views/home_view.dart';

class _Calendar extends StatefulWidget {
  @override
  __CalendarState createState() => __CalendarState();
}

class __CalendarState extends State<_Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final kToday = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final _prefs = StoragePrefs();
    final kFirstDay = DateTime(kToday.year, kToday.month, kToday.day);
    final kLastDay = DateTime(kToday.year, kToday.month, kToday.day);

    final dateNow = DateTime.now();
    int dayNow = dateNow.weekday;
    if (dateNow.day == 8) {
      dayNow = 0;
    }

    // print('dayNow: $dayNow');

    List<_Day> days = [];

    for (var i = 0; i < 7; i++) {
      // print('dateNow: ${dayNow + 1}');
      // print(i + 1);
      days.add(_Day(i + 1, dayNow + 1 == i + 1 ? true : false));
    }

    // final List<_Day> days = [
    //   _Day(1, false),
    //   _Day(2, true),
    //   _Day(3, false),
    //   _Day(4, false),
    //   _Day(5, false),
    //   _Day(6, false),
    //   _Day(7, false),
    // ];

    final a = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days
          .map((day) => _CircularProgress(
                progress: 25,
                isSelect: day.isSelected,
              ))
          .toList(),
    );

    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 110,
          // color: Colors.red,
          child: Container(
            margin: const EdgeInsets.only(top: 52),
            // color: Colors.brown,
            height: 50,
            child: a,
          ),
        ),
        TableCalendar(
          calendarStyle: const CalendarStyle(
            todayDecoration: BoxDecoration(
              shape: BoxShape.circle,
              //color: Color.fromARGB(255, 57, 210, 192),
            ),
            todayTextStyle: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          firstDay: kFirstDay,
          lastDay: kLastDay,
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          headerStyle: const HeaderStyle(
            // leftChevronIcon: Icon(Icons.arrow_left),
            // rightChevronIcon: Icon(Icons.arrow_right),
            // titleCentered: true,
            headerPadding: EdgeInsets.only(left: 10, top: 8, bottom: 8),
            titleTextStyle: TextStyle(
                // color: _prefs.isDarkMode ? Colors.grey : Colors.black,
                fontSize: 18),
            leftChevronVisible: false,
            rightChevronVisible: false,
            formatButtonVisible: false,
          ),
          selectedDayPredicate: (day) {
            // Use `selectedDayPredicate` to determine which day is currently selected.
            // If this returns true, then `day` will be marked as selected.

            // Using `isSameDay` is recommended to disregard
            // the time-part of compared DateTime objects.
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            print(focusedDay);
            if (!isSameDay(_selectedDay, selectedDay)) {
              // Call `setState()` when updating the selected day
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            }
          },
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              // Call `setState()` when updating calendar format
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            // No need to call `setState()` here

            _focusedDay = focusedDay;
          },
        ),
      ],
    );
  }
}

class _CircularProgress extends StatelessWidget {
  final bool isSelect;
  final int progress;

  const _CircularProgress({this.isSelect = false, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: CircularProgressIndicator(
        color: isSelect
            ? Theme.of(context).primaryColor
            : Theme.of(context).scaffoldBackgroundColor,
        value: progress / 100,
        strokeWidth: 4.0,
      ),
    );
  }
}

class _Day {
  final int numberDay;
  final bool isSelected;

  _Day(this.numberDay, this.isSelected);
}
