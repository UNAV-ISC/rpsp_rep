import 'package:flutter/material.dart';

ThemeData themeLight() {
  return ThemeData(
    //Colores

    canvasColor: Colors.grey.shade200,
    cardColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: const Color(0xFF023246), // //  Color(0xFF3E6F89)
    primaryColorLight: const Color(0xFF023246),
    hintColor: const Color(0xff9D9D9D), //COlor opaco
    scaffoldBackgroundColor: const Color(0xffF1F4F9),
    shadowColor: const Color(0xff023246),
    indicatorColor: const Color(0xFF3E6F89),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontSize: 15),
    ),

    // //accentColor: Colors.white, //Color(0xff5692FF),
    // errorColor: Color(0xffE94040),

    //AppBar
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      //color: Colors.black,
      actionsIconTheme: IconThemeData(color: Colors.white),

      /////////////////////////
      // textTheme: TextTheme(
      //   headline6:
      //       TextStyle(color: Colors.white, fontSize: 20), //Letra blanca
      // )
    ),
    colorScheme: const ColorScheme.light(background: Colors.white),

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
