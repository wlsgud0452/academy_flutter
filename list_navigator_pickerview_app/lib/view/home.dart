import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:list_navigator_pickerview_app/model/message.dart';
import 'package:list_navigator_pickerview_app/model/todo-list.dart';
import 'package:list_navigator_pickerview_app/view/addview.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // late List<todoList> todolist;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main View'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => addView(),
                  )).then((value) {
                setState(() {
                  message.todolistinfo;
                });
              });
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Center(
          child: ListView.builder(
        itemCount: message.todolistinfo.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Card(
                color: index % 2 == 1 ? Colors.red[100] : Colors.yellow[100],
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(message.todolistinfo[index].imageName),
                    ),
                    Text(message.todolistinfo[index].todoInfo)
                  ],
                ),
              ),
            ),
          );
        },
      )),
    );
  }
}
