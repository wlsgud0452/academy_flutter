import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // Thisrestarted.

          ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Exercise'),
        centerTitle: true,
        backgroundColor: Colors.red,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('유비'),
              SizedBox(
                width: 20,
              ),
              Text('관우'),
              SizedBox(
                width: 20,
              ),
              Text('장비'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('조조'),
              SizedBox(
                width: 20,
              ),
              Text('여포'),
              SizedBox(
                width: 20,
              ),
              Text('동탁'),
            ],
          ),
        ]),
      ),
    );
  }
}
