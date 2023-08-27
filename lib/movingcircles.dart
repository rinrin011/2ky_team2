import 'package:flutter/material.dart';
import 'dart:math' as math;

class MovingCircles extends StatefulWidget {
  @override
  _MovingCirclesState createState() => _MovingCirclesState();
}

class _MovingCirclesState extends State<MovingCircles>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 30 * math.pi / 180).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
      setState(() {});
    });

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'synky',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize:25,
            color: Color(0xFFFF60C0),
          ),
        ),
        backgroundColor: Color(0xFF47D4F3),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
          child: Container(
            color: const Color(0xFFC7FCFF),
            child: Column(
              children: [
                Container(
                  height: 160,
                  child:Stack(
                    children: [
                      Positioned(
                        top: 40,
                        left: 20,
                        child:CustomPaint(
                          painter:CirclePainter(
                            CircleDataImpl(radius: 50, angle: _animation.value,opacity: 1.0),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 90,
                        left: 30,
                        child:CustomPaint(
                          painter:CirclePainter(
                            CircleDataImpl(radius: 35, angle: _animation.value,opacity: 0.5),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 100,
                        left: 170,
                        child:CustomPaint(
                          painter:CirclePainter(
                            CircleDataImpl(radius: 20, angle: _animation.value,opacity: 1.0),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 300,
                        child: Image.asset('img/catfoot.png'),
                      ),
                      Positioned(
                        top: 20,
                        left: 320,
                        child:CustomPaint(
                          painter:CirclePainter(
                            CircleDataImpl(radius: 35, angle: _animation.value,opacity: 0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 300,
                    padding: const EdgeInsets.only(top: 30),
                    child:Container(
                      width: 350,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF95ECFF),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'お仕事おちゅかれしゃまでちゅ',
                            style: TextStyle(
                                color: Color(0xFFFF60C0),
                                fontSize: 16,fontWeight: FontWeight.bold),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(top:30,left: 50),
                            child: Image.asset('img/logo.png',height: 150,),
                          ),
                          const SizedBox(height: 20,),
                          const Text(
                            'にゃんにゃんにゃんにゃん',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFF60C0),
                            ),
                          )
                        ],
                      ),
                    )
                ),
                Container(
                  height: 300,
                  child:Stack(
                    children: [
                      Positioned(
                        top: 150,
                        left: -50,
                        child:CustomPaint(
                          painter:CirclePainter(
                            CircleDataImpl(radius: 100, angle: _animation.value,opacity: 0.5),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 95,
                        left: 180,
                        child:CustomPaint(
                          painter:CirclePainter(
                            CircleDataImpl(radius: 25, angle: _animation.value,opacity: 1.0),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 90,
                        left: 200,
                        child:CustomPaint(
                          painter:CirclePainter(
                            CircleDataImpl(radius: 25, angle: _animation.value,opacity: 0.5),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 300,
                        child: Image.asset('img/catfoot.png'),
                      ),
                      Positioned(
                        top: 90,
                        left: 350,
                        child:CustomPaint(
                          painter:CirclePainter(
                            CircleDataImpl(radius: 50, angle: _animation.value,opacity: 1.0),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 145,
                          left: MediaQuery.of(context).size.width *0.5,
                          child: const Text(
                            'Powered by 2ky株式会社',
                            style:TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}

abstract class CircleDataInterface {
  double get radius;
  double get angle;
  double get opacity;
}

class CircleDataImpl implements CircleDataInterface {
  final double radius;
  final double angle;
  final double opacity;

  CircleDataImpl({required this.radius,required this.angle,required this.opacity});
}

class CirclePainter extends CustomPainter {
  final CircleDataInterface circle;

  CirclePainter(this.circle);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final circlePaint = Paint()
      ..color = const Color(0xFF95ECFF).withOpacity(circle.opacity)
      ..style = PaintingStyle.fill;

    final movingCircle = Offset(
      center.dx + circle.radius * math.cos(circle.angle),
      center.dy + circle.radius * math.sin(circle.angle),
    );

    canvas.drawCircle(movingCircle, circle.radius, circlePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
