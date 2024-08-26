import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpsp_main/app/modules/perfil/controllers/perfil_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final _profileController = Get.find<ProfileController>();
  late String name, lastName;

  Map<DateTime, List>? events;
  List? selectedEvents;
  AnimationController? animationController;

  @override
  void onInit() {
    name = _profileController.user.name;
    lastName = _profileController.user.lastName;

    final selectedDay = DateTime.now();

    events = {
      selectedDay.subtract(const Duration(days: 30)): [
        'Event A0',
        'Event B0',
        'Event C0'
      ],
      selectedDay.subtract(const Duration(days: 27)): ['Event A1'],
      selectedDay.subtract(const Duration(days: 20)): [
        'Event A2',
        'Event B2',
        'Event C2',
        'Event D2'
      ],
    };

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    super.onInit();
  }

  void onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: onDaySelected');
    selectedEvents = events;
    update();
  }

  void onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: onVisibleDaysChanged');
  }

  void onCalendarCreated(DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: onCalendarCreated');
  }

  List<String> listTimes = [
    '07:00 AM',
    '07:30 AM',
    '08:00 AM',
    '07:00 AM',
    '07:00 AM',
    '07:00 AM',
    '07:00 AM',
    '07:00 AM',
    '07:00 AM',
    '07:00 AM',
    '07:00 AM',
    '07:00 AM',
    '07:00 AM',
    '07:00 AM',
    '07:00 AM',
  ];

  List<bool> availablesTimes = [
    true,
    false,
    false,
    false,
    false,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  void onClose() {
    super.onClose();
    super.dispose();
  }
}
