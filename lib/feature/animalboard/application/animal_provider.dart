import 'dart:io';

import 'package:animal_board/config/app_colors.dart';
import 'package:flutter/material.dart';
import '../domain/model/spirit_animal.dart';

class AnimalProvider with ChangeNotifier {
  SpiritAnimal spiritAnimalSquare = SpiritAnimal(
      name: "Your Spirit Animal",
      color: kColorTeal,
      size: 60,
      opacityValue: 0.8);

  void configAnimalSquare(SpiritAnimal square) {
    spiritAnimalSquare.name = square.name;
    spiritAnimalSquare.color = square.color;
    spiritAnimalSquare.size = square.size;
    spiritAnimalSquare.opacityValue = square.opacityValue;
    notifyListeners();
  }

  void setSquareColor(Color color) {
    spiritAnimalSquare.color = color;
    notifyListeners();
  }

  void setSquareOpacity(double opacity) {
    spiritAnimalSquare.opacityValue = opacity;
    notifyListeners();
  }

  void setSquareSize(int size) {
    spiritAnimalSquare.size = size;
    notifyListeners();
  }

  void setSquareAnimal(String name) {
    spiritAnimalSquare.name = name;
    notifyListeners();
  }

  void setAnimalImage(File image) {
    spiritAnimalSquare.image = image;
    notifyListeners();
  }
}
