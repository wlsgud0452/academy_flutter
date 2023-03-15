import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String imageName;
  late PageController page;

  @override
  void initState() {
    // TODO: implement initState

    imageName = "images/lamp_on.png";
    page = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alert를 이용한 메세지 출력',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //
            Image.asset(
              imageName,
              width: 250,
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //
                    lampOnBtn(context);
                  },
                  child: const Text(
                    "켜기",
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    //
                    lampoffBtn(context);
                  },
                  child: const Text(
                    '끄기',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  lampOnBtn(BuildContext context) {
    if (imageName == "images/lamp_on.png") {
      showDialog(
        context: context,
        barrierDismissible: false, // user must tap the button
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('경고'),
            content: const Text('현재 램프가 켜진 상태 입니다.'),
            backgroundColor: Colors.red,
            actions: [
              TextButton(
                //다이얼러그 창이 종료될 때 다이얼러그가 가지고있는 화면은 pop한다
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Center(
                  child: Text(
                    '네.알겠습니다.',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        barrierDismissible: false, // user must tap the button
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('램프 키기'),
            content: const Text('램프를 키시겠습니까?'),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      setState(() {
                        imageName = "images/lamp_on.png";
                      });
                    },
                    child: const Center(
                      child: Text('네.'),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: const Center(
                      child: Text('아니요'),
                    ),
                  ),
                ],
              )
            ],
          );
        },
      );
    }
  }

  lampoffBtn(BuildContext context) {
    if (imageName == "images/lamp_on.png") {
      showDialog(
        context: context,
        barrierDismissible: false, // user must tap the button
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('램프 끄기'),
            content: const Text('램프를 끄시겠습니까?'),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      setState(() {
                        imageName = "images/lamp_off.png";
                      });
                    },
                    child: const Center(
                      child: Text('네.'),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: const Center(
                      child: Text('아니요'),
                    ),
                  ),
                ],
              )
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        barrierDismissible: false, // user must tap the button
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('경고'),
            content: const Text('현재 램프가 꺼진 상태 입니다.'),
            actions: [
              TextButton(
                //다이얼러그 창이 종료될 때 다이얼러그가 가지고있는 화면은 pop한다
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Center(
                  child: Text(
                    '네.알겠습니다.',
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }
}
