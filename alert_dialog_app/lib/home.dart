import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Dialog with Gesture'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
          child: Text(
            'Hello World',
          ),
        ),
      ),
    );
  }

  //--- Functions ---
  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      //barrierDismissible <- 다이얼러그 창이 아닌 다른곳을 눌러도 창이 없어지게하는거 T/F
      barrierDismissible: false, // user must tap the button
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text('alert Title'),
          content: Text('Hello World를 thouch했습니다.'),
          actions: [
            TextButton(
              //다이얼러그 창이 종료될 때 다이얼러그가 가지고있는 화면은 pop한다
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text('종료'),
            ),
          ],
        );
      },
    );
  }
}//end
