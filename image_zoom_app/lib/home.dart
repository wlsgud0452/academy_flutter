import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _lampTmage; // Image Name
  late double _lampWidth; // Image width
  late double _lampHeight; // Image Height
  late String _buttonName; // button title
  late bool _switch;
  late bool _lampstate;
  late bool _OnOffState;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _lampTmage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _buttonName = 'Image 확대';
    _switch = true;
    _lampstate = true;
    _OnOffState = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image 확대 및 축소"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              height: 650,
              child: Column(
                children: [
                  Image.asset(
                    _lampTmage,
                    width: _lampWidth,
                    height: _lampHeight,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    decisionLampSize();
                  },
                  child: Text(_buttonName),
                ),
                Column(
                  children: [
                    const Text(
                      '전구스위치',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    Switch(
                      value: _switch,
                      onChanged: (value) {
                        setState(() {
                          _switch = value;
                        });
                        lampOnOff();
                      },
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  } //---Functions---

  decisionLampSize() {
    setState(() {
      if (_lampstate == true) {
        _lampWidth = 300;
        _lampHeight = 600;
        _buttonName = 'Image 축소';
        _lampstate = false;
      } else {
        _lampWidth = 150;
        _buttonName = 'Image 확대';
        _lampstate = true;
      }
    });
  }

  lampOnOff() {
    setState(() {
      if (_switch == false) {
        _lampTmage = 'images/lamp_off.png';
      } else {
        _lampTmage = 'images/lamp_on.png';
      }
    });
  }
}//End
