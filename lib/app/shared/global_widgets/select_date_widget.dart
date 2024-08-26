import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectDateWidget extends StatelessWidget {
  final String dateString;
  final void Function(String, DateTime) onChanged;
  final String hint;
  final FormFieldValidator<String>? validator;

  final InputDecoration inputDecoration;

  SelectDateWidget({super.key, 
    required this.dateString,
    required this.hint,
    required this.onChanged,
    this.validator,
    required this.inputDecoration,
  });
  TextEditingController dateinput = TextEditingController();
  final kColor = Colors.black87;
  //text editing controller for text field

  @override
  Widget build(BuildContext context) {
    dateinput.text = dateString;

    return TextFormField(
      controller: dateinput,
      decoration: inputDecoration,
      readOnly: true,
      validator: (value) => validator!(value),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime(1990),
            firstDate: DateTime(1900),
            lastDate: DateTime(2101));

        if (pickedDate != null) {
          String formattedDate = dateToString(pickedDate);
          dateinput.text = formattedDate;
          onChanged(dateinput.text, pickedDate);
        } else {
          print("Date is not selected");
        }
      },
    );
  }
}

dateToString(DateTime date) {
  return '${date.day.toInt() >= 10
          ? date.day.toString()
          : '0${date.day}'}/${date.month.toInt() >= 10
          ? date.month.toString()
          : '0${date.month}'}/${date.year}';
}
