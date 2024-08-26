import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpsp_main/app/shared/global_widgets/buttons/custom_button.dart';

customDialog({
  String title = '',
  required String text,
  bool error = true,
  required Function action,
  bool dismissible = true,
}) {
  Get.dialog(
    AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: error
          ? const Text(
              'ERROR',
              style: TextStyle(color: Colors.red, fontSize: 28),
              textAlign: TextAlign.center,
            )
          : Text(
              title,
              style: const TextStyle(color: Colors.green, fontSize: 28),
              textAlign: TextAlign.center,
            ),
      content: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          )
          //SettingsWidget()
        ],
      ),
      actions: <Widget>[
        CustomButton(
          title: 'Aceptar',
          onPressed: () {
            Get.back();
            action();
          },
        )
      ],
    ),
    barrierDismissible: dismissible,
  );
}
