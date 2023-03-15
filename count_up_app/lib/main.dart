import 'package:count_up_app/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//footing action button
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
