import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpsp_main/app/shared/global_widgets/buttons/custom_button.dart';

errorApiDialog() {
  Get.dialog(
    AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: const Text(
        'ERROR',
        style: TextStyle(color: Colors.red, fontSize: 28),
        textAlign: TextAlign.center,
      ),
      content: const Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Ha ocurrido un error, no se ha podido conectar con el servidor',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          )
          //SettingsWidget()
        ],
      ),
      actions: <Widget>[
        CustomButton(
            color: Get.theme.primaryColor,
            title: 'Aceptar',
            height: 40,
            fontSize: 15,
            onPressed: () {
              Get.back();
            })
      ],
    ),
    barrierDismissible: true,
  );
}
