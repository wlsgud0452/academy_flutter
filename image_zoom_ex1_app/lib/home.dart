import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String imageName;
  late double slidervalue;
  late double lampSize;
  late bool lampOnOff;
  late double lampRotationstate;
  late double lampAngle;
  late bool lampColor;
  late double allvalue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageName = 'images/lamp_on.png';
    slidervalue = 0.5;
    lampSize = 150;
    lampOnOff = true;
    lampRotationstate = 0.5;
    lampAngle = 360;
    lampColor = false;
    allvalue = 0.5;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Image 확대 및 축소'),
      // ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 350,
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RotationTransition(
                      turns: AlwaysStoppedAnimation(lampAngle / 360),
                      child: Image.asset(
                        imageName,
                        width: lampSize,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    '전구 각도조절',
                  ),
                  CupertinoSlider(
                    value: lampRotationstate,
                    onChanged: (value) {
                      lampRotation(value);
                    },
                  ),
                  Text(
                    '전구 크기조절',
                  ),
                  CupertinoSlider(
                    value: slidervalue,
                    onChanged: (value) {
                      changeLampSize(value);
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            '전구 스위치',
                          ),
                          CupertinoSwitch(
                            value: lampOnOff,
                            onChanged: (value) {
                              lampState(value);
                            },
                            // Switch(
                            //   value: lampOnOff,
                            //   onChanged: (value) {
                            //     lampState(value);
                            //   },
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            '전구 색깔',
                          ),
                          CupertinoSwitch(
                            value: lampColor,
                            onChanged: (value) {
                              lampColorState(value);
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  Text(
                    '돌리면서 크기바꾸고 색도바꿔버려',
                  ),
                  CupertinoSlider(
                    value: allvalue,
                    onChanged: (value) {
                      allvalueState(value);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.red,
        items: <Widget>[
          Icon(
            Icons.add,
            size: 30,
          ),
          Icon(
            Icons.list,
            size: 30,
          ),
          Icon(
            Icons.compare_arrows,
            size: 30,
          ),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  } //--function--

  changeLampSize(value) {
    setState(() {
      slidervalue = value;
      lampSize = value * 280 + 20;
    });
  }

  lampState(value) {
    setState(() {
      lampOnOff = value;
      if (lampOnOff == true) {
        imageName = 'images/lamp_on.png';
        lampOnOff == false;
      } else {
        imageName = 'images/lamp_off.png';
        lampOnOff == true;
      }
    });
  }

  lampRotation(value) {
    setState(() {
      lampRotationstate = value;
      lampAngle = value * 720;
    });
  }

  lampColorState(value) {
    setState(() {
      lampColor = value;
      if (lampColor == true) {
        imageName = 'images/lamp_red.png';
        lampOnOff == false;
      } else {
        imageName = 'images/lamp_on.png';
        lampOnOff == true;
      }
    });
  }

  allvalueState(value) {
    setState(() {
      double state = 0;
      String strState = '';
      allvalue = value;
      lampAngle = value * 720;
      lampSize = value * 280 + 20;
      state = ((value * 50) % 2);
      strState = state.toStringAsFixed(0);

      switch (strState) {
        case '2':
          imageName = 'images/lamp_off.png';
          break;

        case '1':
          imageName = 'images/lamp_red.png';

          break;
        case '0':
          imageName = 'images/lamp_on.png';

          break;
      }
    });
  }
}//end
