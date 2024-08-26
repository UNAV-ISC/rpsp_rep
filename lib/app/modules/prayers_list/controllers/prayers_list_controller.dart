import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrayersListController extends GetxController {
  ScrollController scrollController = ScrollController();

  // RxBool selected = false.obs;

  List<bool> selecteds = [false, false, false, false];

  @override
  void onInit() {
    scrollController.addListener(scrollListener);
    super.onInit();
  }

  bool get isShrink {
    return scrollController.hasClients &&
        scrollController.offset > (200 - kToolbarHeight);
  }

  bool lastStatus = true;

  scrollListener() {
    if (isShrink != lastStatus) {
      lastStatus = isShrink;
      update();
    }
  }

  @override
  void onClose() {
    scrollController.removeListener(scrollListener);
    super.onClose();
  }
}
