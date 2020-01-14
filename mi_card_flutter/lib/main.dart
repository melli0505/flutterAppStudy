import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.pink[900],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('image/popGirl.jpg')
              ),
              Text(
                'Kang Dain',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontFamily: 'Pacifico'
                ),
              ),
              Text(
                'DSC HUFS & HUFS CES',
                style: TextStyle(
                  fontSize:15.0,
                  color: Colors.pink.shade50,
                  fontFamily: 'SourceSansPro',
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Padding(
                  padding: EdgeInsets.all(1.0),
                   child: ListTile(
                     leading: Icon(
                        Icons.phone,
                        color: Colors.pink,
                      ),
                      title: Text(
                        '+82 7601 2577',
                        style: TextStyle(
                          color: Colors.pink.shade900,
                          fontFamily: 'SourceSansPro',
                          fontSize: 20.0,
                        ),
                      )
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Padding(
                  padding: EdgeInsets.all(1.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.pink,
                    ),
                    title: Text(
                      'dmelli0505@gmail.com',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.pink.shade900,
                        fontFamily: 'SourceSansPro'
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
