import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sqlit_crud_app/database_handler.dart';
import 'package:sqlit_crud_app/insert_students.dart';
import 'package:sqlit_crud_app/students.dart';
import 'package:sqlit_crud_app/update_student.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DatabaseHandler handler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handler = DatabaseHandler();
    handler.initializeDB().whenComplete(() async {
      // await addStudents();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite for Students'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return InsertStudent();
                  },
                ),
              ).then((value) {
                setState(() {});
              });
            },
            icon: Icon(Icons.add_outlined),
          ),
        ],
      ),
      body: FutureBuilder(
        future: handler.queryStudents(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Students>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return UpdateStudent(
                            id: snapshot.data![index].id,
                            code: snapshot.data![index].code,
                            name: snapshot.data![index].name,
                            dept: snapshot.data![index].dept,
                            phone: snapshot.data![index].phone,
                          );
                        },
                      ),
                    ).then(
                      (value) {
                        setState(() {});
                      },
                    );
                  },
                  child: Dismissible(
                    key: ValueKey(index),
                    onDismissed: (direction) {
                      deleteStudent(snapshot.data![index].id!);
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Code : ${snapshot.data![index].code}'),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Name : ${snapshot.data![index].name}'),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Dept : ${snapshot.data![index].dept}'),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Phone : ${snapshot.data![index].phone}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<int> addStudents() async {
    Students firstStudents = Students(
      code: '1111',
      name: '유비',
      dept: '컴퓨터공학과',
      phone: '111-1111-1111',
    );
    Students secondStudents = Students(
      code: '2222',
      name: '장비',
      dept: '심리학과',
      phone: '222-2222-2222',
    );
    Students thirdStudents = Students(
      code: '3333',
      name: '관우',
      dept: '시각디자인학과',
      phone: '333-3333-3333',
    );
    await handler.insertStudents(firstStudents);
    await handler.insertStudents(secondStudents);
    await handler.insertStudents(thirdStudents);

    return 0;
  }

  deleteStudent(id) {
    handler.deleteStudent(id);
    Get.defaultDialog(title: '삭제완료', middleText: '삭제가 완료되었습니다', actions: [
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'))
    ]);
  }
}
