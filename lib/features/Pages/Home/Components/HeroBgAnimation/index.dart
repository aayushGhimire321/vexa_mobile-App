import 'package:flutter/material.dart';

class HeroBgAnimation extends StatelessWidget {
  const HeroBgAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 500,
      child: CustomPaint(
        painter: HeroBgPainter(),
      ),
    );
  }
}

class HeroBgPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Paint properties for gradients
    final paint0 = Paint()
      ..shader = RadialGradient(
        colors: [Color(0xFFFBFBFB), Colors.white.withOpacity(0)],
        stops: [0.333, 1.0],
      ).createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2));

    final paint1 = Paint()
      ..shader = RadialGradient(
        colors: [Color(0xFFFBFBFB), Colors.white.withOpacity(0)],
        stops: [0.333, 1.0],
      ).createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2));

    final paint2 = Paint()
      ..shader = RadialGradient(
        colors: [Color(0xFFFBFBFB), Colors.white.withOpacity(0)],
        stops: [0.333, 1.0],
      ).createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2));

    final paint3 = Paint()
      ..shader = LinearGradient(
        colors: [Color(0xFF945DD6), Color(0xFF945DD6).withOpacity(0)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromPoints(Offset(295, 193), Offset(269, 218)));

    // Example paths
    final path0 = Path()
      ..moveTo(size.width * 0.4, size.height * 0.2)
      ..lineTo(size.width * 0.6, size.height * 0.6)
      ..close();
    canvas.drawPath(path0, paint0);

    final path1 = Path()
      ..moveTo(size.width * 0.7, size.height * 0.4)
      ..lineTo(size.width * 0.3, size.height * 0.8)
      ..close();
    canvas.drawPath(path1, paint1);

    final path2 = Path()
      ..moveTo(size.width * 0.5, size.height * 0.5)
      ..lineTo(size.width * 0.9, size.height * 0.1)
      ..close();
    canvas.drawPath(path2, paint2);

    final ellipsePaint = Paint()..color = Color(0xFF945DD6);
    canvas.drawOval(Rect.fromCircle(center: Offset(200, 200), radius: 10), ellipsePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
