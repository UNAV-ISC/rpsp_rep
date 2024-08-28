import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromARGB(255, 29, 36, 40);
const kSecondaryColor = Color.fromARGB(255, 20, 24, 27);
const scaffoldBackgroundColor = Color.fromARGB(255, 29, 36, 40);
const kContentColorDarkTheme = Color.fromARGB(255, 255, 255, 255);
const kWarninngColor = Color.fromARGB(255, 248, 207, 88);
const kErrorColor = Color.fromARGB(255, 255, 89, 99);

const kDefaultPadding = 20.0;

const kSplashColor = Color(0xFF3E6F89);

ThemeData themeDark() {
  // Bydefault flutter provie us light and dark theme
  // we just modify it as our need
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    cardTheme: const CardTheme(color: kSecondaryColor),
    appBarTheme: appBarTheme,
    iconTheme: const IconThemeData(color: kContentColorDarkTheme),
    textTheme:
        const TextTheme(bodyLarge: TextStyle(color: kContentColorDarkTheme)),
    splashColor: kSplashColor,
    /*textTheme:
         Theme.of(context).textTheme.apply(bodyColor: kContentColorDarkTheme),*/
    colorScheme: const ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: const Color.fromARGB(255, 20, 24, 27),
      selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
      unselectedItemColor: kContentColorDarkTheme.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}

final appBarTheme = const AppBarTheme(
  iconTheme: IconThemeData(color: kContentColorDarkTheme),
  actionsIconTheme: IconThemeData(color: kContentColorDarkTheme),
);
