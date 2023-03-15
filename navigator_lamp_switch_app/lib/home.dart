import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/model/message.dart';
import 'package:navigator_lamp_switch_app/secondPage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late lamp lampstate;
  late String lampColor;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lampstate = lamp(lampColor: true, lampOnOff: false);
    lampColor = 'images/lamp_on.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SecondPage(
                      lampColor: lampstate.lampColor,
                      lampOnOff: lampstate.lampOnOff,
                    );
                  },
                )).then(
                  (value) {
                    lampChange(value);
                  },
                );
              },
              icon: Icon(Icons.edit))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              lampColor,
              width: 150,
            )
          ],
        ),
      ),
    );
  }

  lampChange(value) {
    setState(() {
      lampstate = value;

      if (lampstate.lampOnOff && lampstate.lampColor) {
        lampColor = 'images/lamp_red.png';
      }
      if (lampstate.lampOnOff && !lampstate.lampColor) {
        lampColor = 'images/lamp_on.png';
      }
      if (!lampstate.lampOnOff) {
        lampColor = 'images/lamp_off.png';
      }
    });
  }
}
