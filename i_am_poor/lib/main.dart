import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
     home: Scaffold(
        appBar: AppBar(
          title: Text("I am poor"),
          backgroundColor: Colors.green,
        ),
        backgroundColor: Colors.greenAccent,
        body: Center(
          child: Image(
            image: AssetImage('image/envio-69.jpg'),
          ),
        ),
      ),
    ),
  );
}