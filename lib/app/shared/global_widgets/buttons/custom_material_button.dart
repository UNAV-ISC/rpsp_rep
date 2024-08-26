import 'package:flutter/material.dart';
import 'package:rpsp_main/app/shared/responisve/responsive.dart';

class CustomMaterialButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final double height;
  final double width;
  final double paddingH;
  final double paddingV;
  final Color? color;
  final double elevation;

  final double borderRadius;

  const CustomMaterialButton({super.key, 
    required this.child,
    required this.onPressed,
    this.height = 55,
    this.paddingH = 0,
    this.paddingV = 0,
    this.color,
    this.width = double.infinity,
    this.borderRadius = 10,
    this.elevation = 1,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Center(
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.symmetric(
            horizontal: paddingH, vertical: paddingV),
        child: MaterialButton(
            disabledColor: Colors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius)),
            height: height,
            minWidth: responsive.width,
            color: color ?? Theme.of(context).primaryColor,
            elevation: elevation,
            padding: const EdgeInsets.all(7.0),
            onPressed: onPressed,
            child: child),
      ),
    );
  }
}
