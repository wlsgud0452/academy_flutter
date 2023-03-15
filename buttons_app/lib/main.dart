import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                //---
                print('text Button');
              },
              onLongPress: () {
                print("longn");
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: const Text(
                'Text Button',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //----
                print("elevated button");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Elevated Button'),
            ),
            OutlinedButton(
              onPressed: () => print('outlined button'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.green,
                side: const BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: const Text(
                'outlined button',
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                size: 30,
                color: Colors.black,
              ),
              label: const Text(
                'go to home',
              ),
              style: TextButton.styleFrom(
                foregroundColor: Colors.purple,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.home),
              label: const Text('go go go go'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {
                //------
              },
              icon: const Icon(
                Icons.home,
              ),
              label: const Text(
                " home",
              ),
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  minimumSize: const Size(140, 40)),
            ),
            OutlinedButton.icon(
              onPressed: () {
                //------
              },
              icon: const Icon(
                Icons.home,
              ),
              label: const Text(
                "go to home",
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.pink.shade100,
                foregroundColor: Colors.pink,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('TextButton'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("ElevatedButton"),
                )
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('TextButton'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("ElevatedButton"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


//const는 변경이 불가능하다
// 버튼 모양이 바뀌거나 색이 바뀌는것은 statesful로 진행히야한다, stateless는 변경이 안됨