import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final bool isFilled;
  final IconData icon;

  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
    this.color = Colors.indigo,
    this.isFilled = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(const StadiumBorder()),
          // backgroundColor: MaterialStateProperty.all(color.withOpacity(0.5)),
          overlayColor: MaterialStateProperty.all(color.withOpacity(0.2)),
          foregroundColor: MaterialStateProperty.all(Colors.red),
          side: MaterialStateProperty.all(
              const BorderSide(color: Colors.black, width: 1))),
      onPressed: () => onPressed(),
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
