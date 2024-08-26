import 'package:get/get.dart';

import '../controllers/personal_plan_controller.dart';

class PersonalPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalPlanController>(
      () => PersonalPlanController(),
    );
  }
}
