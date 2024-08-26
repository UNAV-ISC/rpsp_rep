import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpsp_main/app/shared/global_widgets/buttons/custom_button.dart';

class DialogHelper {
  //show error dialog
  static void showErroDialog(
      {String title = 'Error', String? description = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Get.textTheme.headlineMedium!.copyWith(color: Colors.red),
              ),
              Text(
                description ?? '',
                style: Get.textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              CustomButton(
                  title: 'Aceptar',
                  height: 40,
                  fontSize: 15,
                  onPressed: () {
                    if (Get.isDialogOpen!) Get.back();
                  })
            ],
          ),
        ),
      ),
    );
  }

  //show toast
  //show snack bar
  //show loading
  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 8),
              Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}
