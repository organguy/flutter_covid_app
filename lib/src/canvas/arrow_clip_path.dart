import 'package:flutter/cupertino.dart';

enum ArrowDirection { UP, MIDDLE, DOWN}

class ArrowClipPath extends CustomClipper<Path>{

  final ArrowDirection direction;

  ArrowClipPath({required this.direction});

  @override
  Path getClip(Size size) {
    var path = Path();

    switch(direction){
      case ArrowDirection.UP:
        path.moveTo(0, size.height);
        path.lineTo(size.width * 0.5, 0);
        path.lineTo(size.width, size.height);
        break;
      case ArrowDirection.MIDDLE:
        path.moveTo(0, size.height * 0.4);
        path.lineTo(size.width, size.height * 0.4);
        path.lineTo(size.width, size.height * 0.6);
        path.lineTo(0, size.height * 0.6);
        break;
      case ArrowDirection.DOWN:
        path.moveTo(0, 0);
        path.lineTo(size.width * 0.5, size.width);
        path.lineTo(size.width, 0);
        break;
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

}