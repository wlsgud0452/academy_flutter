import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<int> todoList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todoList = [];

    for (int i = 1; i <= 100; i++) {
      todoList.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main View'),
      ),
      //ListView.builder = 리사이클러뷰 방식을 사용해 위 아래 20%정도만 먼저 만들어놓고 넘어가면 메모리에서 지운다
      body: Center(
        child: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 60,
                child: Card(
                  color: index % 2 == 0 ? Colors.red : Colors.amber,
                  child: Center(
                      child: Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 55,
                            child: Image.asset(
                              index % 3 == 1
                                  ? 'images/pi1.png'
                                  : (index % 3 == 2
                                      ? 'images/pi2.png'
                                      : 'images/pi3.png'),
                            ),
                          ),
                          const SizedBox(
                            width: 157,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                todoList[index].toString(),
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
                ),
              );
            }),
      ),
    );
  }
}
