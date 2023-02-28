import 'package:flutter/material.dart';
import '../data/model.dart';

var sizeOptionList = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
var opacityOptionList = [1, 20, 40, 60, 80, 100];

var alarmAudioPath = "Sound-sci-fi.wav";
String placeholderAnimalImagePath = "";

String headerTitleText = "Animal Board";
String headerSubTitleText = "Your animal choices";
String animalBoardTitle = 'Your Animal Square';
String animalBoardSubTitle = 'for last month';
String pickAnimalButtonTitle = 'Pick Animal';

var animalList = const [
  AnimalOption(id: 0, animalName: 'Wolf', color: Colors.red),
  AnimalOption(id: 1, animalName: 'Wolf', color: Colors.pink),
  AnimalOption(id: 2, animalName: 'Cat', color: Colors.indigo),
  AnimalOption(id: 3, animalName: 'Cat', color: Colors.purple),
  AnimalOption(id: 4, animalName: 'Penguin', color: Colors.blue),
  AnimalOption(id: 5, animalName: 'Penguin', color: Colors.grey),
  AnimalOption(id: 6, animalName: 'Koala', color: Colors.yellow),
  AnimalOption(id: 7, animalName: 'Koala', color: Colors.teal),
  AnimalOption(id: 8, animalName: 'Leopard', color: Colors.green),
  AnimalOption(id: 9, animalName: 'Leopard', color: Colors.lime),
];

var themeData = ThemeData(
  primaryColor: const Color(0xff20d257),
  backgroundColor: const Color(0xfff4f5fb),
  textTheme: const TextTheme(
    headline1: TextStyle(
        color: Color(0xff20d257),
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial'),
    headline2: TextStyle(
        color: Color.fromARGB(255, 60, 60, 60),
        fontSize: 19,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial'),
    bodyText1:
        TextStyle(color: Color(0xffa0a8b4), fontSize: 14, fontFamily: 'Arial'),
    bodyText2:
        TextStyle(color: Color(0xff20d257), fontSize: 12, fontFamily: 'Arial'),
    subtitle1: TextStyle(
        color: Color(0xff20d257),
        fontSize: 12,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial'),
    button: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial'),
  ),
);
