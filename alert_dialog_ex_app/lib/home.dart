import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert and push"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _movepage(context),
          child: Text(
            "Move the 2nd page.",
          ),
        ),
      ),
    );
  }
}

_movepage(context) {
  showDialog(
    context: context,
    //barrierDismissible <- 다이얼러그 창이 아닌 다른곳을 눌러도 창이 없어지게하는거 T/F
    barrierDismissible: false, // user must tap the button
    builder: (BuildContext ctx) {
      return AlertDialog(
        title: Text('Page 이동'),
        content: Text('아래의 버튼을 누르면 페이지 이동을 합니다'),
        actions: [
          TextButton(
            //다이얼러그 창이 종료될 때 다이얼러그가 가지고있는 화면은 pop한다
            onPressed: () {
              // Navigator.of(ctx).pop();
              Navigator.pop(context);
              Navigator.pushNamed(context, '/second');
            },
            child: Text('Page 이동'),
          ),
        ],
      );
    },
  );
}
