import 'package:flutter/material.dart';

class NavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();

    path.moveTo(0, size.height * .65);

    path.quadraticBezierTo(
        size.width * .5, size.height + 50, size.width, size.height * .65);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
