import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromARGB(255, 29, 36, 40);
const kSecondaryColor = Color.fromARGB(255, 20, 24, 27);
const kSecondaryContentColorDarkTheme = Color.fromARGB(255, 149, 161, 172);
const scaffoldBackgroundColor = Color.fromARGB(255, 29, 36, 40);
const kContentColorDarkTheme = Color.fromARGB(255, 255, 255, 255);
const kWarninngColor = Color.fromARGB(255, 248, 207, 88);
const kErrorColor = Color.fromARGB(255, 255, 89, 99);
const kSplashColor = Color.fromARGB(255, 20, 24, 27);

ThemeData themeDark() {
  return ThemeData.dark().copyWith(
      primaryColor: kPrimaryColor,
      primaryColorDark: kSecondaryContentColorDarkTheme,
      secondaryHeaderColor: kContentColorDarkTheme,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      cardTheme: const CardTheme(color: kSecondaryColor),
      appBarTheme: appBarTheme,
      iconTheme: const IconThemeData(color: kSecondaryContentColorDarkTheme),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(color: kContentColorDarkTheme),
          bodyMedium: TextStyle(color: kContentColorDarkTheme)),
      splashColor: kSplashColor,
      // textTheme:
      //      Theme.of(context).textTheme.apply(bodyColor: kContentColorDarkTheme),
      colorScheme: const ColorScheme.dark().copyWith(
          primary: kPrimaryColor,
          secondary: kSecondaryColor,
          error: kErrorColor),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: kPrimaryColor,
          selectedItemColor: kContentColorDarkTheme,
          unselectedItemColor: kSecondaryContentColorDarkTheme,
          selectedIconTheme: IconThemeData(color: kContentColorDarkTheme),
          showUnselectedLabels: true),
      tabBarTheme: const TabBarTheme(
          indicatorColor: kContentColorDarkTheme,
          labelColor: kContentColorDarkTheme,
          unselectedLabelColor: kSecondaryContentColorDarkTheme));
}

const appBarTheme = AppBarTheme(
  iconTheme: IconThemeData(color: kContentColorDarkTheme),
  actionsIconTheme: IconThemeData(color: kContentColorDarkTheme),
);
