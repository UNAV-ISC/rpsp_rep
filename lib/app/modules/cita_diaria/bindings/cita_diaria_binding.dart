import 'package:get/get.dart';

import '../controllers/cita_diaria_controller.dart';

class CitaDiariaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CitaDiariaController>(
      () => CitaDiariaController(),
    );
  }
}
