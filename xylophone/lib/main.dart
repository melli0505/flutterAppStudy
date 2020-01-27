import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey(int sound, Color color, String str) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(sound);
        }, 
        child: Text(
          '$str', 
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

 final  List<String> sounds = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(1, Colors.red, "C"),
              buildKey(2, Colors.orange, "D"),
              buildKey(3, Colors.yellow, "E"),
              buildKey(4, Colors.green, "F"),
              buildKey(5, Colors.blue, "G"),
              buildKey(6, Colors.blue[900], "A"),
              buildKey(7, Colors.purple, "B"),
            ],
          ),
        ),
      ),
    );
  }
}
