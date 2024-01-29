// ignore_for_file: use_key_in_widget_constructors, todo

import 'package:flutter/material.dart';

//https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e

//This app makes use of the Row, Column,
//Expanded, Padding, Transform, Container,
//BoxDecoration, BoxShape, Colors,
//Border, Center, Align, Alignment,
//EdgeInsets, Text, and TextStyle Widgets
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // first level widget of Material Design
      home: Scaffold(
        // default route
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text("App1 - UI Layout"),
          backgroundColor: Colors.blue,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            //TODO: Put your code here to complete this app.
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        border: Border.all(
                          color: Colors.black,
                          width: 3.0,
                        ),
                      ),
                      height: 100,
                      width: 100,
                      child: const Center(
                        child: Text(
                          'Container 1',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: 0.785398,
                    child: Container(
                      color: Colors.white,
                      height: 100,
                      width: 100,
                      child: const Center(
                        child: Text(
                          'Container 2',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    color: Colors.yellow,
                    height: 300,
                    width: 100,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Container 3',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    color: Colors.lightBlue,
                    height: 300,
                    width: 100,
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Container 4',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 180.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 3.0,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Container 5',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 150.0),
                    child: Align(
                      alignment: const Alignment(0.2, 1.0),
                      child: Container(
                        color: Colors.red,
                        height: 220,
                        width: 100,
                        child: const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Con 6',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
