import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InsertPage extends StatefulWidget {
  final List<String> heroList;
  const InsertPage({super.key, required this.heroList});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  late List<String> heroList;
  late TextEditingController controller;
  late int selectItem;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
    heroList = [];
    heroList.add('유비');
    heroList.add('장비');
    heroList.add('조조');
    heroList.add('초선');

    selectItem = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert Hero'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350,
                height: 100,
                child: CupertinoPicker(
                    itemExtent: 30,
                    scrollController:
                        FixedExtentScrollController(initialItem: 0),
                    onSelectedItemChanged: (value) {
                      setState(() {
                        selectItem = value;
                      });
                    },
                    children: [
                      Text(heroList[0]),
                      Text(heroList[1]),
                      Text(heroList[2]),
                      Text(heroList[3]),
                    ]),
              ),
              ElevatedButton(
                onPressed: () {
                  //
                  widget.heroList.add(heroList[selectItem]);
                  Navigator.pop(context, widget.heroList);
                },
                child: Text('추가'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
