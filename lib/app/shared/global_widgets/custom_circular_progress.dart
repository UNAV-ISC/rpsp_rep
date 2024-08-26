import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCircularProgress extends StatelessWidget {
  final Color? color;
  final double h;
  final double w;

  const CustomCircularProgress({super.key, this.h = 100, this.w = 100, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: w,
        height: h,
        child: CircularProgressIndicator(
          color: color ?? Get.theme.primaryColor,
          strokeWidth: 6,
        ),
      ),
    );
  }
}
