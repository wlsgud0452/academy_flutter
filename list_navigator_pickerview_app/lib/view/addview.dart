import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:list_navigator_pickerview_app/model/message.dart';
import 'package:list_navigator_pickerview_app/model/todo-list.dart';

class addView extends StatefulWidget {
  const addView({super.key});

  @override
  State<addView> createState() => _addViewState();
}

class _addViewState extends State<addView> {
  late List image;
  late int imageIndex;
  late TextEditingController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
    imageIndex = 0;
    image = [
      'images/cart.png',
      'images/clock.png',
      'images/pencil.png',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add view"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(image[imageIndex]),
                    SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: CupertinoPicker(
                        backgroundColor: Colors.grey[200],
                        itemExtent: 40,
                        scrollController:
                            FixedExtentScrollController(initialItem: 0),
                        onSelectedItemChanged: (value) {
                          setState(() {
                            imageIndex = value;
                          });
                        },
                        children: [
                          Image.asset(image[0]),
                          Image.asset(image[1]),
                          Image.asset(image[2]),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    labelText: '목록을 입력하세요',
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    message.todolistinfo.add(todoList(
                        imageName: image[imageIndex],
                        todoInfo: controller.text));
                    Navigator.pop(context, message.todolistinfo);
                  },
                  child: Text('OK'))
            ],
          ),
        ),
      ),
    );
  }
}
