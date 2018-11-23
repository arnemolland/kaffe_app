import 'package:flutter/material.dart';

class LaunchArcPainter extends CustomPainter {
  Color startColor;
  Color endColor;
  Color surfaceColor;
  bool paintBackdrop;
  double radius;
  LaunchArcPainter(
      {this.startColor, this.endColor, this.surfaceColor, this.radius, this.paintBackdrop});

  @override
  void paint(Canvas canvas, Size size) {
    Offset bottom = Offset(size.width / 2, size.height * 1.35);
    Rect rect = new Rect.fromCircle(center: bottom, radius: radius);

    Offset coffeeCenter = Offset(size.width / 2, size.height / 3);

    final Gradient gradient = new LinearGradient(
      colors: <Color>[startColor.withOpacity(0.9), endColor.withOpacity(0.9)],
      stops: [0.0, 1.0],
    );
    Paint surface = new Paint()
      ..style = PaintingStyle.fill
      ..shader = gradient.createShader(rect);

    Paint backdrop = new Paint()
      ..style = PaintingStyle.fill
      ..color = surfaceColor.withOpacity(0.1);

    Paint backdropShadow = new Paint()
      ..style = PaintingStyle.fill
      ..color = surfaceColor.withOpacity(0.05);

    Paint backgroundShadow = new Paint()
      ..style = PaintingStyle.fill
      ..color = surfaceColor.withOpacity(0.025);

    canvas.drawCircle(bottom, radius, surface);
    if(paintBackdrop) {
    canvas.drawCircle(coffeeCenter, 100, backdrop);
    canvas.drawCircle(coffeeCenter, 125, backdropShadow);
    canvas.drawCircle(coffeeCenter, 175, backgroundShadow);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}