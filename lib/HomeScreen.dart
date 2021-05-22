import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int leftDiceNumber = 1, rightDiceNumber = 1;
  AnimationController _controller;
  CurvedAnimation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animate();
  }

  animate() {
    _controller = AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = CurvedAnimation(parent: _controller,curve: Curves.bounceOut);

    animation.addListener(() {
      setState(() {});
      print(_controller.value);
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        leftDiceNumber = Random().nextInt(6) + 1;
        rightDiceNumber = Random().nextInt(6) + 1;
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  void roll() {
    setState(() {
      _controller.forward();


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play With Dice'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: GestureDetector(
                      onDoubleTap: roll,
                      child: Container(
                        child: Image.asset('images/dice$leftDiceNumber.png',
                            height: 200 - (animation.value * 200)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: GestureDetector(
                      onDoubleTap: roll,
                      child: Container(
                        child: Image.asset('images/dice$rightDiceNumber.png',
                            height: 200 - (animation.value * 200)),
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
