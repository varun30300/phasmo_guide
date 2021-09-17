import 'package:flutter/material.dart';
import 'package:phasmo_guide/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Phasmo Guide',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF1A1A1A),
      ),
      home: Home(),
    );
  }
}
