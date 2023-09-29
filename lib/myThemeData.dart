import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static Color primaryColor = const Color(0xffB7935F);
  static Color darkPrimaryColor = const Color(0xff141A2E);
  static Color blackColor = const Color(0xff242424);
  static Color accentColor = const Color(0xffC9B497);
  static Color yellowColor = const Color(0xffFACC1D);

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: primaryColor,
        onPrimary: Colors.white,
        secondary: blackColor,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: primaryColor,
        onBackground: Colors.white,
        surface: primaryColor,
        onSurface: Colors.white),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      selectedItemColor: blackColor,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.shifting,
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.elMessiri(
        fontSize: 30,
        color: blackColor,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.elMessiri(
        fontSize: 25,
        color: blackColor,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: GoogleFonts.elMessiri(
        fontSize: 20,
        color: blackColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: blackColor),
      color: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: darkPrimaryColor,
        onPrimary: Colors.white,
        secondary: yellowColor,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: darkPrimaryColor,
        onBackground: Colors.white,
        surface: darkPrimaryColor,
        onSurface: Colors.white),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkPrimaryColor,
      selectedItemColor: yellowColor,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.shifting,
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.elMessiri(
        fontSize: 30,
        color: yellowColor,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.elMessiri(
        fontSize: 25,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: GoogleFonts.elMessiri(
        fontSize: 20,
        color: yellowColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      color: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
    ),
  );
}
