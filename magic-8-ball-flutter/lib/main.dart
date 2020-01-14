import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
   home: AnswerPage(),
  ),
);

class AnswerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        backgroundColor: Colors.orange[200],
        title: Text('Ask me ANYTHING'),
      ),
      body: Answer(),
    );
  }
}

class Answer extends StatefulWidget {
  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  
    int answerNum = 1;
  @override
  Widget build(BuildContext context) {
    void answerRand(){
      setState(() {
            answerNum = Random().nextInt(5)+1;
          });
    }
    return Center(
      child: FlatButton(
        onPressed: (){
          answerRand();
        },
        child: Image.asset('images/ball$answerNum.png'),
      ),
    );
  }
}

