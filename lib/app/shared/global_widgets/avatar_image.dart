import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:rpsp_main/app/shared/theme/theme_dark.dart';

class AvatarImage extends StatelessWidget {
  final File file;

  final VoidCallback? captureImage;
  final VoidCallback? selectImage;

  final Color externalColor;
  final Color color;
  final double bigRadius;
  final double smallRadius;

  const AvatarImage({
    super.key,
    required this.file,
    this.captureImage,
    this.selectImage,
    this.externalColor = const Color(0xffCFCFCF),
    this.color = const Color(0xffE6E6E6),
    this.bigRadius = 80.0,
    this.smallRadius = 73.0,
  });

  // final kColor1 = Color(0xffE6E6E6);
  // final kColor2 = Color(0xffCFCFCF);

  // final bigRadius = 80.0;
  // final smallRadius = 73.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        elevation: 5,
        color: Colors.white,
        shape: const CircleBorder(),
        height: 2 * bigRadius,
        minWidth: 2 * bigRadius,
        onPressed: captureImage == null ? () {} : selectImageModal,
        child: CircleAvatar(
          backgroundColor: externalColor,
          radius: bigRadius,
          child: file.path != ''
              ? CircleAvatar(
                  radius: smallRadius,
                  backgroundColor: color,
                  backgroundImage: Image.file(
                    file,
                    fit: BoxFit.cover,
                  ).image,
                )
              : CircleAvatar(
                  radius: smallRadius,
                  backgroundColor: color,
                  child: Icon(
                    FontAwesomeIcons.camera,
                    color: externalColor,
                    size: bigRadius * 0.7,
                  )),
        ),
      ),
    );
  }

  selectImageModal() {
    Get.bottomSheet(
      Container(
        height: 200,
        width: double.infinity,
        color: Colors.transparent,
        child: Ink(
            padding: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                color: kPrimaryColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _CustomButton(text: 'CAMARA', onPressed: captureImage!),
                _CustomButton(text: 'GALERIA', onPressed: selectImage!),
                _CustomButton(text: 'CANCELAR', onPressed: () {}),
                const SizedBox(height: 5)
              ],
            )),
      ),
      backgroundColor: Colors.transparent,
      enableDrag: false,
    );
  }
}

class _CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const _CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    const textStyleModal =
        TextStyle(color: kContentColorDarkTheme, fontSize: 14);
    return TextButton(
      child: Text(text, style: textStyleModal),
      onPressed: () {
        Get.back();
        onPressed();
      },
    );
  }
}
