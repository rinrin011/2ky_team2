import 'package:flutter/material.dart';
import 'package:raisyu/bodywidget2.dart';
import 'package:raisyu/build3.dart';
import 'hexcolor.dart';
import 'bodywidget.dart';
import 'package:firebase_database/firebase_database.dart';

final DatabaseReference databaseReference = FirebaseDatabase.instance.reference();



// _ClassStateクラスのインスタンスを返すcreateStateメソッドをオーバーライド
class Class extends StatefulWidget {
  const Class({Key? key}) : super(key: key);

  @override
  State<Class> createState() => _ClassState();
}

// Class クラスの状態を管理し、ウィジェットツリーを構築
class _ClassState extends State<Class> {

  // 教室の部屋番号が格納
  List<int>numbers = [3601,3602];

  // 現在の部屋番号のインデックスを示す変数。初期値はBuild3.currentPosition
  int currentPosition = Build3.currentPosition;

  bool isLocked = false; // 初期状態はfalse（ロックが開いている状態）

  // NextBackPage ウィジェットから部屋番号を更新するために使用されます。
  void updatePosition(int position){
    setState(() {
      currentPosition = position;
    });
  }

  // ウィジェットの外観を構築し、表示します
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#C7FCFF'),
      appBar: AppBar(
        title: const Text(
          '3号館 : 6階',
          style: TextStyle(
            color: Color(0xFFFF60C0),
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        backgroundColor: HexColor('#47D4F3'),
        centerTitle: true,

        //ドアを開け閉めするための鍵
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.01),
            child: InkWell(
                onTap: () {
                  setState(() {
                    isLocked = !isLocked; // 現在の状態を反転させる（falseならtrueに、trueならfalseに切り替わる）
                });
                
                },
                child: Image.asset('img/open_lock.png',width: 35,color: isLocked ? Colors.red : Colors.green)
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top:30),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '教室の部屋番号 : ${numbers[currentPosition]}',
                style: const TextStyle(
                  color: Color(0xFFFF60C0),
                  fontWeight:FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Container(
                width: 400,
                height: 300,
                padding: EdgeInsets.only(top: 50),
                alignment: Alignment.center,
                child: Visibility(
                  visible: currentPosition == 0,
                  child: BodyWidget(),
                  replacement: BodyWidget2(),
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.only(top: 13,left:80 ),
                      child: Image.asset('img/1foot.png',width: 30,)
                  ),

                  //窓が閉めたら文字が変わる
                  Container(
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.only(top:14),
                    child: const Text(
                      '開いてまちゅよ',
                      style: TextStyle(
                        color: Color(0xFFFF60C0),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),

                  //イメージが変わる
                  Image.asset('img/cat.png',width: 90,),
                ],
              ),
              // const SizedBox(height: 3,),
              Container(
                height: 100,
                color: Color(0xFFC7F5FF),
                // padding: const EdgeInsets.only(left: 40,right: 40),
                child: NextBackPage(onPositionChanged: updatePosition,),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: HexColor('#47D4F3'),
        //color: Colors.blue,
        child: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.45),
                child: IconButton(
                    onPressed:(){
                      Navigator.pushNamed(context, '/myhomepage');
                    },
                    icon: const ImageIcon(
                      AssetImage('img/home.png'),
                      size: 24,
                    )
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.35),
                child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text(
                            '説明書',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF47D4F3),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: '・',
                                  children: [
                                    WidgetSpan(
                                        child: Image.asset('img/open_lock.png',width: 20,)
                                    ),
                                    const TextSpan(
                                        text: 'を押すとこの部屋の窓、ドアの鍵を閉めれます。',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        )
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.start,
                              ),
                              Text.rich(
                                TextSpan(
                                  text: '・',
                                  children: [
                                    WidgetSpan(
                                        child: Image.asset('img/close_lock.png',width: 20,)
                                    ),
                                    const TextSpan(
                                        text: 'の時は窓、ドアの鍵が閉待っている証拠なので押しても何もありません。',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        )
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.start,
                              ),
                              Text.rich(
                                TextSpan(
                                  text: '・',
                                  children: [
                                    WidgetSpan(
                                        child: Image.asset('img/1foot.png',width: 20,)
                                    ),
                                    const TextSpan(
                                        text: 'があるところが窓、ドアが開いています。',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        )
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.start,
                              ),
                              Text.rich(
                                TextSpan(
                                  text: '・',
                                  children: [
                                    WidgetSpan(
                                        child: Image.asset('img/back.png',width: 15,)
                                    ),
                                    WidgetSpan(
                                        child: Image.asset('img/next.png',width: 15,)
                                    ),
                                    const TextSpan(
                                        text: '横に書いてある部屋番号に移動できます。',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        )
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('閉じる'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const ImageIcon(
                      AssetImage('img/help.png',),
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class NextBackPage extends StatefulWidget {

  late final Function(int) onPositionChanged;
  NextBackPage({required this.onPositionChanged});

  @override
  _NextBackPageState createState() => _NextBackPageState();
}

class _NextBackPageState extends State<NextBackPage> {
  List<int> numbers = [3601, 3602];
  int currentPosition = Build3.currentPosition;

  void goToNextNumber() {
    setState(() {
      currentPosition = (currentPosition + 1) % numbers.length;
    });
    widget.onPositionChanged(currentPosition);
  }

  void goToPreviousNumber() {
    setState(() {
      currentPosition = (currentPosition - 1 + numbers.length) % numbers.length;
    });
    widget.onPositionChanged(currentPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: HexColor('#C7FCFF'),
        child: Center(
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 16.0),
              InkWell(
                onTap: (currentPosition > 0) ? goToPreviousNumber : null,
                child: Image.asset(
                  'img/back.png',
                  width: 40,
                  fit: BoxFit.contain,
                    color: (currentPosition > 0)
                          ? const Color(0xFFD693FF)
                          : Colors.white,
                ),
              ),
              const SizedBox(width: 40,),
              Flexible(
                  child: Text(
                    '${numbers[currentPosition]}',
                    style: const TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold,color: Color(0xFFFF60C0),),
                    textAlign: TextAlign.center,
                  ),
              ),
              SizedBox(width: 10.0),
              Text(
                '${numbers[(currentPosition + 1) % numbers.length]}',
                style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.bold,color: Color(0xFFFFAADD)),
              ),
              SizedBox(width: 10.0),
              InkWell(
                onTap: (currentPosition < numbers.length - 1) ? goToNextNumber : null,
                child: Image.asset(
                  'img/next.png',
                  width: 40,
                  fit: BoxFit.contain,
                    color: (currentPosition < numbers.length - 1)
                          ? const Color(0xFFD693FF)
                          : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
