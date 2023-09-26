import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/src/settings/settings_controller.dart';

class AppColors {
  bool isDarkMode = false;
  static final AppColors _instance = AppColors._internal();
  AppColors._internal();
  factory AppColors(WidgetRef ref) {
    switch (ref.watch(settingsProvider).isDarkMode) {
      case true:
        _instance.isDarkMode = true;
        break;
      case false:
        _instance.isDarkMode = false;
        break;
      default:
    }
    return _instance;
  }
  Color get primary => isDarkMode ? const Color(0xFF16171C) : Colors.white;
  Color get reversePrimary =>
      isDarkMode ? Colors.white : const Color(0xff1C1E23);
  Color white = Colors.white;
  Color get bgColor =>
      isDarkMode ? const Color(0xFF16171C) : const Color(0xFFF7F6F6);
  Color get grey => reversePrimary.withOpacity(0.1);
  Color get boxFill =>
      isDarkMode ? const Color(0xFF101116) : const Color(0xFFF8F8F9);
  Color get boxStrokeColor =>
      isDarkMode ? const Color(0xff24272F) : const Color(0xFFEAEDF4);
  Color accent = const Color(0xFF543DBC);
}
