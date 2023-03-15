import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:scheduler_semiproject_app/view/calendar.dart';
import 'package:scheduler_semiproject_app/view/sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController idController;
  late TextEditingController pwController;
  late String loginCheckStr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idController = TextEditingController();
    pwController = TextEditingController();
    loginCheckStr = '0';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo.png',
              width: 100,
            ),
            const Text(
              'Schedule 24',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[300]),
                      width: 400,
                      child: TextField(
                        controller: idController,
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.account_circle,
                              size: 35,
                            ),
                            border: InputBorder.none,
                            labelText: 'ID'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[300]),
                      width: 400,
                      child: TextField(
                        controller: pwController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.key,
                            size: 35,
                          ),
                          border: InputBorder.none,
                          labelText: 'PW',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        loginCheck();
                        //페이지 넘어가는
                        // Navigator.pop(context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return Calendar();
                        //     },
                        //   ),
                        // );
                      },
                      child: const Text('Log In'),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        //
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignIn();
                            },
                          ),
                        );
                      },
                      child: const Text('Sign Up'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  loginCheck() async {
    String id = idController.text;
    String pw = pwController.text;

    var url = Uri.parse(
      'http://localhost:8080/Flutter/calendar_semi/user_login.jsp?id=$id&pw=$pw',
    );
    var response = await http.get(url);

    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));

    List resultList = dataConvertedJSON['results'];
    loginCheckStr = resultList[0]['count'];
    print(loginCheckStr);
    if (loginCheckStr == '1') {
      _saveSharedPrefereces();
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return Calendar();
        },
      ));
    } else if (loginCheckStr == '0' ||
        idController.text.isEmpty ||
        pwController.text.isEmpty) {
      Get.defaultDialog(
        title: '로그인 실패',
        middleText: '아이디 및 비밀번호를 확인해 주세요.',
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                '확인',
                style: TextStyle(color: Colors.black),
              ))
        ],
      );
    }
  }

  _saveSharedPrefereces() async {
    final loginid = await SharedPreferences.getInstance();
    loginid.setString('userid', idController.text);
  }
}
