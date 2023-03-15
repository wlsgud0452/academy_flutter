import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlit_crud_app/database_handler.dart';
import 'package:sqlit_crud_app/students.dart';

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

  late DatabaseHandler handler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    codeController = TextEditingController();
    nameController = TextEditingController();
    deptController = TextEditingController();
    phoneController = TextEditingController();

    handler = DatabaseHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Insert for CRUD',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextField(
                controller: codeController,
                decoration: const InputDecoration(labelText: '학번을 입력하세요.'),
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: '성명을 입력하세요.'),
              ),
              TextField(
                controller: deptController,
                decoration: const InputDecoration(labelText: '전공을 입력하세요.'),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: '전화번호를 입력하세요.'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    insertStudent();
                  },
                  child: const Text('입력'))
            ],
          ),
        ),
      ),
    );
  }

  Future<int> insertStudent() async {
    Students insertStudents = Students(
      code: codeController.text,
      name: nameController.text,
      dept: deptController.text,
      phone: phoneController.text,
    );

    await handler.insertStudents(insertStudents);
    insertDialog();
    return 0;
  }

  insertDialog() {
    Get.defaultDialog(title: '입력완료', middleText: '입력이 완료되었습니다', actions: [
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pop(context);
          },
          child: const Text('OK'))
    ]);
  }
}
