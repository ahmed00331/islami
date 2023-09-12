import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {

  static Color primaryColor = const Color(0xffB7935F);

  static Color blackColor = const Color(0xff242424);

  static ThemeData lightTheme = ThemeData(
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
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.elMessiri(
        fontSize: 25,
        color: const Color(0xffffffff),
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


  static ThemeData darkTheme = ThemeData();
}