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
      backgroundColor: Color.fromARGB(255, 147, 93, 111),
      appBar: AppBar(
        title: const Text("Image Ex01"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 10, 10, 0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/pi1.png'),
                    radius: 50,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/pi2.png'),
                    radius: 50,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/pi3.png'),
                    radius: 50,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
