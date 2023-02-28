import 'package:flutter/material.dart';

import 'animal_board_shape.dart';

class AnimalBoardCard extends StatefulWidget {
  final double width;
  final double height;
  const AnimalBoardCard({super.key, required this.width, required this.height});

  @override
  State<AnimalBoardCard> createState() => _AnimalBoardCardState();
}

class _AnimalBoardCardState extends State<AnimalBoardCard> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(widget.width, (widget.height * 1.5).toDouble()),
      painter: AnimalBoardShapePainter(),
    );
  }
}
