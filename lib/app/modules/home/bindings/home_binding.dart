import 'package:get/get.dart';
import 'package:rpsp_main/app/modules/bible/controllers/bible_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<BibleController>(
      () => BibleController(),
    );
  }
}
