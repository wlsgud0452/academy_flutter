import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stl_in_stf/stfPage.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('stl in stf'),
      ),
      body: Center(
        child: Column(
          children: [
            const stfPage(text: 'sdsdsde'),
          ],
        ),
      ),
    );
  }
}
