import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  Locale _appLocale = const Locale('en'); // Default locale

  ThemeMode get themeMode => _themeMode;
  Locale get appLocale => _appLocale;

  void changeTheme(ThemeMode value) {
    _themeMode = value;
    notifyListeners();
  }

  void changeLanguage(Locale newLocale) {
    _appLocale = newLocale;
    notifyListeners();
  }
}
