import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController textEditingController1;
  late TextEditingController textEditingController2;
  late int result;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController1 = TextEditingController();
    textEditingController2 = TextEditingController();
    result = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('간단한 덧셈 계산기'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text("덧셈결과 : $result"),
              SizedBox(
                width: 200,
                child: Container(
                  color: Colors.amber,
                  child: TextField(
                    controller: textEditingController1,
                    decoration: const InputDecoration(
                      label: Text("첫번째 숫자를 입력하세요"),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              TextField(
                controller: textEditingController2,
                decoration: const InputDecoration(
                  label: Text("두번째 숫자를 입력하세요"),
                ),
                keyboardType: TextInputType.number,
                readOnly: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ElevatedButton.icon(
                  //   onPressed: () {
                  //     _add(context);
                  //   },
                  //   icon: const Icon(Icons.add),
                  //   label: const Text('덧셈계산'),
                  //   style: ElevatedButton.styleFrom(
                  //       minimumSize: const Size(350, 40),
                  //       alignment: Alignment.centerLeft),
                  // ),
                ],
              ),
              ElevatedButton(
                onPressed: () => _add(context),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(Icons.add),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text("덧셈계산")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _add(BuildContext context) {
    setState(() {
      int input1 = int.parse(textEditingController1.text);
      int input2 = int.parse(textEditingController2.text);
      result = input1 + input2;
    });
  }
}
