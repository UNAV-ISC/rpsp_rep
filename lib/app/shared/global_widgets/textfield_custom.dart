import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class TextFieldCustom extends StatefulWidget {
  final TextEditingController controller;
  final TextStyle styleText;
  final String hintText;
  final TextStyle styleHintText;
  final String? textValidation;
  final TextInputType textInputType;
  final bool password;

  Color colorIcon;
  final bool capitalization;
  final Function? onChanged;
  final FormFieldValidator<String>? validator;
  final bool colorNormal;
  final Color backgroundColor;

  final double borderRadius;

  TextFieldCustom({super.key, 
    required this.controller,
    required this.hintText,
    this.textValidation,
    required this.textInputType,
    this.password = false,
    this.capitalization = false,
    this.onChanged,
    this.colorNormal = true,
    this.validator,
    this.colorIcon = Colors.white,
    this.styleText = const TextStyle(
      fontSize: 17.0,
      // color: Colors.white,
    ),
    this.styleHintText = const TextStyle(color: Colors.black38),
    this.borderRadius = 16.0,
    this.backgroundColor = const Color(0xffE4E7EE),
  });

  @override
  _TextFieldCustomState createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  bool hintPassword = true;

  @override
  Widget build(BuildContext context) {
    // if (widget.colorIcon == Colors.black) {
    //   widget.colorIcon = Colors.white;
    // }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
          controller: widget.controller,
          style: widget.styleText,
          textCapitalization: (widget.capitalization)
              ? TextCapitalization.sentences
              : TextCapitalization.none,
          keyboardType: widget.textInputType,
          obscureText: widget.password ? hintPassword : false,
          decoration: InputDecoration(
            labelStyle: const TextStyle(color: Colors.white),
            filled: true,
            fillColor: widget.backgroundColor,
            hoverColor: Theme.of(context).primaryColor.withOpacity(0.2),
            focusColor: Colors.green,
            // prefixIcon: SizedBox(width: 1),
            hintText: widget.hintText,
            hintStyle: widget.styleHintText,
            // TextStyle(
            //     color: Colors.white.withOpacity(0.9),
            //     fontWeight: FontWeight.w300),
            suffixIcon: widget.password ? buttonShowPassword() : null,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius)),
            contentPadding: const EdgeInsets.only(left: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
          ),
          validator: (value) => widget.validator!(value)),
    );
  }

  buttonShowPassword() {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(4),
        child: Icon(
          hintPassword
              ? FontAwesomeIcons.solidEye
              : FontAwesomeIcons.solidEyeSlash,
          size: 20,
          color: Colors.white,
        ),
      ),
      onTap: () {
        hintPassword = !hintPassword;
        setState(() {});
      },
    );
  }
}
