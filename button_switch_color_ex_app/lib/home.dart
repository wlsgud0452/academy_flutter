import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Color bcolor;
  late bool state;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bcolor = Colors.blue;
    state = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Changed Button color on Switch"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _onclick();
            },
            child: Text("Flutter"),
            style: ElevatedButton.styleFrom(
              backgroundColor: bcolor,
            ),
          ),
          Switch(
            value: state,
            onChanged: (value) => _onclick(),
          )
        ],
      )),
    );
  }

  _onclick() {
    setState(() {
      if (bcolor == Colors.blue || state == false) {
        bcolor = Colors.red;
        state = true;
      } else {
        bcolor = Colors.blue;
        state = false;
      }
    });
  }
}
