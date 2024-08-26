import 'package:flutter/material.dart';

class ImageHeader extends StatelessWidget {
  final String nameImage;

  const ImageHeader(this.nameImage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('assets/$nameImage.jpg'),
          // colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
