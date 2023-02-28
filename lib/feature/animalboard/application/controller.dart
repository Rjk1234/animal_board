import 'dart:io';

import 'package:flutter/material.dart';
import '../../../data/api_client.dart';
import '../../../data/model.dart';

class UIThemeDataProvider with ChangeNotifier {
  UIResponseModel? post;
  bool loading = false;

  getPostData() async {
    loading = true;
    post = (await getData())!;
    loading = false;

    notifyListeners();
  }
}

class AnimalProvider with ChangeNotifier {
  SpiritAnimal spiritAnimalSquare = SpiritAnimal(
      animalName: "Your Spirit Animal",
      color: Colors.teal,
      size: 60,
      opacityValue: 0.8);

  void configAnimalSquare(SpiritAnimal square) {
    spiritAnimalSquare.animalName = square.animalName;
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
    spiritAnimalSquare.animalName = name;
    notifyListeners();
  }

  void setAnimalImage(File image) {
    spiritAnimalSquare.animalImage = image;
    notifyListeners();
  }
}
