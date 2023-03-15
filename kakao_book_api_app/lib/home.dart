import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        title: Text('Kakao Book API'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getJSONdata();
        },
        child: const Icon(Icons.file_download),
      ),
    );
  }

  Future<String> getJSONdata() async {
    var url = Uri.parse(
        'https://dapi.kakao.com/v3/search/book?target=title&query=미움받을 용기');
    var response = await http.get(url,
        headers: {'Authorization': 'KakaoAK 78e4a96f0a619861ceaa19e715b5f5a2'});
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['documents'];
    print(result[1]['datetime']);
    return 'success';
  }
}
