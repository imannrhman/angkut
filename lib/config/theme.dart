import 'package:flutter/material.dart';

class ThemeColor {
  static Color primaryColor = Color(0xFF2EC4B6);
  static Color secondaryColor = Color(0xFFCBF3F0);

  static Color secondaryTextColor = Color(0xFFC4C4C4);
  static Color redAccent  = Color(0xFFE34040);
  static Color shadowColor = Color(0xFF1D2020);

}

class ThemeShadow {
  static List<BoxShadow> shadow = [
    BoxShadow(
      spreadRadius: 0,
      blurRadius: 10,
      offset: Offset(0,0),
      color: Color.fromRGBO(29, 32, 32, 0.2),
    ),
  ];
  static List<BoxShadow> shadowForm = [
    BoxShadow(
      spreadRadius: 0,
      blurRadius: 10,
      offset: Offset(0,0),
      color: Color.fromRGBO(29, 32, 32, 0.1),
    ),
  ];
}
