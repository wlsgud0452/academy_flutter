import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [];
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Test'),
      ),
      body: Center(
        child: data.isEmpty
            //? const CircularProgressIndicator()
            ? CupertinoActivityIndicator()
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return cardBuild(context, index);
                },
              ),
      ),
    );
  }

  Widget cardBuild(BuildContext context, int index) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Code : ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                data[index]['code'],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Name : ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                data[index]['name'],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Dept : ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                data[index]['dept'],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Phone : ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                data[index]['phone'],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- functions ---

  Future<bool> getJSONData() async {
    var url = Uri.parse('https://zeushahn.github.io/Test/student2.json');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    setState(() {
      data.addAll(result);
    });
    print(result);

    return true;
  }
}
