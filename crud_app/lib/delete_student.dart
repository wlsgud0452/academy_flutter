import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class DeleteStudent extends StatefulWidget {
  final String code;
  final String name;
  final String dept;
  final String phone;
  const DeleteStudent(
      {super.key,
      required this.code,
      required this.name,
      required this.dept,
      required this.phone});

  @override
  State<DeleteStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<DeleteStudent> {
  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController deptController;
  late TextEditingController phoneController;

  late String code;
  late String name;
  late String dept;
  late String phone;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    codeController = TextEditingController();
    nameController = TextEditingController();
    deptController = TextEditingController();
    phoneController = TextEditingController();

    codeController.text = widget.code;
    nameController.text = widget.name;
    deptController.text = widget.dept;
    phoneController.text = widget.phone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete for CRUD'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextField(
                controller: codeController,
                decoration: InputDecoration(
                  hintText: '학번입니다.',
                ),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: '성명을 수정하세요.',
                ),
              ),
              TextField(
                controller: deptController,
                decoration: InputDecoration(
                  hintText: '전공을 수정하세요.',
                ),
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  hintText: '전화번호를 수정하세요.',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    code = codeController.text;

                    getJSONData();
                  },
                  child: Text('삭제'))
            ],
          ),
        ),
      ),
    );
  }

  getJSONData() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/student_delete_flutter.jsp?code=$code');
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
          content: Text('삭제가 완료 되었습니다.'),
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
}
