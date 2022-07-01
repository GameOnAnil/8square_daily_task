import 'package:flutter/material.dart';
import 'package:intern_task_week2/utils/my_colors.dart';

class BackgroundPainterLogin extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final screenWidth = size.width;
    final screenHeight = size.height;

    final paint = Paint()
      ..color = mainBlue.withOpacity(.9)
      ..strokeWidth = 3
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(screenWidth, 0), screenWidth / 2, paint);
    canvas.drawCircle(Offset(0, screenHeight), screenWidth / 3.5, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BackgroundPainterHome extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final screenWidth = size.width;

    final paint = Paint()
      ..color = mainBlue.withOpacity(.9)
      ..strokeWidth = 3
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
        Offset(screenWidth * 1.1, -screenWidth / 2), screenWidth / 1.6, paint);
    // canvas.drawCircle(Offset(0, screenHeight), 100, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BackgroundPainter3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final screenWidth = size.width;

    final paint = Paint()
      ..color = mainBlue.withOpacity(.9)
      ..strokeWidth = 3
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(screenWidth, 0), screenWidth / 2.3, paint);
    // canvas.drawCircle(Offset(0, screenHeight), 100, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
