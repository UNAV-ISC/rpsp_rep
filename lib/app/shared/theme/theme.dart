import 'package:flutter/material.dart';
import 'package:rpsp_main/app/shared/theme/theme_dark.dart';

ThemeData themeLight() {
  print('themeLight');
  return ThemeData(
    //canvasColor: const Color.fromARGB(255, 20, 24, 27),
    cardColor: const Color.fromARGB(255, 255, 255, 255),
    brightness: Brightness.light,
    primaryColor: const Color.fromARGB(255, 2, 50, 70), // //  Color(0xFF3E6F89)
    hintColor: const Color.fromARGB(255, 255, 255, 255), //COlor opaco
    scaffoldBackgroundColor: const Color.fromARGB(255, 241, 244, 248),
    shadowColor: const Color.fromARGB(94, 20, 24, 27),
    indicatorColor: const Color.fromARGB(255, 62, 111, 137),
    iconTheme: const IconThemeData(color: Color.fromARGB(255, 87, 99, 108)),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color.fromARGB(255, 20, 24, 27))),
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: scaffoldBackgroundColor),
        actionsIconTheme: IconThemeData(color: scaffoldBackgroundColor)),
    colorScheme: const ColorScheme.light(background: scaffoldBackgroundColor),

    //Botones

    // buttonTheme: ButtonThemeData(
    //   buttonColor: kprimaryColor, // Background color (orange in my case).
    //   textTheme: ButtonTextTheme.accent,
    //   colorScheme: Theme.of(context)
    //       .colorScheme
    //       .copyWith(secondary: Colors.white), // Text color
    // ),
  );
}



















// ThemeData createTheme(Brightness brightness) {
//   var theme = ThemeData(
//     brightness: brightness,
//     applyElevationOverlayColor: true,
//     primaryColor: Colors.blue,
//     primarySwatch: Colors.blue,
//     snackBarTheme: SnackBarThemeData(behavior: SnackBarBehavior.floating),
//   );
//   theme = theme.copyWith(
//     colorScheme: theme.colorScheme
//         .copyWith(onBackground: theme.colorScheme.background.contrastColor),
//     textTheme: theme.textTheme.copyWith(
//       headline6:
//           theme.textTheme.headline6!.copyWith(fontWeight: FontWeight.normal),
//     ),
//     appBarTheme: theme.appBarTheme.copyWith(backwardsCompatibility: false),
//   );

//   // We want to extend Timetable behind the navigation bar.
//   SystemChrome.setSystemUIOverlayStyle(
//     brightness.contrastSystemUiOverlayStyle
//         .copyWith(systemNavigationBarColor: Colors.transparent),
//   );
//   return theme;
// }
