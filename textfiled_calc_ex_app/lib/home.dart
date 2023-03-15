import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<TextEditingController> value;
  late List<bool> calc;

  @override
  void initState() {
    super.initState();
    value = [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController()
    ];
    calc = [false, false, false, false, false, false];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("간단한 계산기"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                children: [
                  TextField(
                      controller: value[0],
                      decoration: const InputDecoration(
                        labelText: "첫번째 숫자를 입력하세요.",
                      ),
                      keyboardType: TextInputType.number),
                  TextField(
                    controller: value[1],
                    decoration: const InputDecoration(
                      labelText: "두번째 숫자를 입력하세요.",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (value[0].text.trim().isEmpty ||
                              value[1].text.trim().isEmpty) {
                            errorSnackBar(context);
                          } else if (value[1].text == '0') {
                            zeroSnackBar(context);
                          } else {
                            _calc();
                          }
                        },
                        child: const Text("계산하기"),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _remove();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text("지우기"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("덧셈:"),
                      Switch(
                        value: calc[0],
                        onChanged: (value) {
                          setState(() {
                            calc[0] = value;
                          });
                        },
                      ),
                      const Text("뺄셈:"),
                      Switch(
                        value: calc[1],
                        onChanged: (value) {
                          setState(() {
                            calc[1] = value;
                          });
                        },
                      ),
                      const Text("곱셈:"),
                      Switch(
                        value: calc[2],
                        onChanged: (value) {
                          setState(() {
                            calc[2] = value;
                          });
                        },
                      ),
                      const Text("나눗셈:"),
                      Switch(
                        value: calc[3],
                        onChanged: (value) {
                          setState(() {
                            calc[3] = value;
                          });
                        },
                      ),
                    ],
                  ),
                  TextField(
                    controller: value[2],
                    decoration: const InputDecoration(
                      labelText: "덧셈결과",
                    ),
                    readOnly: true,
                  ),
                  TextField(
                    controller: value[3],
                    decoration: const InputDecoration(
                      labelText: "뺄셈 결과",
                    ),
                    readOnly: true,
                  ),
                  TextField(
                    controller: value[4],
                    decoration: const InputDecoration(
                      labelText: "곱셈 결과",
                    ),
                    readOnly: true,
                  ),
                  TextField(
                    controller: value[5],
                    decoration: const InputDecoration(
                      labelText: "나눗셈 결과",
                    ),
                    readOnly: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        onPressed: () {},
                        child: const Icon(
                          Icons.add,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //--- function
  _calc() {
    int input1 = int.parse(value[0].text);
    int input2 = int.parse(value[1].text);
    if (calc[0] == true) {
      value[2].text = (input1 + input2).toString();
    } else if (calc[0] == false) {
      value[2].text = "";
    }
    if (calc[1] == true) {
      value[3].text = (input1 - input2).toString();
    } else if (calc[1] == false) {
      value[3].text = "";
    }
    if (calc[2] == true) {
      value[4].text = (input1 * input2).toString();
    } else if (calc[2] == false) {
      value[4].text = "";
    }
    if (calc[3] == true) {
      value[5].text =
          (double.parse(value[0].text) / double.parse(value[1].text))
              .toString();
    } else if (calc[3] == false) {
      value[5].text = "";
    }
  }

  _remove() {
    for (var i in value) {
      i.text = "";
    }
    setState(() {
      calc[0] = false;
      calc[1] = false;
      calc[2] = false;
      calc[3] = false;
    });
  }

  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('숫자를 입력하세요'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }

  zeroSnackBar(context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('0보다 큰숫자를 입력하세요'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }
  //end
}
