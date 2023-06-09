import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 106, 97),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(5, 10, 10, 0),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/pi1.png'),
                radius: 50,
              ),
            ),
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
            ),
          ],
        ),
      ),
    );
  }
}
