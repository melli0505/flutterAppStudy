import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey(int sound, Color color, Text str) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(sound);
        }, 
        child: Text('$str'),
      ),
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(1, Colors.red,Text('C')),
              buildKey(2, Colors.orange,Text('D')),
              buildKey(3, Colors.yellow,Text('E')),
              buildKey(4, Colors.green,Text('F')),
              buildKey(5, Colors.blue,Text('G')),
              buildKey(6, Colors.blue[900],Text('A')),
              buildKey(7, Colors.purple,Text('B')),
            ],
          ),
        ),
      ),
    );
  }
}
