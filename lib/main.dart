import 'dart:io';

import 'package:flutter/material.dart';

import 'run_my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  /*
  Web için bu komutu kullanın:
  flutter run -d Chrome --web-renderer html
   */
  runApp(RunMyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
