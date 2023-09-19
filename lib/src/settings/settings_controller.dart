import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsController with ChangeNotifier {
  static final _instance = SettingsController._();
  SettingsController._();
  factory SettingsController() => _instance;

  bool isDarkMode = true;
  toggleDarkMode({bool? val}) {
    if (val != null) {
      isDarkMode = val;
      notifyListeners();
      return;
    }
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}

final settingsProvider =
    ChangeNotifierProvider<SettingsController>((ref) => SettingsController());
