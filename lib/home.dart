import 'package:flutter/material.dart';
import 'package:islami/hadethTap.dart';
import 'package:islami/myThemeData.dart';
import 'package:islami/quranTap.dart';
import 'package:islami/radioTap.dart';
import 'package:islami/sebhaTap.dart';
import 'package:islami/settingsTap.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset("assets/images/default_bg.png"),
      Scaffold(
        appBar: AppBar(
          title: Text(
            "Islami",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/icon_quran.png")),
              label: "Quraan",
              backgroundColor: MyThemeData.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/icon_sebha.png"),),
              label: "Sebha",
              backgroundColor: MyThemeData.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")),
              label: "Hadeth",
              backgroundColor: MyThemeData.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),
              label: "Radio",
              backgroundColor: MyThemeData.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
              backgroundColor: MyThemeData.primaryColor,
            ),
          ],
        ),
        body: taps[index],
      ),
    ]);
  }
  List <Widget> taps = [
    RadioTap(),SebhaTap(),HadethTap(),QuranTap(),SettingTap(),
  ];
}
