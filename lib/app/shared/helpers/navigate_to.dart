import 'package:flutter/material.dart';

navigateTo(BuildContext context, Widget page) => Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => page,
      ),
    );
