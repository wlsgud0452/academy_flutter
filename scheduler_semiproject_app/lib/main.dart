import 'package:flutter/material.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:scheduler_semiproject_app/home.dart';
import 'package:get/get.dart';

void main() async {
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const Home(),
    );
  }
}
