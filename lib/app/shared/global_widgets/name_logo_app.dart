import 'package:flutter/material.dart';

class NameLogoApp extends StatelessWidget {
  final Color color;
  const NameLogoApp({super.key, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'RPSP',
          style: TextStyle(
              color: color, fontSize: 50, fontWeight: FontWeight.bold),
        ),
        Text(
          '2024',
          style: TextStyle(color: color, fontSize: 25),
        ),
      ],
    );
  }
}
