import 'package:flutter/material.dart';
import 'hexcolor.dart';

class Floor6 extends StatefulWidget {
  const Floor6({Key? key}) : super(key: key);

  @override
  State<Floor6> createState() => _Floor6State();
}

class _Floor6State extends State<Floor6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#C7FCFF'),
      appBar: AppBar(
        title: const Text(
          '3号館:6階',
          style: TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: HexColor('#47D4F3'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed:(){},
                    icon:Image.asset('img/back.png'),
                )
              ],
            ),
            const Text(
                '3601',
              style: TextStyle(
                color: Colors.pinkAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed:(){},
                  icon:Image.asset('img/next.png'),
                )
              ],
            ),
          ],
        ),
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
