import 'package:bmi_app/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late double bmiHeight_value;
  late double bmiHeight_slider;
  late double bmiWidth_value;
  late double bmiWidth_slider;
  late double bmi;
  late double nomal;

  @override
  void initState() {
    super.initState();
    bmiHeight_value = 160;
    bmiHeight_slider = 0.5;
    bmiWidth_value = 75;
    bmiWidth_slider = 0.5;
    bmi = 0.0;
    nomal = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI계산기"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Text(
                "신장(cm)",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.amber),
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$bmiHeight_value",
                      style: const TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Slider(
                      value: bmiHeight_slider,
                      onChanged: (value) {
                        inputHeight(value);
                      },
                      thumbColor: Colors.white,
                      activeColor: Colors.white,
                      inactiveColor: Colors.amber.shade800,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "체중(kg)",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.amber),
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$bmiWidth_value",
                      style: const TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Slider(
                      value: bmiWidth_slider,
                      onChanged: (value) {
                        inputWidth(value);
                      },
                      thumbColor: Colors.white,
                      activeColor: Colors.white,
                      inactiveColor: Colors.amber.shade800,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      clac();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Result(
                            data: bmi,
                            nomal: nomal,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "계산하기",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(100, 50),
                        backgroundColor: Colors.amber[700]),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  inputHeight(value) {
    setState(() {
      bmiHeight_value = ((value * 120) + 100);
      bmiHeight_value = double.parse(bmiHeight_value.toStringAsFixed(1));
      bmiHeight_slider = value;
    });
  }

  inputWidth(value) {
    setState(() {
      bmiWidth_value = ((value * 120) + 30);
      bmiWidth_value = double.parse(bmiWidth_value.toStringAsFixed(1));
      bmiWidth_slider = value;
    });
  }

  clac() {
    bmi = bmiWidth_value / ((bmiHeight_value / 100) * (bmiHeight_value / 100));
    bmi = double.parse(bmi.toStringAsFixed(2));

    if (bmi >= 24) {
      nomal = 23 * ((bmiHeight_value / 100) * (bmiHeight_value / 100));
      nomal = bmiWidth_value - nomal;
      nomal = double.parse(nomal.toStringAsFixed(2));
    } else {
      nomal = 18.5 * ((bmiHeight_value / 100) * (bmiHeight_value / 100));
      nomal = bmiWidth_value - nomal;
      nomal = double.parse(nomal.toStringAsFixed(2));
      nomal = nomal.abs();
    }

    //if써서 변수 두개로 ㄱㄱ 저체중
  }
}

//키 170㎝에 몸무게 73kg이면, 계산식 : 73 / (1.7×1.7)
//MI가 18.5 이하면 저체중 ／
//18.5 ~ 22.9 사이면 정상 ／
//23.0 ~ 24.9 사이면 과체중 ／
//25.0 이상부터는 비만
