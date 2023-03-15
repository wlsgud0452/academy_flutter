import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:listview_todo_app/model/message.dart';
import 'package:listview_todo_app/model/todo_list.dart';

class InsertList extends StatefulWidget {
  const InsertList({super.key});

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  late TextEditingController textEditingController;
  late bool cartvalue;
  late bool clockvalue;
  late bool pencilvalue;
  late String insertimage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController();

    cartvalue = true;
    clockvalue = false;
    pencilvalue = false;
    insertimage = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add view"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('구매'),
                  CupertinoSwitch(
                    value: cartvalue,
                    onChanged: (value) {
                      cartChange(value);
                    },
                  ),
                  Image.asset(
                    'images/cart.png',
                    width: 50,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('약속'),
                  CupertinoSwitch(
                    value: clockvalue,
                    onChanged: (value) {
                      clockChange(value);
                    },
                  ),
                  Image.asset(
                    'images/clock.png',
                    width: 50,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('스터디'),
                  CupertinoSwitch(
                    value: pencilvalue,
                    onChanged: (value) {
                      pencilChange(value);
                    },
                  ),
                  Image.asset(
                    'images/pencil.png',
                    width: 40,
                    height: 50,
                  )
                ],
              ),
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: '목록을 입력하세요',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  if (textEditingController.text.trim().isNotEmpty) {
                    addList();
                  }
                  Navigator.pop(context);
                },
                child: const Text(
                  'OK',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  addList() {
    Message.workList = textEditingController.text.trim();

    if (cartvalue == true) {
      insertimage = 'images/cart.png';
    } else if (clockvalue == true) {
      insertimage = 'images/clock.png';
    } else {
      insertimage = 'images/pencil.png';
    }
    Message.imagePath = insertimage;
    Message.action = true;
  }

  cartChange(value) {
    setState(() {
      cartvalue = value;
      if (cartvalue == true) {
        clockvalue = false;
        pencilvalue = false;
      } else {
        cartvalue = true;
      }
    });
  }

  clockChange(value) {
    setState(() {
      clockvalue = value;
      if (clockvalue == true) {
        cartvalue = false;
        pencilvalue = false;
      } else {
        cartvalue = true;
      }
    });
  }

  pencilChange(value) {
    setState(() {
      pencilvalue = value;
      if (pencilvalue == true) {
        cartvalue = false;
        clockvalue = false;
      } else {
        cartvalue = true;
      }
    });
  }
}
