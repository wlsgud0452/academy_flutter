import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Result extends StatefulWidget {
  const Result({super.key, required this.data, required this.nomal});

  final double data;
  final double nomal;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late String bmiState;
  late String resultText;
  late String normal;
  late Color fcolor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    bmiState = '';
    resultText = '';
    normal = '';
    fcolor = Colors.black;

    if (widget.data >= 25.99) {
      //비만
      bmiState = "biman.jpeg";
      resultText = "비만";
      normal = '정상체중까지 ${widget.nomal}Kg 감량하셔야 합니다.';
      fcolor = Colors.red;
    } else if (widget.data >= 23.99) {
      //과체중
      bmiState = "tongtong.jpeg";
      resultText = "과체중";
      normal = '정상체중까지 ${widget.nomal}Kg 감량하셔야 합니다.';
      fcolor = Colors.orange;
    } else if (widget.data >= 18.49) {
      //정상
      bmiState = "good.jpeg";
      resultText = "정상";
      normal = '정상체중입니다';
      fcolor = Colors.green;
    } else {
      //저체중
      bmiState = "low.jpeg";
      resultText = "저체중";
      normal = '저체중 입니다.\n 정상체중까지 ${widget.nomal}Kg 증량하셔야 합니다.';
      fcolor = Colors.blue;
    }
    print(widget.nomal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('계산결과'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/$bmiState',
            ),
            SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 10,
                  maximum: 35,
                  ranges: <GaugeRange>[
                    GaugeRange(
                      startValue: 0,
                      endValue: 18.59,
                      color: Colors.blue,
                      label: '저체중',
                      endWidth: 20,
                      startWidth: 20,
                    ),
                    GaugeRange(
                      startValue: 18.6,
                      endValue: 23.99,
                      color: Colors.green,
                      label: '정상',
                      endWidth: 20,
                      startWidth: 20,
                    ),
                    GaugeRange(
                      startValue: 24.00,
                      endValue: 25.99,
                      color: Colors.orange,
                      label: '과체중',
                      endWidth: 20,
                      startWidth: 20,
                    ),
                    GaugeRange(
                      startValue: 26.00,
                      endValue: 35,
                      color: Colors.red,
                      label: '비만',
                      endWidth: 20,
                      startWidth: 20,
                    ),
                  ],
                  pointers: <GaugePointer>[
                    NeedlePointer(
                      value: widget.data,
                      enableAnimation: true,
                      animationType: AnimationType.easeInCirc,
                    )
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      widget: Center(
                        child: Text(
                          'BMI수치\n${widget.data}\n$resultText',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      angle: 90,
                      positionFactor: 0.7,
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$normal',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: fcolor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
//정상체중까지 몇키로