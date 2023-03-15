import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List imageName;
  late int currentImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png'
    ];
    currentImage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("무한이미지 반복"),
        backgroundColor: Colors.red,
      ),
      body: SimpleGestureDetector(
        onHorizontalSwipe: _onSwipe,
        onVerticalSwipe: _onSwipe,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                imageName[currentImage],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'images/${imageName[currentImage]}',
                  width: 350,
                  height: 500,
                  fit: BoxFit.contain,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _previousButton();
                    },
                    child: const Text("<<이전"),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _nextButton();
                    },
                    child: Text("다음>>"),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  } //

  _onSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.left || direction == SwipeDirection.up) {
        currentImage = (currentImage + 1) % imageName.length;
      }
      if (direction == SwipeDirection.right ||
          direction == SwipeDirection.down) {
        currentImage = (currentImage - 1) % imageName.length;
      }
    });
  }

  _nextButton() {
    setState(() {
      currentImage = (currentImage + 1) % imageName.length;
    });
  }

  _previousButton() {
    setState(() {
      currentImage = (currentImage - 1) % imageName.length;
    });
  }
}//
