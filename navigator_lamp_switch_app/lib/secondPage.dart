import 'package:flutter/material.dart';

import 'package:navigator_lamp_switch_app/model/message.dart';

class SecondPage extends StatefulWidget {
  final bool lampColor;
  final bool lampOnOff;
  const SecondPage(
      {super.key, required this.lampColor, required this.lampOnOff});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late bool lampColor;
  late bool lampOnOff;
  late lamp lampstate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lampstate = lamp(lampColor: widget.lampColor, lampOnOff: widget.lampOnOff);
    lampColor = true;
    lampOnOff = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('수정화면'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context, lampstate);
              },
              icon: Icon(Icons.arrow_back_ios))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Red'),
                Switch(
                  value: lampstate.lampColor,
                  onChanged: (value) {
                    setState(() {
                      lampstate.lampColor = value;
                    });
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('on'),
                Switch(
                  value: lampstate.lampOnOff,
                  onChanged: (value) {
                    setState(() {
                      lampstate.lampOnOff = value;
                    });
                  },
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, lampstate);
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      ),
    );
  }
}
