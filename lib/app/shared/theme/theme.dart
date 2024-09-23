import 'package:flutter/material.dart';
import 'package:rpsp_main/app/shared/theme/theme_dark.dart';

ThemeData themeLight() {
  return ThemeData.light().copyWith(
      canvasColor: const Color.fromARGB(255, 20, 24, 27),
      cardColor: const Color.fromARGB(255, 255, 255, 255),
      brightness: Brightness.light,
      primaryColor: const Color.fromARGB(255, 29, 36, 40),
      secondaryHeaderColor: const Color.fromARGB(255, 87, 99, 108),
      hintColor: const Color.fromARGB(255, 255, 255, 255), //COlor opaco
      scaffoldBackgroundColor: const Color.fromARGB(255, 226, 229, 233),
      indicatorColor: const Color.fromARGB(255, 62, 111, 137),
      iconTheme: const IconThemeData(color: Color.fromARGB(255, 87, 99, 108)),
      splashColor: const Color.fromARGB(255, 20, 24, 27),
      primaryTextTheme: const TextTheme(
        titleLarge: TextStyle(color: Color.fromARGB(255, 87, 99, 108)),
        titleMedium: TextStyle(color: Color.fromARGB(255, 87, 99, 108)),
        titleSmall: TextStyle(color: Color.fromARGB(255, 87, 99, 108)),
        bodyLarge: TextStyle(color: Color.fromARGB(255, 20, 24, 27)),
        bodyMedium: TextStyle(color: Color.fromARGB(255, 20, 24, 27)),
        bodySmall: TextStyle(color: Color.fromARGB(255, 20, 24, 27)),
      ),
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: scaffoldBackgroundColor),
          actionsIconTheme: IconThemeData(color: scaffoldBackgroundColor)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 241, 244, 248),
        selectedItemColor: Color.fromARGB(255, 29, 36, 40),
        unselectedItemColor: Color.fromARGB(255, 87, 99, 108),
        selectedIconTheme:
            IconThemeData(color: Color.fromARGB(255, 29, 36, 40)),
        showUnselectedLabels: true,
      ),
      tabBarTheme: const TabBarTheme(
        indicatorColor: Color.fromARGB(255, 29, 36, 40),
        labelColor: Color.fromARGB(255, 29, 36, 40),
        unselectedLabelColor: Color.fromARGB(255, 87, 99, 108),
      )

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
