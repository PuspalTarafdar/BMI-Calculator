// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'input_page.dart';
void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 3, 31, 33),
        ),
        scaffoldBackgroundColor: Color.fromARGB(255, 1, 34, 34),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white)
        )
      ),
      home: InputPage(),
    );
  }
}

