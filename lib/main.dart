import 'package:flutter/material.dart';
import 'package:netflix_ui/HomePage.dart';
import 'package:netflix_ui/Loading_Screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoadingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


