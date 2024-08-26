import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  PageController pageController = PageController(initialPage: 0);

  var formKeyregister = GlobalKey<FormState>();

  var formKeyregister2 = GlobalKey<FormState>();

  var formKeyName = GlobalKey<FormState>();

  final emailTextController = TextEditingController();
  final nameTextController = TextEditingController();

  File file = File('');

  goToPage(int page) => pageController.animateToPage(page,
      duration: const Duration(milliseconds: 200), curve: Curves.bounceInOut);

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
