import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  late final SharedPreferences prefs;

  void init() async {
    prefs = await SharedPreferences.getInstance();
    languageCode = prefs.getString("language") ?? 'en';
    bool theme = prefs.getBool("theme") ?? false;
    if (theme) {
      modeApp = ThemeMode.dark;
    } else {
      modeApp = ThemeMode.light;
    }
  }

  String languageCode = "en";

  ThemeMode modeApp = ThemeMode.light;

  void changeLanguage(String langCode) async {
    languageCode = langCode;
    await prefs.setString("language", langCode);
    notifyListeners();
  }

  void changeTheme(ThemeMode mode) async {
    modeApp = mode;
    await prefs.setBool("theme", mode == ThemeMode.dark ? true : false);
    notifyListeners();
  }

  String getBackground() {
    if (modeApp == ThemeMode.light) {
      return "assets/images/default_bg.png";
    } else {
      return "assets/images/bg.png";
    }
  }
}
