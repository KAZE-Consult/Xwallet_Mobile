import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../src/settings/settings_controller.dart';

class TextStyles {
  bool isDarkMode = false;
  static final TextStyles _instance = TextStyles._internal();
  TextStyles._internal();
  factory TextStyles(WidgetRef ref) {
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
  TextStyle get largeTitle =>
      const TextStyle(fontWeight: FontWeight.w800, fontSize: 26);
  TextStyle get titleLight => const TextStyle(
      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white);
  TextStyle get bigBody => const TextStyle(fontSize: 18, color: Colors.black);
  TextStyle get smallTitle => TextStyle(
        fontSize: 20,
        color: isDarkMode ? Colors.white : Colors.black,
        fontWeight: FontWeight.bold,
      );
  TextStyle get subtitle => TextStyle(
      fontSize: 14,
      color: isDarkMode
          ? Colors.white.withOpacity(0.8)
          : Colors.black.withOpacity(0.8));
  TextStyle get subtitle2Light =>
      TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7));
  TextStyle get subtitle3 => TextStyle(
      fontSize: 14,
      color: isDarkMode
          ? Colors.white.withOpacity(0.5)
          : Colors.black.withOpacity(0.5));

  TextStyle get bodyLight => const TextStyle(fontSize: 16, color: Colors.white);

  TextStyle get smallSubtitle =>
      TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 13);
  TextStyle get smallHeader => const TextStyle(
      fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black);
  TextStyle get actionText =>
      const TextStyle(fontSize: 17, color: Color(0xffC70C4A));

  TextStyle get body => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: isDarkMode
          ? Colors.white.withOpacity(0.9)
          : Colors.black.withOpacity(0.9));
  TextStyle get bodyBold => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: isDarkMode
          ? Colors.white.withOpacity(0.9)
          : Colors.black.withOpacity(0.9));
  TextStyle get bodyBoldLight => const TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);

  TextStyle get categoryText => TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: isDarkMode ? Colors.white : Colors.black);

  TextStyle get subtitle1 => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.25,
      color: isDarkMode
          ? Colors.white.withOpacity(0.5)
          : Colors.black.withOpacity(0.65));
  TextStyle get subtitle1Light => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.25,
      color: Colors.white.withOpacity(0.65));
  TextStyle get subtitle2 => TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: isDarkMode
          ? Colors.white.withOpacity(0.65)
          : Colors.black.withOpacity(0.65));
  TextStyle get tileSubtitle => TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: isDarkMode
          ? Colors.white.withOpacity(0.9)
          : Colors.black.withOpacity(0.9));
  TextStyle get title => TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: isDarkMode ? Colors.white : const Color(0xff464040));
  TextStyle get largeText => TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w900,
      color: isDarkMode
          ? Colors.white.withOpacity(0.85)
          : const Color(0xff464040));
  TextStyle get headerText => TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: isDarkMode
          ? Colors.white.withOpacity(0.85)
          : const Color(0xff464040));
  TextStyle get tileTitle => TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: isDarkMode ? Colors.white : Colors.black);
  TextStyle get unSelectedTabText => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: isDarkMode
          ? Colors.white.withOpacity(0.5)
          : Colors.black.withOpacity(0.65));
  TextStyle get selectedTabText => const TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffC70C4A));
  TextStyle get unSelectedNavText => TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: isDarkMode
          ? Colors.white.withOpacity(0.75)
          : Colors.black.withOpacity(0.75));
  TextStyle get selectedNavText => const TextStyle(
      fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xffC70C4A));

  TextStyle get smallBody => TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: isDarkMode ? Colors.white : Colors.black);
}

TextStyle get title =>
    const TextStyle(fontSize: 24, fontWeight: FontWeight.w600);
TextStyle get largeTitle =>
    const TextStyle(fontWeight: FontWeight.w800, fontSize: 26);
TextStyle get titleLight => const TextStyle(
    fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white);
TextStyle get body => const TextStyle(fontSize: 16, color: Colors.black);
TextStyle get bigBody => const TextStyle(fontSize: 18, color: Colors.black);
TextStyle get smallTitle => const TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
TextStyle get bodyBold => const TextStyle(
    fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold);
TextStyle get greyedBodyBold => const TextStyle(
    fontSize: 16, color: Colors.black54, fontWeight: FontWeight.bold);
TextStyle get bodyBoldLight => const TextStyle(
    fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold);
TextStyle get subtitle =>
    TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.8));
TextStyle get subtitle2 =>
    TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.5));
TextStyle get subtitle2Light =>
    TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7));
TextStyle get subtitle3 =>
    TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5));

TextStyle get bodyLight => const TextStyle(fontSize: 16, color: Colors.white);
TextStyle get smallSubtitle =>
    TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 13);
TextStyle get smallHeader => const TextStyle(
    fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black);
