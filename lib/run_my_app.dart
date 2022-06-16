// ignore_for_file: non_constant_identifier_names

import 'package:books_demo/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'common/constants/providers.dart';
import 'common/constants/theme/common_theme_constants.dart';
import 'common/constants/theme/project_dark_theme.dart';
import 'common/constants/theme/project_light_theme.dart';
import 'mvvm/view_models/theme_view_model.dart';

class RunMyApp extends StatelessWidget {
  final _router = AppRouter();
  RunMyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.providers,
      child: Consumer<ThemeViewModel>(
        builder: (context, themeViewModel, child) {
          return MaterialApp.router(
            builder: (context, widget) => ResponsiveWrapper.builder(
                ClampingScrollWrapper.builder(context, widget!),
                breakpoints: [
                  const ResponsiveBreakpoint.autoScale(600, name: TABLET),
                  ResponsiveBreakpoint.resize(CommonThemeConstants.tablet,
                      name: DESKTOP),
                  ResponsiveBreakpoint.autoScale(CommonThemeConstants.bigScreen,
                      name: XL),
                ]),
            routeInformationParser: _router.defaultRouteParser(),
            routerDelegate: _router.delegate(),
            themeMode: themeViewModel.themeMode,
            theme: ProjectLightTheme.theme,
            darkTheme: ProjectDarkTheme.theme,
          );
        },
      ),
    );
  }

  String get XL => 'XL';
}
