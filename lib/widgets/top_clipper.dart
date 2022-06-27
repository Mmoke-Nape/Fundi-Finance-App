import 'package:flutter/material.dart';

class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();

    path.moveTo(0, size.height);

    path.quadraticBezierTo(
        size.width * .5, size.height * .6, size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
