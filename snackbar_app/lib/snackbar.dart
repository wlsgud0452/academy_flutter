import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MySnackBar extends StatelessWidget {
  const MySnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          //버튼을 누르면 context에서 기억하고 있다가 실행이 끝나면 불러온다.
          sanckBarFunction(context);
        },
        child: const Text(
          'snackBar Button',
        ),
      ),
    );
  }
}

sanckBarFunction(BuildContext context) {
  // 버튼을 누르면 context에서 기억하고 있다가 실행이 끝나면 불러온다.
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text(
      'ElevatedButton is clicked',
    ),
    duration: Duration(milliseconds: 1),
    backgroundColor: Colors.red,
  ));
}
