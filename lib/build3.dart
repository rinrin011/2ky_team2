import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:outlined_text/outlined_text.dart';

class Build3 extends StatefulWidget {
  static int currentPosition = 0;
  const Build3({Key? key}) : super(key: key);
  @override
  State<Build3> createState() => _Build3State();
  
}

final DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();
bool doorState = false;
final String doorPath = '3601/dore'; // ドアのデータのパスを指定してください 

class _Build3State extends State<Build3> {
  // bool doorState = false; // ドアの初期状態をfalse（閉まっている）に設定
  
  Future<void> getDoorState() async {
    try {
      DatabaseEvent event = await _databaseReference.child(doorPath).once();
      DataSnapshot snapshot = event.snapshot;

      doorState = snapshot.value as bool? ?? false;
      
      print("現在のドアの状態: $doorState");
    } catch (error) {
      print("ドアの状態の取得中にエラーが発生しました: $error");
    }
  }
  
  @override
  Widget build(BuildContext context) {
    getDoorState();
    return Scaffold(
      backgroundColor: HexColor('#C7FCFF'),
      appBar: AppBar(
        title: const Text(
          '3号館',
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
              onTap: () async {
                 getDoorState();         
                // doorState = !doorState; // ドアの状態をトグル（trueならfalse、falseならtrue）に切り替える 
                  bool flug = true;      
                  if(doorState == true){
                    flug = false;
                  }else{
                    flug = true;
                  }
                  // 新しい状態をリアルタイムデータベースに保存
                  _databaseReference.child(doorPath).set(flug).then((_) {
                    print('ドアの状態を切り替えました。新しい状態: $flug');
                  }).catchError((error) {
                    print('ドアの状態を切り替える際にエラーが発生しました: $error');
                  }); 
                },
              child: Image.asset('img/close_lock.png',width: 35,)
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top:30),
                child: Stack(
                  children: [
                    Stack(
                      children: [
                        Positioned(
                            top:80,
                            left: 50,
                            child:Image.asset('img/foot2_137.png')
                        ),
                        Positioned(
                            top:0,
                            right: 0,
                            child:Image.asset('img/foot1_137.png')
                        ),
                        Positioned(
                            bottom: 0,
                            left:0,
                            child:Image.asset('img/foot3_137.png')
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height*0.65,
                            width: MediaQuery.of(context).size.width * 0.85,
                            padding: const EdgeInsets.only(top:20,right: 10),
                            margin: EdgeInsets.only(left: (MediaQuery.of(context).size.width - MediaQuery.of(context).size.width * 0.85)/2),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xFFFF60C0).withOpacity(0.5),
                                  width: 1
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        padding: const EdgeInsets.only(left: 10),
                                        child:Column(
                                          // mainAxisAlignment: MainAxisAlignment.center,
                                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Container(
                                                      height: 37,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(0xFFFF60C0),
                                                            width: 1
                                                        ),
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child:Align(
                                                        alignment: Alignment.center,
                                                        child :TextButton(
                                                          onPressed: (){},
                                                          child:OutlinedText(
                                                            text :const Text(
                                                              '3701',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                color: Color(0xFF0D6477),
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ),

                                                        ),
                                                      ),
                                                    )
                                                ),
                                                const SizedBox(width: 10,),
                                                Expanded(
                                                    child: Container(
                                                      height: 37,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(0xFFFF60C0),
                                                            width: 1
                                                        ),
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child:Align(
                                                        alignment: Alignment.center,
                                                        child :TextButton(
                                                          onPressed: (){},
                                                          child:OutlinedText(
                                                            text :const Text(
                                                              '3702',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                color: Color(0xFF0D6477),
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ),

                                                        ),
                                                      ),
                                                    )
                                                ),
                                                const SizedBox(width: 10,),
                                                Expanded(
                                                    child: Container(
                                                      height: 37,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: const Color(0xFFFF60C0),
                                                          width: 1,
                                                        ),
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child:Align(
                                                        alignment: Alignment.center,
                                                        child :TextButton(
                                                          onPressed: (){},
                                                          child:OutlinedText(
                                                            text :const Text(
                                                              '3703',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                color: Color(0xFF0D6477),
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ),

                                                        ),
                                                      ),
                                                    )
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10,),

                                            //3号館の6階
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Container(
                                                      height: 37,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(0xFFFF60C0),
                                                            width: 1
                                                        ),
                                                        borderRadius: BorderRadius.circular(5),

                                                      //  窓が開いていたら背景の色が変わる
                                                      //color: const Color(0xFFFF3A3A),
                                                      ),
                                                      child:Align(
                                                        alignment: Alignment.center,
                                                        child :TextButton(
                                                          onPressed: (){
                                                            Build3.currentPosition = 0;
                                                            Navigator.pushNamed(context, '/class');
                                                          },
                                                          child:OutlinedText(
                                                            text :const Text(
                                                              '3601',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                color: Color(0xFF0D6477),

                                                                //窓が開いていたら文字色が変わる
                                                                //color: Colors.white,
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ),

                                                        ),
                                                      ),
                                                    )
                                                ),
                                                const SizedBox(width: 10,),
                                                Expanded(
                                                    child: Container(
                                                      height: 37,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(0xFFFF60C0),
                                                            width: 1
                                                        ),
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child:Align(
                                                        alignment: Alignment.center,
                                                        child :TextButton(
                                                          onPressed: (){
                                                            Build3.currentPosition = 1;
                                                            Navigator.pushNamed(context, '/class');
                                                          },
                                                          child:OutlinedText(
                                                            text :const Text(
                                                              '3602',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                color: Color(0xFF0D6477),
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ),

                                                        ),
                                                      ),
                                                    )
                                                ),
                                              ],

                                            ),
                                            const SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Container(
                                                      height: 37,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(0xFFFF60C0),
                                                            width: 1
                                                        ),
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child:Align(
                                                        alignment: Alignment.center,
                                                        child :TextButton(
                                                          onPressed: (){},
                                                          child:OutlinedText(
                                                            text :const Text(
                                                              '3501',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                color: Color(0xFF0D6477),
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ),

                                                        ),
                                                      ),
                                                    )
                                                ),
                                                const SizedBox(width: 10,),
                                                Expanded(
                                                    child: Container(
                                                      height: 37,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(0xFFFF60C0),
                                                            width: 1
                                                        ),
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child:Align(
                                                        alignment: Alignment.center,
                                                        child :TextButton(
                                                          onPressed: (){},
                                                          child:OutlinedText(
                                                            text :const Text(
                                                              '3502',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                color: Color(0xFF0D6477),
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ),

                                                        ),
                                                      ),
                                                    )
                                                ),
                                              ],

                                            ),
                                            const SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Container(
                                                      height: 37,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(0xFFFF60C0),
                                                            width: 1
                                                        ),
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child:Align(
                                                        alignment: Alignment.center,
                                                        child :TextButton(
                                                          onPressed: (){},
                                                          child:OutlinedText(
                                                            text :const Text(
                                                              '3401',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                color: Color(0xFF0D6477),
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ),

                                                        ),
                                                      ),
                                                    )
                                                ),
                                                const SizedBox(width: 10,),
                                                Expanded(
                                                    child: Container(
                                                      height: 37,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(0xFFFF60C0),
                                                            width: 1
                                                        ),
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child:Align(
                                                        alignment: Alignment.center,
                                                        child :TextButton(
                                                          onPressed: (){},
                                                          child:OutlinedText(
                                                            text :const Text(
                                                              '3402',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                color: Color(0xFF0D6477),
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ),

                                                        ),
                                                      ),
                                                    )
                                                ),
                                                const SizedBox(width: 10,),
                                                Expanded(
                                                    child: Container(
                                                      height: 37,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(0xFFFF60C0),
                                                            width: 1
                                                        ),
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child:Align(
                                                        alignment: Alignment.center,
                                                        child :TextButton(
                                                          onPressed: (){},
                                                          child:OutlinedText(
                                                            text :const Text(
                                                              '3403',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                color: Color(0xFF0D6477),
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ),

                                                        ),
                                                      ),
                                                    )
                                                ),
                                              ],

                                            ),
                                            const SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Container(
                                                      height: 37,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(0xFFFF60C0),
                                                            width: 1
                                                        ),
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child:Align(
                                                        alignment: Alignment.center,
                                                        child :TextButton(
                                                          onPressed: (){},
                                                          child:OutlinedText(
                                                            text :const Text(
                                                              '3301',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                color: Color(0xFF0D6477),
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ),

                                                        ),
                                                      ),
                                                    )
                                                ),
                                                const SizedBox(width: 10,),
                                                Expanded(
                                                    child: Container(
                                                      height: 37,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(0xFFFF60C0),
                                                            width: 1
                                                        ),
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child:Align(
                                                        alignment: Alignment.center,
                                                        child :TextButton(
                                                          onPressed: (){},
                                                          child:OutlinedText(
                                                            text :const Text(
                                                              '3302',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                color: Color(0xFF0D6477),
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ),

                                                        ),
                                                      ),
                                                    )
                                                ),
                                                const SizedBox(width: 10,),
                                                Expanded(
                                                    child: Container(
                                                      height: 37,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(0xFFFF60C0),
                                                            width: 1
                                                        ),
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child:Align(
                                                        alignment: Alignment.center,
                                                        child :TextButton(
                                                          onPressed: (){},
                                                          child:OutlinedText(
                                                            text :const Text(
                                                              '3303',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                color: Color(0xFF0D6477),
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ),

                                                        ),
                                                      ),
                                                    )
                                                ),
                                              ],

                                            ),
                                            const SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Container(
                                                      height: 37,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(0xFFFF60C0),
                                                            width: 1
                                                        ),
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child:Align(
                                                        alignment: Alignment.center,
                                                        child :TextButton(
                                                          onPressed: (){},
                                                          child:OutlinedText(
                                                            text :const Text(
                                                              '3201',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                color: Color(0xFF0D6477),
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ),

                                                        ),
                                                      ),
                                                    )
                                                ),
                                                const SizedBox(width: 10,),
                                                Expanded(
                                                    child: Container(
                                                      height: 37,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(0xFFFF60C0),
                                                            width: 1
                                                        ),
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child:Align(
                                                        alignment: Alignment.center,
                                                        child :TextButton(
                                                          onPressed: (){},
                                                          child:OutlinedText(
                                                            text :const Text(
                                                              '3202',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                color: Color(0xFF0D6477),
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ),

                                                        ),
                                                      ),
                                                    )
                                                ),
                                                const SizedBox(width: 10,),
                                                Expanded(
                                                    child: Container(
                                                      height: 37,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(0xFFFF60C0),
                                                            width: 1
                                                        ),
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child:Align(
                                                        alignment: Alignment.center,
                                                        child :TextButton(
                                                          onPressed: (){},
                                                          child:OutlinedText(
                                                            text :const Text(
                                                              '3203',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                color: Color(0xFF0D6477),
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ),

                                                        ),
                                                      ),
                                                    )
                                                ),
                                              ],

                                            ),
                                            const SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Container(
                                                      height: 38,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(0xFFFF60C0),
                                                            width: 1
                                                        ),
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child:Align(
                                                        alignment: Alignment.center,
                                                        child :TextButton(
                                                          onPressed: (){},
                                                          child:OutlinedText(
                                                            text :const Text(
                                                              'VR 室',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                color: Color(0xFF0D6477),
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ),

                                                        ),
                                                      ),
                                                    )
                                                ),
                                                const SizedBox(width: 10,),
                                                Expanded(
                                                    child: Container(
                                                      height: 38,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(0xFFFF60C0),
                                                            width: 1
                                                        ),
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child:Align(
                                                        alignment: Alignment.center,
                                                        child :TextButton(
                                                          onPressed: (){},
                                                          child:OutlinedText(
                                                            text :const Text(
                                                              '教室員室',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                color: Color(0xFF0D6477),
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ),

                                                        ),
                                                      ),
                                                    )
                                                ),
                                              ],

                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color(0xFFFF60C0),
                                                    width: 1
                                                ),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              height: 37,
                                              alignment: Alignment.center,
                                              child:OutlinedText(
                                                text :const Text(
                                                  '7',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF0D6477),
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10,),
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color(0xFFFF60C0),
                                                    width: 1
                                                ),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              height: 37,
                                              alignment: Alignment.center,
                                              child:OutlinedText(
                                                text :const Text(
                                                  '6',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF0D6477),
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10,),
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color(0xFFFF60C0),
                                                    width: 1
                                                ),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              height: 37,
                                              alignment: Alignment.center,
                                              child:OutlinedText(
                                                text :const Text(
                                                  '5',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF0D6477),
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10,),
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color(0xFFFF60C0),
                                                    width: 1
                                                ),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              height: 37,
                                              alignment: Alignment.center,
                                              child:OutlinedText(
                                                text :const Text(
                                                  '4',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF0D6477),
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10,),
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color(0xFFFF60C0),
                                                    width: 1
                                                ),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              height: 37,
                                              alignment: Alignment.center,
                                              child:OutlinedText(
                                                text :const Text(
                                                  '3',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF0D6477),
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10,),
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color(0xFFFF60C0),
                                                    width: 1
                                                ),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              height: 37,
                                              alignment: Alignment.center,
                                              child:OutlinedText(
                                                text :const Text(
                                                  '2',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF0D6477),
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10,),
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color(0xFFFF60C0),
                                                    width: 1
                                                ),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              height: 37,
                                              alignment: Alignment.center,
                                              child:OutlinedText(
                                                text :const Text(
                                                  '1',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF0D6477),
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.only(top:10,left: 95),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(top:35,),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 30,
                                              height: 48,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF47D4F3),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.only(left: 20),
                                              child: Container(
                                                width: 5,
                                                height: 8,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(25),
                                                  color: const Color(0xFFFFEF93),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 2,),
                                            Container(
                                              width: 30,
                                              height: 48,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF47D4F3),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.only(right: 20),
                                              child: Container(
                                                width: 5,
                                                height: 8,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(25),
                                                  color: const Color(0xFFFFEF93),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          padding: EdgeInsets.only(top:25,),
                                          child: Image.asset('img/cat.png',width: 59,)
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            )
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          margin:EdgeInsets.only(top:MediaQuery.of(context).size.height*0.65+25),
                          child: const Text(
                            '赤くなっているところが窓とドア空いてまちゅ',
                            style: TextStyle(
                              color: Color(0xFFFF60C0),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
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
                                        text: 'を押すとこの画面の校舎の窓ドアの鍵を閉める。',
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
                              const Text(
                                '・部屋番号を押すと部屋の詳細が見れます。',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.start,
                              )
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
