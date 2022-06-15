import 'package:flutter/material.dart';

class ProjectLightTheme {
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.red.shade200,
      appBarTheme: _appbarTheme,
      cardTheme: _cardTheme,
      dividerColor: Colors.white54,
      progressIndicatorTheme: _progressIndicatorTheme,
      bottomNavigationBarTheme: _bottomNavigationBarTheme,
      tabBarTheme: _tabBarTheme,
    );
  }

  static TabBarTheme get _tabBarTheme {
    return TabBarTheme(
      indicator:
          BoxDecoration(color: Colors.indigo.shade200, shape: BoxShape.circle),
    );
  }

  static BottomNavigationBarThemeData get _bottomNavigationBarTheme {
    return BottomNavigationBarThemeData(
      backgroundColor: Colors.red.shade100,
    );
  }

  static ProgressIndicatorThemeData get _progressIndicatorTheme =>
      ProgressIndicatorThemeData(color: Colors.deepOrange.shade800);

  static AppBarTheme get _appbarTheme {
    return AppBarTheme(
      centerTitle: true,
      color: Colors.red.shade900,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
    );
  }

  static CardTheme get _cardTheme {
    return CardTheme(
      color: Colors.red.shade300,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 5,
    );
  }
}
