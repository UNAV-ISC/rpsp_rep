import 'package:flutter/material.dart';
import 'package:rpsp_main/app/shared/responisve/responsive.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final double height;
  final double? witdh;
  final double fontSize;
  final double paddingH;
  final double paddingV;
  final Color? color;
  final double borderRadius;

  const CustomButton({super.key, 
    required this.title,
    required this.onPressed,
    this.height = 60,
    this.witdh,
    this.fontSize = 23,
    this.paddingH = 20,
    this.paddingV = 15,
    this.color,
    this.borderRadius = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Center(
      child: Container(
        width: witdh,
        constraints: const BoxConstraints(
          maxWidth: 400,
        ),
        margin: EdgeInsets.symmetric(
            horizontal: paddingH, vertical: paddingV),
        child: MaterialButton(
          disabledColor: Colors.grey,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          height: responsive.optionDevice(
              mobileOption: height,
              tabletOption: 45.0,
              desktopOption: 45.0),
          minWidth: responsive.width,
          color: color ?? Theme.of(context).primaryColor,
          elevation: 6,
          padding: const EdgeInsets.all(7.0),
          onPressed: onPressed,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
