// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

// ------------ COLOR Palette ------------

abstract class MyColor {
// Main
  static const Color primary = Color(0xFF01B763);
  static const Color secondary = Color(0xFF335081);

// Alert & Status
  static const Color success = Color(0xFF12D18E);
  static const Color info = Color(0xFF01B763);
  static const Color warning = Color(0xFFFACC15);
  static const Color error = Color(0xFFF75555);
  static const Color disabled = Color(0xFFD8D8D8);
  static const Color disButton = Color(0xFF01924F);

// Greyscale
  static const Color g900 = Color(0xFF212121);
  static const Color g800 = Color(0xFF424242);
  static const Color g700 = Color(0xFF616161);
  static const Color g600 = Color(0xFF757575);
  static const Color g500 = Color(0xFF9E9E9E);
  static const Color g400 = Color(0xFFBDBDBD);
  static const Color g300 = Color(0xFFE0E0E0);
  static const Color g200 = Color(0xFFEEEEEE);
  static const Color g100 = Color(0xFFF5F5F5);
  static const Color g50 = Color(0xFFFAFAFA);

// Dark Colors
  static const Color dark1 = Color(0xFF181A20);
  static const Color dark2 = Color(0xFF1F222A);
  static const Color dark3 = Color(0xFF262A35);
  static const Color dark4 = Color(0xFF35383F);

// Others
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color red = Color(0xFFF44336);
  static const Color pink = Color(0xFFE91E63);
  static const Color purple = Color(0xFF9C27B0);
  static const Color deepPurple = Color(0xFF673AB7);
  static const Color indigo = Color(0xFF3F51B5);
  static const Color blue = Color(0xFF2196F3);
  static const Color lightBlue = Color(0xFF03A9F4);
  static const Color cyan = Color(0xFF00BCD4);
  static const Color teal = Color(0xFF009688);
  static const Color green = Color(0xFF4CAF50);
  static const Color lightGreen = Color(0xFF8BC34A);
  static const Color lime = Color(0xFFCDDC39);
  static const Color yellow = Color(0xFFFFEB3B);
  static const Color amber = Color(0xFFFFC107);
  static const Color orange = Color(0xFFFF9800);
  static const Color deepOrange = Color(0xFFFF5722);
  static const Color brown = Color(0xFF795548);
  static const Color blueGrey = Color(0xFF607D8B);

// Background
  static const Color bgGreen = Color(0xFFECFCF6);
  static const Color bgBlue = Color(0xFFF2F4FF);
  static const Color bgTeal = Color(0xFFEFF9F8);
  static const Color bgBrown = Color(0xFFFBF6F3);
  static const Color bgRed = Color(0xFFFFF4F4);
  static const Color bgYellow = Color(0xFFFFFCEB);
  static const Color bgOrange = Color(0xFFFFF8EE);
  static const Color bgPurple = Color(0xFFF9F8FF);

// Transparent
  static Color trGreen = const Color(0xFF01B763).withOpacity(0.2);
  static Color trBlue = const Color(0xFF4B68FF).withOpacity(0.2);
  static Color trTeal = const Color(0xFF009B8D).withOpacity(0.2);
  static Color trBrown = const Color(0xFFA4634D).withOpacity(0.2);
  static Color trRed = const Color(0xFFF5484A).withOpacity(0.2);
  static Color trYellow = const Color(0xFFFFD300).withOpacity(0.2);
  static Color trOrange = const Color(0xFFF89300).withOpacity(0.2);
  static Color trPurple = const Color(0xFF6949FF).withOpacity(0.2);
}
