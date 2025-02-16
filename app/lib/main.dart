import 'package:calculator_app/home.dart';
import 'package:flutter/material.dart';

void main() {
  // debugPaintLayerBordersEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NormalCalc(),
    );
  }
}
