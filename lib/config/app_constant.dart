import 'package:flutter/material.dart';
import 'app_colors.dart';

var sizeOptionList = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
var opacityOptionList = [1, 20, 40, 60, 80, 100];

var themeData = ThemeData(
  primaryColor: kPrimaryColor,
  canvasColor: kBackgroundColor,
  scaffoldBackgroundColor: kBackgroundColor,
  textTheme: TextTheme(
    titleLarge: TextStyle(
        color: kPrimaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial'),
    titleMedium: TextStyle(
        color: kDarkGreyColor,
        fontSize: 19,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial'),
    titleSmall:
        TextStyle(color: kBodyTextGreyColor, fontSize: 14, fontFamily: 'Arial'),
    bodySmall:
        TextStyle(color: kPrimaryColor, fontSize: 12, fontFamily: 'Arial'),
    labelSmall: TextStyle(
        color: kPrimaryColor,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial'),
    labelMedium: TextStyle(
        color: kWhiteColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial'),
  ),
);
