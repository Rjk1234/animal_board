import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class CustomButtonShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.6808521);
    path_0.cubicTo(0, size.height * 0.6676812, 0, size.height * 0.6610958,
        size.width * 0.00002845752, size.height * 0.6555271);
    path_0.cubicTo(
        size.width * 0.001865146,
        size.height * 0.2960583,
        size.width * 0.09051465,
        size.height * 0.006100583,
        size.width * 0.2004159,
        size.height * 0.00009307979);
    path_0.cubicTo(size.width * 0.2021185, 0, size.width * 0.2041318, 0,
        size.width * 0.2081586, 0);
    path_0.lineTo(size.width * 0.7918408, 0);
    path_0.cubicTo(size.width * 0.7958662, 0, size.width * 0.7978790, 0,
        size.width * 0.7995860, size.height * 0.00009307979);
    path_0.cubicTo(
        size.width * 0.9094841,
        size.height * 0.006100583,
        size.width * 0.9981338,
        size.height * 0.2960583,
        size.width * 0.9999745,
        size.height * 0.6555271);
    path_0.cubicTo(size.width, size.height * 0.6610958, size.width,
        size.height * 0.6676812, size.width, size.height * 0.6808521);
    path_0.lineTo(size.width, size.height * 0.6808521);
    path_0.cubicTo(
        size.width,
        size.height * 0.6870250,
        size.width,
        size.height * 0.6901104,
        size.width * 0.9999873,
        size.height * 0.6927208);
    path_0.cubicTo(
        size.width * 0.9991274,
        size.height * 0.8612229,
        size.width * 0.9575732,
        size.height * 0.9971396,
        size.width * 0.9060573,
        size.height * 0.9999562);
    path_0.cubicTo(size.width * 0.9052548, size.height, size.width * 0.9043121,
        size.height, size.width * 0.9024268, size.height);
    path_0.lineTo(size.width * 0.09757452, size.height);
    path_0.cubicTo(
        size.width * 0.09568662,
        size.height,
        size.width * 0.09474331,
        size.height,
        size.width * 0.09394522,
        size.height * 0.9999562);
    path_0.cubicTo(
        size.width * 0.04242879,
        size.height * 0.9971396,
        size.width * 0.0008742866,
        size.height * 0.8612229,
        size.width * 0.00001333949,
        size.height * 0.6927208);
    path_0.cubicTo(0, size.height * 0.6901104, 0, size.height * 0.6870250, 0,
        size.height * 0.6808521);
    path_0.lineTo(0, size.height * 0.6808521);
    path_0.close();

    Paint paint0fill = Paint()..style = PaintingStyle.fill;
    paint0fill.shader = ui.Gradient.linear(Offset(size.width * 0.5000000, 0),
        Offset(size.width * 0.5000000, size.height), [
      const Color(0xffA8EF7D).withOpacity(1),
      const Color(0xff44EC87).withOpacity(1)
    ], [
      0,
      1
    ]);
    canvas.drawPath(path_0, paint0fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
