import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int leftDiceNumber =1, rightDiceNumber= 1;
  void roll() {
    setState(() {

      leftDiceNumber = Random().nextInt(5) + 1;
      rightDiceNumber = Random().nextInt(5) + 1;
    });
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Play With Dice'),
      ),
      body: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(onDoubleTap: roll,
                        child: Container(
                          child: Image.asset('images/dice$leftDiceNumber.png'),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(onDoubleTap: roll,
                        child: Container(
                          child: Image.asset('images/dice$rightDiceNumber.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: roll,
                child: Text('Roll It Guys!'),
              )
            ],
          ),
        ),
      );
  }
}
