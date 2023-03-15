import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tabbar_ex_app/firstPage.dart';
import 'package:tabbar_ex_app/secondPage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController page;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    page = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    page.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('피카츄 이미지 탭바'),
      ),
      body: TabBarView(
        controller: page,
        children: [
          FirstPage(),
          SecondPage(),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: page,
        labelColor: Colors.blue,
        tabs: [
          Tab(
            icon: Icon(Icons.alarm),
            text: 'Pikachu Acene #1',
          ),
          Tab(
            icon: Icon(Icons.person
            ),
            text: 'Pikachu Acene #2',
          )
        ],
      ),
    );
  }
}
