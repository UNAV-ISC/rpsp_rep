import 'package:flutter/material.dart';

// //Para probar-----------------------------
// const kPrimaryColor = Color(0xFF1E1E28);
// const kSecondaryColor = Color(0xFF242430);
// const scaffoldBackgroundColor = Color(0xFF191923);
// const bodyTextColor = Color(0xFF8B8B8D);
// //------------------------------------------

const kPrimaryColor = Color.fromARGB(255, 29, 36, 40);
//Color(0xFF009687);
const kSecondaryColor = Color.fromARGB(255, 20, 24, 27);
const scaffoldBackgroundColor = Color.fromARGB(255, 29, 36, 40);
//Color(0xFF011627);
const kContentColorDarkTheme = Color.fromARGB(255, 255, 255, 255);
const kWarninngColor = Color.fromARGB(255, 248, 207, 88);
const kErrorColor = Color.fromARGB(255, 255, 89, 99);

const kDefaultPadding = 20.0;

const kSplashColor = Color(0xFF3E6F89);

ThemeData darkThemeData() {
  // Bydefault flutter provie us light and dark theme
  // we just modify it as our need
  print("Si Entra a theme dark");
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    cardColor: kPrimaryColor,
    appBarTheme: appBarTheme,
    iconTheme: const IconThemeData(color: kContentColorDarkTheme),
    textTheme:
        TextTheme(bodyLarge: TextStyle(color: Colors.white.withOpacity(0.8))),
    splashColor: Colors.red,
    /*textTheme:
         Theme.of(context).textTheme.apply(bodyColor: kContentColorDarkTheme),*/
    colorScheme: ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      selectedItemColor: Colors.white70,
      unselectedItemColor: kContentColorDarkTheme.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}

final appBarTheme = AppBarTheme(
  iconTheme: IconThemeData(color: Colors.white.withOpacity(0.9)),
  //color: Colors.black,
  actionsIconTheme: IconThemeData(color: Colors.white.withOpacity(0.9)),

  ///////////////
  //textTheme: TextTheme(
  // headline6: TextStyle(
  //     color: Colors.white.withOpacity(0.9), fontSize: 20), //Letra blanca
  // ),
);
