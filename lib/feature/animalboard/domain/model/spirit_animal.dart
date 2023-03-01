import 'dart:io';
import 'package:flutter/material.dart';

class SpiritAnimal {
  late File? image;
  late int size;
  late String name;
  late double opacityValue;
  late Color color;
  SpiritAnimal(
      {required this.size,
      required this.name,
      required this.opacityValue,
      required this.color,
      this.image});
}
