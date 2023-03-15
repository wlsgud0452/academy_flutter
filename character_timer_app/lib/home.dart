import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String str;
  late int current;
  late String result;
  late String add;

  late TextEditingController textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    str = "광고문구를 입력해주세요";
    current = 0;
    result = '';
    add = '';
    textEditingController = TextEditingController();

    Timer.periodic(
      Duration(milliseconds: 100),
      (Timer timer) {
        strletsgo();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LED광고"),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$result',
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('광고문자를 입력해주세요.'),
              accountEmail: Text(''),
            ),
            ListTile(
              title: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: "광고문구를 입력해주세요",
                ),
                keyboardType: TextInputType.multiline,
              ),
            ),
            ListTile(
              title: ElevatedButton(
                onPressed: () {
                  addsens();
                },
                child: Text("입력하기"),
              ),
            )
          ],
        ),
      ),
    );
  }

  strletsgo() {
    setState(() {
      current++;
      result = str.substring(0, current);
      if (current == str.length) {
        current = 0;
      }
    });
  }

  addsens() {
    setState(() {
      str = textEditingController.text;
    });
  }
}
