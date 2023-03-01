import 'package:flutter/material.dart';
import 'app_colors.dart';

var sizeOptionList = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
var opacityOptionList = [1, 20, 40, 60, 80, 100];

// var animalList = [
//   AnimalOption(id: 0, animalName: 'Wolf', color: kColorRed),
//   AnimalOption(id: 1, animalName: 'Wolf', color: kColorPink),
//   AnimalOption(id: 2, animalName: 'Cat', color: kColorIndigo),
//   AnimalOption(id: 3, animalName: 'Cat', color: kColorPurple),
//   AnimalOption(id: 4, animalName: 'Penguin', color: kColorBlue),
//   AnimalOption(id: 5, animalName: 'Penguin', color: kColorGrey),
//   AnimalOption(id: 6, animalName: 'Koala', color: kColorYellow),
//   AnimalOption(id: 7, animalName: 'Koala', color: kColorTeal),
//   AnimalOption(id: 8, animalName: 'Leopard', color: kColorGreen),
//   AnimalOption(id: 9, animalName: 'Leopard', color: kColorLime),
// ];

var themeData = ThemeData(
  primaryColor: kPrimaryColor,
  backgroundColor: kBackgroundColor,
  textTheme: TextTheme(
    headline1: TextStyle(
        color: kPrimaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial'),
    headline2: TextStyle(
        color: kDarkGreyColor,
        fontSize: 19,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial'),
    bodyText1:
        TextStyle(color: kBodyTextGreyColor, fontSize: 14, fontFamily: 'Arial'),
    bodyText2:
        TextStyle(color: kPrimaryColor, fontSize: 12, fontFamily: 'Arial'),
    subtitle1: TextStyle(
        color: kPrimaryColor,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial'),
    button: TextStyle(
        color: kWhiteColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial'),
  ),
);
