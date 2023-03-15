import 'package:bmi_app/home.dart';
import 'package:bmi_app/home2.dart';
import 'package:bmi_app/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        // ignore: prefer_const_constructors
        '/Result': (context) => Result(
              data: 0,
              nomal: 0,
            ),
        '/Home2': (context) => Home2()
      },
    );
  }
}
