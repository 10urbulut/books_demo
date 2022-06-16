import 'package:flutter/material.dart';

class ThemeViewModel extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  set setThemeMode(ThemeMode value) {
    _themeMode = value;
  }

  bool _selectedTheme = false;
  bool get selectedTheme => _selectedTheme;
  set setSelectedTheme(bool value) {
    _selectedTheme = value;
    if (_selectedTheme) {
      setThemeMode = ThemeMode.dark;
    }
    if (!_selectedTheme) {
      setThemeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
