import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lightBlue)
            .copyWith(secondary: Colors.amber),
        fontFamily: 'Rubik',
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w700,
              fontFamily: 'Rubik-Italic',
              color: Color(0xff16F581),
              fontStyle: FontStyle.italic,
              height: 0.85),
          headline2: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              fontFamily: 'Rubik-Italic',
              color: Colors.white,
              fontStyle: FontStyle.italic,
              height: 1.18),
          bodyText2: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
            height: 1.25,
            letterSpacing: -0.24,
            fontFamily: 'Rubik-Regular',
            color: Color(0xff1C1C1E),
          ),
          bodyText1: TextStyle(
              fontSize: 16.0,
              height: 1.375,
              letterSpacing: 0.2,
              color: Colors.white,
              fontFamily: 'Rubik-Regular'),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
