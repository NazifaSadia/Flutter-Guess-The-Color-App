import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:color_guessing_game/color_options.dart';
import './random-rgb.dart';
import './result.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Guessing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Color Guessing'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Random random = Random();

  int randomR;
  int randomG;
  int randomB;

  int totalScore = 0;
  int questionCount = 0;

  void answerHandler(int r, int g, int b) {
    if(r==randomR && g==randomG && b==randomB){
      Fluttertoast.cancel();
      Fluttertoast.showToast(
          msg: "Correct",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      setState(() {
        totalScore += 1;
        questionCount++;
      });
    }
    else{
      Fluttertoast.cancel();
      Fluttertoast.showToast(
          msg: "Wrong!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      setState(() {
        questionCount++;
      });
    }
  }

  void resetHandler(){
    setState(() {
      totalScore = 0;
      questionCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    randomR = random.nextInt(256);
    randomG = random.nextInt(256);
    randomB = random.nextInt(256);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: questionCount < 10 ?
        Column(
          children: <Widget>[
            RGB(randomR, randomG, randomB),
            ColorOptions(randomR, randomG, randomB, answerHandler),
          ],
        ) : Result(totalScore,questionCount, resetHandler),
    );
  }
}
