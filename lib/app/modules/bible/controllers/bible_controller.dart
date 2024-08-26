import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BibleController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 2)..addListener(() {});
    super.onInit();
  }
}
