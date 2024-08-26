import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StarsLevel extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;

  const StarsLevel({super.key, this.mainAxisAlignment = MainAxisAlignment.center});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: const [
        Icon(FontAwesomeIcons.solidStar, color: Color(0xFF3E6F89), size: 15),
        SizedBox(width: 4),
        Icon(FontAwesomeIcons.solidStar, color: Color(0xFF3E6F89), size: 15),
        SizedBox(width: 4),
        Icon(FontAwesomeIcons.solidStar, color: Color(0xFF3E6F89), size: 15),
        SizedBox(width: 4),
        Icon(FontAwesomeIcons.solidStar, color: Color(0xFF3E6F89), size: 15),
      ],
    );
  }
}
