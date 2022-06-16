import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/common_theme_constants.dart';

class ProjectLightTheme {
  static ThemeData get theme {
    return ThemeData(
      splashColor: Colors.amber,
      scaffoldBackgroundColor: Colors.red.shade200,
      appBarTheme: _appbarTheme,
      listTileTheme: _listTileThemeData,
      cardTheme: _cardTheme,
      tooltipTheme: _tooltipTheme,
      dividerColor: Colors.white54,
      progressIndicatorTheme: _progressIndicatorTheme,
      bottomNavigationBarTheme: _bottomNavigationBarTheme,
      tabBarTheme: _tabBarTheme,
      focusColor: Colors.white,
    );
  }

  static TooltipThemeData get _tooltipTheme {
    return TooltipThemeData(
      decoration: BoxDecoration(
        color: Colors.orange.shade700,
        borderRadius:
            BorderRadius.circular(CommonThemeConstants.generalCircular),
      ),
    );
  }

  static ListTileThemeData get _listTileThemeData {
    return ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(CommonThemeConstants.generalCircular),
      ),
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
      scrolledUnderElevation: 15,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      centerTitle: true,
      color: Colors.red.shade900,
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
      color: Colors.red.shade300,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 5,
    );
  }
}
