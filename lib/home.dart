import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/myThemeData.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:islami/taps/hadethTap.dart';
import 'package:islami/taps/settingsTap.dart';
import 'package:provider/provider.dart';

import 'taps/quranTap.dart';
import 'taps/radioTap.dart';
import 'taps/sebhaTap.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Stack(children: [
      Image.asset(pro.modeApp == ThemeMode.light
          ? "assets/images/default_bg.png"
          : "assets/images/bg.png"),
      Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.appTitle,
            style: pro.modeApp == ThemeMode.light
                ? Theme.of(context).textTheme.bodyLarge
                : Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white),
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
              label: AppLocalizations.of(context)!.quran,
              backgroundColor: pro.modeApp == ThemeMode.light
                  ? MyThemeData.primaryColor
                  : MyThemeData.darkPrimaryColor,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/icon_sebha.png"),
              ),
              label: AppLocalizations.of(context)!.sebha,
              backgroundColor: pro.modeApp == ThemeMode.light
                  ? MyThemeData.primaryColor
                  : MyThemeData.darkPrimaryColor,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")),
              label: AppLocalizations.of(context)!.ahadeth,
              backgroundColor: pro.modeApp == ThemeMode.light
                  ? MyThemeData.primaryColor
                  : MyThemeData.darkPrimaryColor,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),
              label: AppLocalizations.of(context)!.radio,
              backgroundColor: pro.modeApp == ThemeMode.light
                  ? MyThemeData.primaryColor
                  : MyThemeData.darkPrimaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: AppLocalizations.of(context)!.settings,
              backgroundColor: pro.modeApp == ThemeMode.light
                  ? MyThemeData.primaryColor
                  : MyThemeData.darkPrimaryColor,
            ),
          ],
        ),
        body: taps[index],
      ),
    ]);
  }

  List<Widget> taps = [
    QuranTap(),
    SebhaTap(),
    HadethTap(),
    RadioTap(),
    SettingTap(),
  ];
}
