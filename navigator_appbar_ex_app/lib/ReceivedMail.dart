import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReceivedMail extends StatelessWidget {
  const ReceivedMail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Mail'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: const [
          Text('유비에게서 온 메일'),
          Text('관우에게서 온 메일'),
          Text('장비에게서 온 메일'),
        ],
      ),
    );
  }
}
