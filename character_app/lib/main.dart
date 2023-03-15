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
        primarySwatch: Colors.orange,
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
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text('영웅 Card'),
        backgroundColor: Colors.orange.shade900,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(5),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/sunsin.jpeg'),
                  radius: 70,
                ),
              )
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
            endIndent: 20,
            indent: 20,
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                child: Text('성웅'),
              )
            ],
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  '이순신',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              )
            ],
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "전적",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  '62전62승',
                  style: TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 177, 89, 1)),
                ),
              )
            ],
          ),
          Row(
            children: [
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Icon(Icons.check_circle_outline),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Icon(Icons.check_circle_outline),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Icon(Icons.check_circle_outline),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Icon(Icons.check_circle_outline),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Icon(Icons.check_circle_outline),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Icon(Icons.check_circle_outline),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Icon(Icons.check_circle_outline),
                  ),
                ],
              ),
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 7.5, 0, 0),
                    child: Text('옥포해전'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 7.5, 0, 0),
                    child: Text('옥포해전'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 7.5, 0, 0),
                    child: Text('옥포해전'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 7.5, 0, 0),
                    child: Text('옥포해전'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 7.5, 0, 0),
                    child: Text('옥포해전'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 7.5, 0, 0),
                    child: Text('옥포해전'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 7.5, 0, 0),
                    child: Text('옥포해전'),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(5),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/tuttle.gif'),
                  backgroundColor: Colors.orange,
                  radius: 50,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
