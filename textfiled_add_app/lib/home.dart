import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController textEditingController;
  late TextEditingController textEditingController2;
  late int add;
  late int input1;
  late int input2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController();
    textEditingController2 = TextEditingController();
    add = 0;
    input1 = 0;
    input2 = 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("덧셈구하기"),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    labelText: "첫번째 숫자를 입력하세요",
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: textEditingController2,
                  decoration: const InputDecoration(
                    labelText: "두번째 숫자를 입력하세요",
                  ),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (textEditingController.text.trim().isEmpty) {
                      errorSnackBar(context);
                    } else {
                      _add(context);
                    }
                  },
                  child: const Text("덧셈 계산"),
                ),
                Text(
                  "입력하신 숫자의 합은 $add 입니다.",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _add(BuildContext context) {
    setState(() {
      input1 = int.parse(textEditingController.text);
      input2 = int.parse(textEditingController2.text);
      add = input1 + input2;
    });
  }

  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('숫자를 입력하세요'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }
}
