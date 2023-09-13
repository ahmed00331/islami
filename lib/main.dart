import 'package:flutter/material.dart';
import 'package:islami/hadeth_details.dart';
import 'package:islami/home.dart';
import 'package:islami/myThemeData.dart';
import 'package:islami/suraDetailes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetails.routeName :(context) => SuraDetails(),
        HadethDetails.routeName:(context) => HadethDetails(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
    );
  }
}
