import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class stfPage extends StatefulWidget {
  final String text;
  const stfPage({super.key, required this.text});

  @override
  State<stfPage> createState() => _stfPageState();
}

class _stfPageState extends State<stfPage> {
  late String text2;
  late int cnt;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    text2 = widget.text;
    cnt = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              cnt++;
              if (cnt % 2 == 0) {
                text2 = '123123';
              } else {
                text2 = 'sadfsadf';
              }
            });
          },
          child: Text(text2)),
    );
  }
}
