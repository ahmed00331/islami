import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = "en";

  ThemeMode modeApp = ThemeMode.light;

  void changeLanguage(String langCode) {
    languageCode = langCode;
    notifyListeners();
  }

  changeTheme(ThemeMode mode) {
    modeApp = mode;
    notifyListeners();
  }
}
