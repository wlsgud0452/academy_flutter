import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InsertStudent extends StatefulWidget {
  const InsertStudent({super.key});

  @override
  State<InsertStudent> createState() => _InsertStudentState();
}

class _InsertStudentState extends State<InsertStudent> {
  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController deptController;
  late TextEditingController phoneController;

  late String code;
  late String name;
  late String dept;
  late String phone;

  late String codeCheck;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    codeController = TextEditingController();
    nameController = TextEditingController();
    deptController = TextEditingController();
    phoneController = TextEditingController();
    codeCheck = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert for CRUD'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextField(
                controller: codeController,
                decoration: InputDecoration(hintText: '학번을 입력해주세요'),
                keyboardType: TextInputType.text,
              ),
              TextButton(
                  onPressed: () {
                    //
                    code = codeController.text;
                    idCheck();
                  },
                  child: Text('중복체크')),
              TextField(
                controller: nameController,
                decoration: InputDecoration(hintText: '이름을 입력해주세요'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: deptController,
                decoration: InputDecoration(hintText: '전공을 입력해주세요'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(hintText: '전화번호을 입력해주세요'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    code = codeController.text;
                    name = nameController.text;
                    dept = deptController.text;
                    phone = phoneController.text;
                    getJSONData();
                  },
                  child: Text('입력'))
            ],
          ),
        ),
      ),
    );
  }

  getJSONData() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/student_insert_flutter.jsp?code=$code&name=$name&dept=$dept&phone=$phone');
    //await http.post(url);
    await http.get(url);
    _showDialog(context);
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: Text('입력결과'),
          content: Text('입력이 완료 되었습니다.'),
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
    var url = Uri.parse(
        'http://localhost:8080/Flutter/student_id_check_flutter.jsp?code=$code');
    var response = await http.get(url);

    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    setState(() {
      codeCheck = result[0]['count'];
      _idDialog(context);
    });
    return true;
  }

  _idDialog(context) {
    String result;
    if (codeController.text.isNotEmpty) {
      if (codeCheck == '1') {
        result = "같은 학번이 있습니다.";
      } else {
        result = "사용가능한 학번입니다.";
      }
    } else {
      result = "학번을 입력해주세";
    }

    showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: Text('중복체크결과'),
          content: Text(result),
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
