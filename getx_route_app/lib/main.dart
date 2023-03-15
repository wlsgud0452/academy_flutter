import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_route_app/home.dart';
import 'package:getx_route_app/thrid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      getPages: [
        GetPage(
          name: '/third',
          page: () => const ThirdPage(),
        )
      ],
    );
  }
}
