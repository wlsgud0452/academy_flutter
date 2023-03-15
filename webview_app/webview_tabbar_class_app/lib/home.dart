import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_tabbar_class_app/naver.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController page;
  late List site;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    page = TabController(length: 2, vsync: this);
    site = ["www.naver.com", "www.google.com", "www.daum.net"];
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
        title: const Text('WebView - Tabbar'),
      ),
      body: TabBarView(
        controller: page,
        children: [
          WebView(),
          WebView(),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: page,
        tabs: [
          Tab(
            icon: Icon(Icons.alarm),
            text: 'Pikachu Acene #1',
          ),
          Tab(
            icon: Icon(Icons.alarm),
            text: 'Pikachu Acene #1',
          ),
        ],
      ),
    );
  }
}
