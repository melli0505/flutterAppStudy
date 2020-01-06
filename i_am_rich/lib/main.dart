
import 'package:flutter/material.dart';

//The main function is the starting point for all our flutter apps
void main() { //app launch
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('I Am Rich'),
          backgroundColor: Colors.lightBlue[900],
        ),
        backgroundColor: Colors.blue[300],
        body: Center(
          child: Image(
            image: AssetImage('images/diamond.png'),
          ),
        ),
      ),
    ),
  );
}

