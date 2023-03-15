import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  final _itemList = List.generate(100, (i) => i);
  int _result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI계산기2"),
      ),
      body: Center(
        child: Column(
          children: [
            CupertinoPicker(
              children: _itemList.map((e) => Text('항목 $e')).toList(),
              itemExtent: 50.0,
              scrollController:
                  FixedExtentScrollController(initialItem: _result),
              onSelectedItemChanged: (int index) {
                setState(() {
                  _result = _itemList[index];
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
