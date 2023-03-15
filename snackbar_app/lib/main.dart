import 'package:flutter/material.dart';
import 'package:snackbar_app/snackbar.dart';

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
        primarySwatch: Colors.blue,
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
        title: const Text("SnackBar"),
      ),
      body: const MySnackBar(),
    );
  }
}
// --- Funtion -----

//sanckBarFunction(BuildContext context) {
  //버튼을 누르면 context에서 기억하고 있다가 실행이 끝나면 불러온다.
  // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //   content: Text(
  //     'ElevatedButton is clicked',
  //   ),
  //   duration: Duration(milliseconds: 1),
  //   backgroundColor: Colors.red,
  // ));
//}

// end