import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_list_app/insert.dart';
import 'package:firebase_list_app/message.dart';
import 'package:firebase_list_app/student.dart';
import 'package:firebase_list_app/update.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase List'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Insert(),
                ),
              );
            },
            icon: const Icon(Icons.add_outlined),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('students') //테이블 이름
            .orderBy('code', descending: false) //정렬 code로 정렬하겠다
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final douments = snapshot.data!.docs;
          return ListView(
            children: douments.map((e) => _buildItemWidget(e)).toList(),
          );
        },
      ),
    );
  } //funtions

  Widget _buildItemWidget(DocumentSnapshot doc) {
    final student = Student(
        code: doc['code'],
        name: doc['name'],
        dept: doc['dept'],
        phone: doc['phone']);
    return Dismissible(
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: const Icon(Icons.delete_forever),
      ),
      key: ValueKey(doc),
      onDismissed: (direction) {
        FirebaseFirestore.instance.collection('students').doc(doc.id).delete();
      },
      child: Container(
        color: Colors.amberAccent,
        child: GestureDetector(
          onTap: () {
            Message.id = doc.id;
            Message.code = doc['code'];
            Message.name = doc['name'];
            Message.dept = doc['dept'];
            Message.phone = doc['phone'];
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Update(),
              ),
            );
          },
          child: Card(
            child: ListTile(
              title: Text(
                  '학번 : ${student.code}\n이름 : ${student.name}\n학과 : ${student.dept}\n전화번호 ${student.phone}'),
            ),
          ),
        ),
      ),
    );
  }
}//---end
