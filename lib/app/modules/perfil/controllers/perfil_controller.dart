import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rpsp_main/app/data/models/user.dart';
import 'package:rpsp_main/app/data/providers/user_provider.dart';

class ProfileController extends GetxController {
  final _userProvider = Get.put(UserProvider());

  File file = File('');

  RxBool darkMode = false.obs;

  late User user;

  @override
  void onInit() {
    user = _userProvider.user;
    super.onInit();
  }

  Future<void> selectImageFromGallery() async {
    ImagePicker pickergallery = ImagePicker();
    print('obteniendo imagen de ImagePicker...');
    final XFile? imageGallery = await pickergallery.pickImage(
      source: ImageSource.gallery,
      maxHeight: 480,
      maxWidth: 640,
      imageQuality: 50,
    );
    file = File(imageGallery!.path);
    update(['avatar']);
  }

  Future<void> captureImage() async {
    ImagePicker pickercamera = ImagePicker();
    final XFile? image = await pickercamera.pickImage(
      source: ImageSource.camera,
      maxHeight: 480,
      maxWidth: 640,
      imageQuality: 50,
    );
    file = File(image!.path);
    update(['avatar']);
  }
}
