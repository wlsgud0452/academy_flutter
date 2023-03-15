import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late String userId;
  late String userPw;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userId = '';
    userPw = '';
    _initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SecondPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('user ID : $userId'),
            Text('user PW : $userPw'),
          ],
        ),
      ),
    );
  } // ---- function ----

  _initSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      userId = (pref.getString('p_userid'))!;
      userPw = (pref.getString('p_password'))!;
    });
  }
} // ---- End ----
