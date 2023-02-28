
import 'dart:io';

import 'package:flutter/material.dart';

class AnimalOption {
  final int id;
  final String animalName;
  final Color color;
  const AnimalOption({
    required this.id,
    required this.animalName,
    required this.color,
  });
}

class SizeOption {
  final int id;
  final String sizeTitle;
  final String sizeValue;
  const SizeOption({
    required this.id,
    required this.sizeTitle,
    required this.sizeValue,
  });
}

class OpacityOption {
  final int id;
  final String opacityTitle;
  final double opacityValue;
  const OpacityOption({
    required this.id,
    required this.opacityTitle,
    required this.opacityValue,
  });
}

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

class TabBarItem {
  int buttonId;
  String buttonTitle;
  IconData buttonIcon;
  TabBarItem({
    required this.buttonId,
    required this.buttonTitle,
    required this.buttonIcon,
  });
}
