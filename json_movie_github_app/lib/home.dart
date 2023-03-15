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
        title: const Text('Network JSON Test'),
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
          GestureDetector(
            onTap: () {
              //
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.network(
                    data[index]['image'],
                    width: 60,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    data[index]['title'],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> getJSONData() async {
    var url = Uri.parse('https://zeushahn.github.io/Test/movies.json');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    setState(() {
      data.addAll(result);
    });
    

    return true;
  }
}
