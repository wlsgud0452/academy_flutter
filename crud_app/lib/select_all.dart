import 'dart:convert';

import 'package:crud_app/delete_student.dart';
import 'package:crud_app/insert_student.dart';
import 'package:crud_app/update_student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart' as http;

class SelectAll extends StatefulWidget {
  const SelectAll({super.key});

  @override
  State<SelectAll> createState() => _SelectAllState();
}

class _SelectAllState extends State<SelectAll> {
  late List data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [];
    getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD for Students'),
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
              ).then((value) => getJsonData());
            },
            icon: const Icon(Icons.add_outlined),
          )
        ],
      ),
      body: Center(
        child: data.isEmpty
            ? const Text('데이터가 없습니다.')
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    key: ValueKey(index),
                    endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        dismissible: DismissiblePane(onDismissed: () {
                          Delete(index);
                        }),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateStudent(
                                      code: data[index]['code'],
                                      dept: data[index]['dept'],
                                      name: data[index]['name'],
                                      phone: data[index]['phone']),
                                ),
                              ).then((value) => getJsonData());
                            },
                            backgroundColor: Color(0xFF21B7CA),
                            foregroundColor: Colors.white,
                            icon: Icons.replay,
                            label: 'Update',
                          ),
                          SlidableAction(
                            onPressed: (context) {
                              Delete(index);
                            },
                            backgroundColor: Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ]),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateStudent(
                                code: data[index]['code'],
                                dept: data[index]['dept'],
                                name: data[index]['name'],
                                phone: data[index]['phone']),
                          ),
                        ).then((value) => getJsonData());
                      },
                      onLongPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DeleteStudent(
                                code: data[index]['code'],
                                dept: data[index]['dept'],
                                name: data[index]['name'],
                                phone: data[index]['phone']),
                          ),
                        ).then((value) => getJsonData());
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text('Code : '),
                                  Text(data[index]['code']),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text('Name : '),
                                  Text(data[index]['name']),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text('Dept : '),
                                  Text(data[index]['dept']),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text('Phone : '),
                                  Text(data[index]['phone']),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  } //---function

  Future<bool> getJsonData() async {
    data.clear();
    var url =
        Uri.parse('http://localhost:8080/Flutter/student_query_flutter.jsp');
    var response = await http.get(url);

    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    print(response.body);
    List result = dataConvertedJSON['results'];
    print(result);
    setState(() {
      data.addAll(result);
    });
    return true;
  }

  Delete(index) async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/student_delete_flutter.jsp?code=${data[index]['code']}');
    //await http.post(url);
    await http.get(url);
    _deleteShowDialog(context);
  }

  _deleteShowDialog(BuildContext context) {
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
                  //Navigator.pop(context);
                  setState(() {
                    getJsonData();
                  });
                },
                child: Text('OK'))
          ],
        );
      }),
    );
  }
}//End
