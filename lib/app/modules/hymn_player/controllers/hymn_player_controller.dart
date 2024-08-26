import 'dart:io';

// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HymnPlayerController extends GetxController {
  // AudioCache _audioCache = AudioCache();

  final audioUrl = 'https://luan.xyz/files/audio/nasa_on_a_mission.mp3';

  @override
  void onInit() {
    if (kIsWeb) {
      // Calls to Platform.isIOS fails on web
      return;
    }
    if (Platform.isIOS) {
      ///////_audioCache.fixedPlayer?.notificationService.startHeadlessService();
    }
    super.onInit();
  }
}
