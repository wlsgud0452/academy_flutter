import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/secondPage.dart';

class Home extends StatefulWidget {
  final TextEditingController controller;
  final bool lampOnOFF;
  const Home({super.key, required this.controller, required this.lampOnOFF});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController controller;
  late bool lampOnOff;
  late String lampState;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = widget.controller;
    lampOnOff = widget.lampOnOFF;
    lampState = '';

    if (lampOnOff == true) {
      lampState = 'images/lamp_on.png';
    } else {
      lampState = 'images/lamp_off.png';
    }

    //controller.text = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main 화면'),
        actions: [
          IconButton(
            onPressed: () {
              //
              // Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SecondPage(
                      controller: controller,
                      lampOnOff: lampOnOff,
                    );
                  },
                ),
              ).then((value) => print(value));
            },
            icon: Icon(Icons.edit),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(labelText: '글자를 입력하세요'),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset(
                  lampState,
                  width: 100,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
