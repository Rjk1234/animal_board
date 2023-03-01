import 'dart:io';
import 'package:flutter/material.dart';

class SpiritAnimal {
  late File? animalImage;
  late int size;
  late String animalName;
  late double opacityValue;
  late Color color;
  SpiritAnimal(
      {required this.size,
      required this.animalName,
      required this.opacityValue,
      required this.color,
      this.animalImage});
}
