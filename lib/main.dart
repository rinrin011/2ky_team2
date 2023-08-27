import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:raisyu/build3.dart';
import 'package:raisyu/class.dart';
import 'package:raisyu/loginform.dart';
import 'package:raisyu/loginpage.dart';
import 'package:raisyu/movingcircles.dart';
import 'package:raisyu/signupform.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Firebaseを使用するために必要な初期化
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


final DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: HexColor('#C7FCFF'),
        body: const StartupPage(),
      ),
      //initialRoute: '/startuppage',
      routes: {
        '/myhomepage': (context) => const MyHomePage(),
        '/startuppage':(context) => const StartupPage(),
        '/build3':  (context) => const Build3(),
        '/class':  (context) => const Class(),
        '/loginpage':  (context) => LoginPage(),
        },
    );
  }
}

class StartupPage extends StatefulWidget {
  const StartupPage({Key? key}) : super(key: key);

  @override
  _StartupPageState createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if(mounted){
        Navigator.pushReplacementNamed(context, '/myhomepage');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MovingCircles(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#C7FCFF'),
      appBar: AppBar(
        title: const Text(
          '見たい号館を選んでね！！' ,
          style: TextStyle(
            color: Color(0xFFFF60C0),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: HexColor('#47D4F3'),
        //backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child : Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              //mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const Positioned(
                    top: 50,
                    right: 40,
                    child: Text(
                        '2号館',
                        style: TextStyle(
                          color: Color(0xFF94ACB1),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                    ),
                ),
                Positioned(
                  top: 40,
                  left:MediaQuery.of(context).size.width*0.3,
                  child: InkWell(
                    onTap: (){
                      
                      Navigator.pushNamed(context, '/build3');
                    },
                    child: Container(
                      // margin: const EdgeInsets.only(top: 15,right:250),
                      child: Image.asset(
                        'img/build3.png',
                        width: 150,
                        height: 224,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  top: 20,
                  right: 130,
                  child: Text(
                    '3号館',
                    style: TextStyle(
                      color: Color(0xFF94ACB1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Positioned(
                    top: 80,
                    right: 20,
                    child: InkWell(
                      onTap: (){
                      },
                      child: Container(
                        //margin: const EdgeInsets.only(top: 40,left:250),
                        child: Image.asset(
                          'img/build2.png',
                          width: 150,
                          height: 224,
                        ),
                      ),
                    ),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height*0.45,
                    child:Text(
                      '1号館 現在工事中',
                      style: TextStyle(
                        color: Color(0xFF94ACB1),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height*0.5,
                    child: Stack(
                      children: [
                        Container(
                          width: 190,
                          height: 70,
                          margin: EdgeInsets.only(left: 85,),
                          padding: EdgeInsets.only(top: 18),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xFFFECAB8),
                                width: 1
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child:Text.rich(
                            TextSpan(
                              children: [
                                WidgetSpan(
                                    child: Image.asset('img/1foot.png',width: 24,)
                                ),
                                const TextSpan(
                                    text: ' があるところが戸締りしてないでちゅよ',
                                    style: TextStyle(
                                    color: Color(0xFFFF60C0),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Image.asset('img/cat.png',width: 90,),
                      ],
                    )
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height*0.6,
                  right: 45,
                  child: const Text(
                    '4号館',
                    style: TextStyle(
                      color: Color(0xFF94ACB1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Positioned(
                    bottom: MediaQuery.of(context).size.height*0.08,
                    right: 0,
                    child: InkWell(
                      onTap: (){
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 15,left:250),
                        child: Image.asset(
                          'img/build4.png',
                          width: 150,
                          height: 224,
                        ),
                      ),
                    ),
                )
              ],
            ),
          )
      ),
      bottomNavigationBar: BottomAppBar(
        color: HexColor('#47D4F3'),
        //color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed:(){
                  Navigator.pushNamed(context, '/myhomepage');
                },
                icon: const ImageIcon(
                  AssetImage('img/home.png'),
                  size: 24,
                )
            )
          ],
        ),
      ),
    );
  }
}

