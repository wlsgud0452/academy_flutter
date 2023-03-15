import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/home.dart';

class SecondPage extends StatefulWidget {
  final TextEditingController controller;
  final bool lampOnOff;
  const SecondPage(
      {super.key, required this.controller, required this.lampOnOff});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late TextEditingController secondController;
  late String swText;
  late bool lampOnOff;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    secondController = widget.controller;
    lampOnOff = widget.lampOnOff;
    swText = 'on';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('수정화면'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: secondController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(swText),
                    CupertinoSwitch(
                      value: lampOnOff,
                      onChanged: (value) {
                        setState(() {
                          lampOnOff = value;
                          if (value) {
                            swText = 'on';
                          } else {
                            swText = "off";
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CupertinoButton(
                  child: Text('OK'),
                  onPressed: () {
                    //
                    Navigator.pop(context, lampOnOff);

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return Home(
                    //         controller: secondController,
                    //         lampOnOFF: lampOnOff,
                    //       );
                    //     },
                    //   ),
                    // );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
