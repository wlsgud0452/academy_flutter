import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, //그림자
        toolbarHeight: 100, //엡바 크기
        title: const Text('App Bar Icon'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.email,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.alarm,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_outlined,
            ),
          ),
          GestureDetector(
            onTap: () {
              print('sdfsdf');
            },
            child: Image.asset(
              'images/smile.png',
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}
