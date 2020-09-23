import 'package:flutter/material.dart';
import 'package:flutterhttpget/tiles.dart';

void main() => runApp(
      MaterialApp(
        home: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Tiles(),
    );
  }
}
