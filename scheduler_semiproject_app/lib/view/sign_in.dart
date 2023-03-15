import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController idController;
  late TextEditingController pwController;
  late TextEditingController pwCheckController;
  late TextEditingController nicknameController;

  late Text pwCheckStr;
  late String id;
  late String pw;
  late String nickname;
  // late Text tel;
  late String resultCheckId;
  late int pwCheck;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nicknameController = TextEditingController();
    idController = TextEditingController();
    pwController = TextEditingController();
    pwCheckController = TextEditingController();

    pwCheckStr = const Text('');
    pwCheck = 0;
    resultCheckId = '';
    id = '';
    pw = '';
    nickname = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Sign In'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    '닉네임 ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Flexible(
                child: TextField(
                  controller: nicknameController,
                  decoration: const InputDecoration(labelText: '닉네임'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Text(
                    'ID',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: idController,
                      decoration: const InputDecoration(labelText: '아이디'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      idCheck();
                    },
                    child: const Text(
                      '중복확인',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Text(
                    'PW',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              TextField(
                controller: pwController,
                decoration: const InputDecoration(labelText: '비밀번호'),
                obscureText: true,
                onChanged: (value) {
                  setState(
                    () {
                      if (pwController.text != pwCheckController.text) {
                        pwCheck = 0;
                        pwCheckStr = const Text(
                          '비밀번호가 일치하지 않습니다.',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      } else {
                        pwCheck = 1;
                        pwCheckStr = const Text(
                          '비밀번호가 일치합니다',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }
                    },
                  );
                },
              ),
              TextField(
                controller: pwCheckController,
                decoration: const InputDecoration(labelText: '비밀번호 확인'),
                obscureText: true,
                onChanged: (value) {
                  setState(
                    () {
                      if (pwController.text.trim() !=
                          pwCheckController.text.trim()) {
                        pwCheck = 0;
                        pwCheckStr = const Text(
                          '비밀번호가 일치하지 않습니다.',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      } else {
                        pwCheck = 1;
                        pwCheckStr = const Text(
                          '비밀번호가 일치합니다',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }
                    },
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              pwCheckStr,
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (nicknameController.text.trim().isEmpty) {
                        Get.defaultDialog(
                          title: '닉네임 확인',
                          middleText: '닉네임을 입력해주세요',
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
                      if (resultCheckId == '1' || idController.text.isEmpty) {
                        Get.defaultDialog(
                          title: '아이디 중복확인',
                          middleText: '아이디를 확인해주세요',
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
                      if (pwCheck == 0 ||
                          pwCheckController.text.trim().isEmpty) {
                        Get.defaultDialog(
                          title: '비밀번호 확인',
                          middleText: '비밀번호가 일치하지 않습니다',
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
                      } else {
                        pwCheck = 1;
                      }
                      if (nicknameController.text.trim().isNotEmpty &&
                          resultCheckId == '0' &&
                          pwCheck == 1 &&
                          idController.text.isNotEmpty) {
                        pw = pwController.text;
                        nickname = nicknameController.text;
                        id = idController.text;
                        insertSigin();
                      } else {
                        resultCheckId = '1';
                      }
                    });
                  },
                  child: Text('가입하기'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  insertSigin() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/calendar_semi/user_insert.jsp?id=$id&pw=$pw&nickname=$nickname');
    //await http.post(url);
    await http.get(url);
    _showDialog(context);
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: Text('회원가입'),
          content: Text('회원가입이 완료 되었습니다.'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pop(context);
                },
                child: Text('OK'))
          ],
        );
      }),
    );
  }

  Future<bool> idCheck() async {
    String checkid = idController.text;
    String title = '';
    String content = '';
    var url = Uri.parse(
        'http://localhost:8080/Flutter/calendar_semi/user_id_check.jsp?id=$checkid');
    var response = await http.get(url);

    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));

    List resultList = dataConvertedJSON['results'];
    resultCheckId = resultList[0]['count'];

    if (resultCheckId == '0') {
      Get.defaultDialog(
        title: '사용가능',
        middleText: '사용가능한 아이디 입니다.',
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
      resultCheckId = '0';
    } else if (resultCheckId == '1') {
      Get.defaultDialog(
        title: '사용불가',
        middleText: '사용 불가한 아이디 입니다.',
        titleStyle: TextStyle(color: Colors.red),
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
      resultCheckId = '1';
    }
    return true;
  }

  _showIdCheckDialog(BuildContext context, String title, String content) {
    {
      showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        }),
      );
    }
  }
}
