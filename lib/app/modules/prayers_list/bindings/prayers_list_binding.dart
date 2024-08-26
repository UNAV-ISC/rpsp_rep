import 'package:get/get.dart';

import '../controllers/prayers_list_controller.dart';

class PrayersListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrayersListController>(
      () => PrayersListController(),
    );
  }
}
