import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/constants/global/images_const.dart';

class LightThemeStyle {
  final lightTextColor = Colors.black;
  final lightThemeImage = MyImages().lightThemeLogo;
  final lightBackgroundColor = Colors.white;
  final textFColor = TobetoColor().iconColor;
}

class DarkThemeStyle {
  final darkTextColor = Colors.white;
  final darkThemeImage = MyImages().darkThemeLogo;
  final darkBackgroundColor = Colors.black;
  final textFColor = Colors.white;
}
