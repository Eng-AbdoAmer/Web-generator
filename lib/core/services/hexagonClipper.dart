import 'dart:math';

import 'package:flutter/material.dart';

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = size.width / 2; // Adjust the radius to fit the image

    path.moveTo(centerX + radius * cos(0), centerY + radius * sin(0));
    for (int i = 1; i <= 6; i++) {
      double angle = (i * pi / 3);
      path.lineTo(centerX + radius * cos(angle), centerY + radius * sin(angle));
    }
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
