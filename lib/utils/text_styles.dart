import 'package:flutter/material.dart';

TextStyle get title =>
    const TextStyle(fontSize: 24, fontWeight: FontWeight.w600);
TextStyle get largeTitle =>
    const TextStyle(fontWeight: FontWeight.w800, fontSize: 26);
TextStyle get titleLight => const TextStyle(
    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);
TextStyle get body => const TextStyle(fontSize: 16, color: Colors.black);
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
TextStyle get subtitle3 =>
    TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5));

TextStyle get bodyLight => const TextStyle(fontSize: 16, color: Colors.white);
TextStyle get smallSubtitle =>
    TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 13);
TextStyle get smallHeader => const TextStyle(
    fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black);
