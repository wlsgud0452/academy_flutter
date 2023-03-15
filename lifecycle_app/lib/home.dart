import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _buttonState;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _buttonState = "off";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter Life Cycle",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _onClick();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: const Text(
                "버튼을 누르세요",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("버튼 상태 :"),
                const SizedBox(
                  width: 10,
                ),
                Text(_buttonState)
              ],
            )
          ],
        ),
      ),
    );
  }

  _onClick() {
    //setState 이게 있어야 화면의 상태를 바꿔준다.
    //이게 없으면 화면을 재실행해야 화면이 바뀜
    setState(() {
      print("onclick()이 호출됨");
      if (_buttonState == 'OFF') {
        _buttonState = 'ON';
      } else {
        _buttonState = "OFF";
      }
    });
    print(_buttonState);
  }

  //End
}
