import 'package:flutter/material.dart';
import 'package:tabbar_app/firstpage.dart';
import 'package:tabbar_app/secondpage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, vsync: this);
    //length 페이지 수
    //vsync 어디에 연결할것인지
  }

  //앱이 죽기 전에 하는일
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: [
          const FirstPage(),
          const SecondPage(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.yellowAccent,
        height: 100,
        child: TabBar(
          controller: controller,
          labelColor: Colors.blueAccent,
          indicatorColor: Colors.red,
          tabs: [
            const Tab(
              icon: Icon(
                Icons.looks_one,
              ),
              text: 'one',
            ),
            const Tab(
              icon: Icon(
                Icons.looks_two,
              ),
              text: 'two',
            ),
          ],
        ),
      ),
    );
  }
}
