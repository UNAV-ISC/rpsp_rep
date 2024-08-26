import 'package:get/get.dart';

import '../controllers/hymn_player_controller.dart';

class HymnPlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HymnPlayerController>(
      () => HymnPlayerController(),
    );
  }
}
