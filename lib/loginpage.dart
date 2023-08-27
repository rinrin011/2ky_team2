import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:raisyu/loginform.dart';
import 'package:raisyu/signupform.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool showLoginForm = true;

  void toggleForm() {
    setState(() {
      showLoginForm = !showLoginForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          showLoginForm ?  'ログイン' : '新規登録',
          style: const TextStyle(
            color: Color(0xFFFF60C0),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor:const Color(0xFF47D4F3),
        //backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color(0xFFC7FCFF),
          child: Stack(
            children: [
              Container(
                //width: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                height: 230,
                child: CustomPaint(
                  painter: CurvedLinePainter(),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          right: 0,
                          child:Image.asset('img/3foot.png')
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.15,
                  left: MediaQuery.of(context).size.width *0.1,
                  child: Container(
                    width: 285,
                    height: 450,
                    child: Column(
                      children: [
                        showLoginForm ? LoginForm(toggleForm: toggleForm) : SignUpForm(toggleForm: toggleForm),
                      ],
                    ),
                  )
              ),
              Positioned(
                top:  MediaQuery.of(context).size.height*0.9,
                left: MediaQuery.of(context).size.width,
                child: Container(
                  //width: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  height: 230,
                  child: CustomPaint(
                    painter: CurvedLinePainter2(),
                  ),
                ),
              ),
              Positioned(
                  top:MediaQuery.of(context).size.height*0.73,
                  left:0,
                  child:Image.asset('img/catfoot.png')
              ),
              Positioned(
                  top:MediaQuery.of(context).size.height*0.84,
                  left: MediaQuery.of(context).size.width *0.5,
                  child:Text(
                    'Powered by 2ky株式会社',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CurvedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF95ECFF)
      ..style = PaintingStyle.fill;

    final path = Path();

    //Vẽ tam giác
    final startPoint = Offset(0,size.height*0.05);
    path.moveTo(startPoint.dx,startPoint.dy);

    final endPoint = Offset(size.width, size.height);
    final controlPoint = Offset(size.width*0.9,size.height*0.1);

    path.moveTo(startPoint.dx, startPoint.dy);
    path.quadraticBezierTo(
      controlPoint.dx, controlPoint.dy,
      endPoint.dx, endPoint.dy,
    );

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CurvedLinePainter oldDelegate) => false;
}

class CurvedLinePainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF95ECFF)
      ..style = PaintingStyle.fill;
    //..strokeWidth = 2.0;

    final path = Path();

    //Vẽ tam giác
    final startPoint = Offset(0,size.height*0.1);
    path.moveTo(startPoint.dx,startPoint.dy);

    final endPoint = Offset(size.width, size.height);
    final controlPoint = Offset(size.width*0.9,size.height*0.1);

    path.moveTo(startPoint.dx, startPoint.dy);
    path.quadraticBezierTo(
      controlPoint.dx, controlPoint.dy,
      endPoint.dx, endPoint.dy,
    );

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.save(); // Lưu trạng thái ban đầu của Canvas
    canvas.rotate(-180 * math.pi / 180);
    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CurvedLinePainter2 oldDelegate) => false;
}