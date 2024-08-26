import 'package:flutter/material.dart';
import 'package:rpsp_main/app/modules/plans/views/read_plan.dart';
import 'package:rpsp_main/app/shared/global_widgets/buttons/custom_material_button.dart';

import 'package:rpsp_main/app/shared/global_widgets/page_with_sliver.dart';
import 'package:rpsp_main/app/shared/helpers/date_2_spanish_date.dart';
import 'package:rpsp_main/app/shared/helpers/navigate_to.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPlanView extends StatelessWidget {
  final int index;
  final String text;
  const CalendarPlanView({super.key, required this.index, required this.text});
  @override
  Widget build(BuildContext context) {
    return PageWithSliver(
        title: text,
        // titleColor: Colors.black,
        // dateColor: Colors.grey,
        isOpacityImage: true,
        titleFontSize: 15,
        dateFontSize: 10,
        imagePath: 'plans/$index.jpg',
        children: [
          _Calendar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      today(),
                      style: TextStyle(
                          color: Theme.of(context).indicatorColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      '1era de Juan 3:09-26',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 120,
                    // color: Colors.red,
                    child: CustomMaterialButton(
                      width: 120,
                      height: 36,
                      child:
                          const Text('Leer', style: TextStyle(color: Colors.white)),
                      onPressed: () => navigateTo(
                          context, ReadPlanView(index: index, text: text)),
                    ),
                  ),
                )
              ],
            ),
          )
        ]);
  }
}

class _Calendar extends StatefulWidget {
  @override
  __CalendarState createState() => __CalendarState();
}

class __CalendarState extends State<_Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final kToday = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final kFirstDay = DateTime(kToday.year, kToday.month, kToday.day);
    final kLastDay = DateTime(kToday.year, kToday.month, kToday.day);

    return TableCalendar(
      locale: 'es, ES',
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).indicatorColor,
        ),
        todayTextStyle: const TextStyle(
          fontSize: 17,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        disabledTextStyle: const TextStyle(color: Colors.black87),
      ),
      firstDay: kFirstDay,
      lastDay: kLastDay,
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      headerStyle: const HeaderStyle(
        headerPadding: EdgeInsets.only(left: 10, top: 8, bottom: 8),
        titleTextStyle: TextStyle(fontSize: 18),
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
    );
  }
}
