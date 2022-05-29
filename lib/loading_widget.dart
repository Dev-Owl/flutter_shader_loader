import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_shader_loader/main.dart';

class ShaderSpinner extends StatefulWidget {
  const ShaderSpinner({Key? key}) : super(key: key);

  @override
  State<ShaderSpinner> createState() => _ShaderSpinnerState();
}

class _ShaderSpinnerState extends State<ShaderSpinner> {
  Duration _previous = Duration.zero;
  late final Ticker _ticker;
  double dt = 0;
  @override
  void initState() {
    _ticker = Ticker(_tick);
    _ticker.start();
    super.initState();
  }

  void _tick(Duration timestamp) {
    final durationDelta = timestamp - _previous;

    _previous = timestamp;
    setState(() {
      dt += durationDelta.inMicroseconds / Duration.microsecondsPerSecond;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomPaint(
      painter: ShaderPainter(dt),
      size: size,
    );
  }
}

class ShaderPainter extends CustomPainter {
  double iTime;

  ShaderPainter(this.iTime);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = loadingShader.shader(
        resolution: size,
        iTime: iTime,
      );
    canvas.drawRect(
      Rect.fromLTWH(
        0,
        0,
        size.width,
        size.height,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
