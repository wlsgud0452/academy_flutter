import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getx_route_app/second.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GetX Route관리',
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.amber,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Navigation'),
              ElevatedButton(
                onPressed: () {
                  //
                  Get.to(
                    const SecondPage(),
                    arguments: ['First', "Second"],
                    transition: Transition.upToDown,
                    duration: const Duration(seconds: 1),
                  );
                  //Get.off(() => SecondPage());
                },
                child: const Text('second Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  //
                  Get.toNamed('/third');
                },
                child: const Text('third Page'),
              ),
              ElevatedButton(
                onPressed: () async {
                  var returnValue = await Get.to(
                    arguments: ['First', "Second"],
                    const SecondPage(),
                  );
                  Get.snackbar(
                    "Return value",
                    "$returnValue",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                child: const Text('return Page'),
              ),
              const Text('SnackBar'),
              ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    "Snack Bar",
                    "message",
                    backgroundColor: Colors.yellowAccent,
                    snackPosition: SnackPosition.BOTTOM,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                  );
                },
                child: const Text('SnackBar'),
              ),
              const Text('Dialog'),
              ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                      title: 'Dialog',
                      middleText: 'Message',
                      barrierDismissible: false,
                      backgroundColor: Colors.amber,
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("OK"),
                        )
                      ]);
                },
                child: const Text("Dialog"),
              ),
              const Text('Bottom Sheet'),
              ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(
                    //SecondPage()
                    Container(
                      height: 300,
                      color: Colors.purple[200],
                      child: Column(
                        children: const [
                          Text('Text Lime1'),
                          Text('Text Lime2'),
                          Text('Text Lime3'),
                        ],
                      ),
                    ),
                  );
                },
                child: const Text("Bottom Sheet"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(
                      '/third?id=root&name=루트',
                    );
                  },
                  child: const Text("pushNamed")),
            ],
          ),
        ),
      ),
    );
  }
}
