import 'package:flutter/material.dart';
import 'dart:math' as math;


class BodyWidget extends StatefulWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
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
              left: 0,
              child: DiamondShape487()
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: TrapezoidShape(),
          )
        ],
      ),
    );
  }
}

//492
class SquareShape492 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 61,
      decoration: BoxDecoration(
        color: Color(0xFFC7F5FF),
        border: Border.all(
          color: Color(0xFFC7C7C7),
          width: 1.0,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Container(
              width: 48,
              height: 53,
              decoration: BoxDecoration(
                color: Color(0xFF94D2FF),
                border: Border.all(
                  color: Color(0xFFC7C7C7),
                  width: 1.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//505
class SquareShape505 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 61,
      decoration: BoxDecoration(
        color: Color(0xFFC7F5FF),
        border: Border.all(
          color: Color(0xFFC7C7C7),
          width: 1.0,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Container(
              width: 48,
              height: 53,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFC7C7C7),
                  width: 1.0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        width: 34,
                        color: Color(0xFFC7F5FF),
                      )
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        width: 13,
                        color: Color(0xFF94D2FF),
                      )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


//487
class DiamondShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 103,
      width: 36,
      child: CustomPaint(
        painter: DiamondPainter(),
      ),
    );
  }
}

class DiamondPainter extends CustomPainter {
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
  bool shouldRepaint(DiamondPainter oldDelegate) {
    return false;
  }
}


class DiamondShape487 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 119,
      width: 43,
      child: CustomPaint(
        painter: DiamondPainter487(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 8,
              left: 3,
              child: DiamondShape(),
            ),
          ],
        ),
      ),
    );
  }
}

class DiamondPainter487 extends CustomPainter {
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
  bool shouldRepaint(DiamondPainter487 oldDelegate) {
    return false;
  }
}


//190
class DiamondShape190 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 24,
      child: CustomPaint(
        painter: DiamondPainter190(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top:30,
                left: 7,
                child: Transform.rotate(
                  angle: math.pi / 180 * 9,
                  child: ClipOval(
                    child: Container(
                      width: 2,
                      height: 3,
                      color: Color(0xFFF8FDC4),
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}

class DiamondPainter190 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color(0xFFADDAFB)
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(size.width * 0.4, size.height);
    path.lineTo(size.width, size.height * 0.4);
    path.lineTo(size.width * 0.6, 0);
    path.lineTo(0, size.height * 0.6);
    path.close();

    // Áp dụng hiệu ứng bóng
    var shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.3)
      ..maskFilter = MaskFilter.blur(BlurStyle.outer, 3);

    var borderPaint = Paint()
      ..color = Color(0xFFC7C7C7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    canvas.drawPath(path, borderPaint);

    canvas.drawPath(path, paint);
    canvas.drawPath(path, shadowPaint);

  }

  @override
  bool shouldRepaint(DiamondPainter190 oldDelegate) {
    return false;
  }
}

class DiamondShape2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 119,
      width: 43,
      child: CustomPaint(
        painter: DiamondPainter2(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 8,
              left: 3,
              child: DiamondShape190(),
            ),
          ],
        ),
      ),
    );
  }
}

class DiamondPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color(0xFFC7F5FF)
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(size.width * 0.4, size.height);
    path.lineTo(size.width, size.height *0.4);
    path.lineTo(size.width * 0.6, 0);
    path.lineTo(0, size.height * 0.6);
    path.close();

    canvas.drawPath(path, paint);

    var borderPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(DiamondPainter2 oldDelegate) {
    return false;
  }
}

class TrapezoidShape extends StatelessWidget {
  const TrapezoidShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 360,
        height: 145,
        child: CustomPaint(
          painter: TrapezoidPainter(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 0,
                left: 200,
                child:DiamondShape190(),
              ),
            ],
          ),
        )
    );
  }
}

class TrapezoidPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color(0xFFFFFDC9)
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, size.height); // Điểm bắt đầu
    path.lineTo(size.width * 0.2, 0); // Điểm thứ hai
    path.lineTo(size.width * 0.8, 0); // Điểm thứ ba
    path.lineTo(size.width, size.height); // Điểm thứ tư
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TrapezoidPainter oldDelegate) {
    return false;
  }
}


