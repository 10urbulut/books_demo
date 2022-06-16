import 'package:books_demo/common/constants/theme/common_theme_constants.dart';
import 'package:flutter/material.dart';

class ProjectDarkTheme {
  static ThemeData get theme {
    return ThemeData.dark().copyWith(
      appBarTheme: _appbarTheme,
      cardTheme: _cardTheme,
    );
  }

  static AppBarTheme get _appbarTheme {
    return AppBarTheme(
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(CommonThemeConstants.appBarCircular),
          bottomRight: Radius.circular(CommonThemeConstants.appBarCircular),
        ),
      ),
      elevation: 5,
    );
  }

  static CardTheme get _cardTheme {
    return CardTheme(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 5,
    );
  }
}
