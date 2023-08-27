import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:raisyu/bodywidget.dart';


class BodyWidget2 extends StatefulWidget {
  const BodyWidget2({Key? key}) : super(key: key);

  @override
  State<BodyWidget2> createState() => _BodyWidgetState2();
}

class _BodyWidgetState2 extends State<BodyWidget2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 220,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Positioned(
            top: 14,
            left: 83,
            child :Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: SquareShape492(),
                ),
                Container(
                  child: SquareShape492(),
                ),
                const SizedBox(width: 30,),
                Container(
                  child: SquareShape505(),
                ),
              ],
            ),
          ),
          Positioned(
              top:74,
              right: 0,
              child: DiamondShape487_2()
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: TrapezoidShape(),
          )
        ],
      ),
    );
  }
}

//487_2
class DiamondShape_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 103,
      width: 36,
      child: CustomPaint(
        painter: DiamondPainter_2(),
      ),
    );
  }
}

class DiamondPainter_2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color(0xFF94D2FF)
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(size.width * 0.3, size.height);
    path.lineTo(size.width, size.height *0.5);
    path.lineTo(size.width * 0.7, 0);
    path.lineTo(0, size.height * 0.5);
    path.close();

    canvas.drawPath(path, paint);

    var borderPaint = Paint()
      ..color = Color(0xFFC7C7C7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(DiamondPainter_2 oldDelegate) {
    return false;
  }
}


class DiamondShape487_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -13 * math.pi / 180,
      child: Container(
        height: 119,
        width: 43,
        child: CustomPaint(
          painter: DiamondPainter487_2(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 8,
                left: 3,
                child: DiamondShape_2(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DiamondPainter487_2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color(0xFFC7F5FF)
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(size.width * 0.3, size.height);
    path.lineTo(size.width, size.height *0.5);
    path.lineTo(size.width * 0.7, 0);
    path.lineTo(0, size.height * 0.5);
    path.close();

    canvas.drawPath(path, paint);

    var borderPaint = Paint()
      ..color = Color(0xFFC7C7C7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(DiamondPainter487_2 oldDelegate) {
    return false;
  }
}