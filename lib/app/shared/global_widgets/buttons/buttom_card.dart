import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  const ButtonCard({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(0),
      onPressed: onTap,
      child: child,
    );
  }
}
