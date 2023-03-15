import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Color buttoncolor;
  late String buttontext;

  @override
  void initState() {
    super.initState();
    buttoncolor = Colors.blue;
    buttontext = "Hello";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change button colot & text"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _onclick();
          },
          child: Text(buttontext),
          style: ElevatedButton.styleFrom(
            backgroundColor: buttoncolor,
          ),
        ),
      ),
    );
  }

  _onclick() {
    setState(() {
      // if (buttontext == "Hello") {
      //   buttontext = "Flutter";
      //   buttoncolor = Colors.orange;
      // } else {
      //   buttontext = "Hello";
      //   buttoncolor = Colors.blue;
      // }
      buttoncolor = buttoncolor == Colors.blue ? Colors.orange : Colors.blue;
      buttontext = buttontext == "Hello" ? "Flutter" : "Hello";
    });
  }
}
