import 'package:flutter/material.dart';
import 'package:sqlit_crud_app/database_handler.dart';
import 'package:sqlit_crud_app/students.dart';

class UpdateStudent extends StatefulWidget {
  final id;
  final code;
  final name;
  final dept;
  final phone;

  const UpdateStudent(
      {super.key, this.id, this.code, this.name, this.dept, this.phone});

  @override
  State<UpdateStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {
  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController deptController;
  late TextEditingController phoneController;

  late DatabaseHandler handler;

  late int id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    codeController = TextEditingController();
    nameController = TextEditingController();
    deptController = TextEditingController();
    phoneController = TextEditingController();

    handler = DatabaseHandler();

    id = widget.id;

    codeController.text = widget.code;
    nameController.text = widget.name;
    deptController.text = widget.dept;
    phoneController.text = widget.phone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update for CRUD',
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
                readOnly: true,
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
                    updateStudent();
                    Navigator.pop(context);
                  },
                  child: const Text('수정'))
            ],
          ),
        ),
      ),
    );
  }

  Future<int> updateStudent() async {
    Students update = Students(
      id: id,
      code: codeController.text,
      name: nameController.text,
      dept: deptController.text,
      phone: phoneController.text,
    );
    await handler.updateStudents(update);
    return 0;
  }

  Future<int> codeCheck() async {
    await handler.codeCheck(codeController.text);
    
    return 0;
  }
}
