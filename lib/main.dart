import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/app.dart';
import 'src/settings/settings_controller.dart';

void main() async {
  final settingsController = SettingsController();
  HttpOverrides.global = MyHttpOverrides();
  runApp(ProviderScope(child: MyApp(settingsController: settingsController)));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
