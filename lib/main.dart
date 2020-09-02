import 'package:flutter/material.dart';

import 'package:bandname/src/pages/home.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home' : (BuildContext context) => HomePage()
      },
    );
  }
}