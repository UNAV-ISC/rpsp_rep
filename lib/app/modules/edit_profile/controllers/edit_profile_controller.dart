import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  File file = File('');

  final nameTextController = TextEditingController();
  RxString birthDate = ''.obs;
  final emailTextController = TextEditingController();

  RxString country = ''.obs;
  RxString county = ''.obs;
  RxString language = ''.obs;
  RxString sex = ''.obs;

////////////////////////////////////////////////////
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
