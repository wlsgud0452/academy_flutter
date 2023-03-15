import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:shared_prefereces_login_app/second_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
//state

//observer
//위에서 모든것을 감시하고 있다. 메모리에 상주하고 있음.
class _LoginState extends State<Login> with WidgetsBindingObserver {
  late AppLifecycleState _LastappLifecycleState;
  //** */
  late TextEditingController userIdController;
  late TextEditingController PasswordController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //*******
    WidgetsBinding.instance.addObserver(this);

    userIdController = TextEditingController();
    PasswordController = TextEditingController();
    _initSharedPreferences(); // SharedPreference 초기화
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    switch (state) {
      //라이프사이클 개어렵누
      case AppLifecycleState.detached:
        //앱이 메모리에서 사라졌을 때
        print('detached');
        break;
      case AppLifecycleState.resumed:
        print('resumed');
        break;
      case AppLifecycleState.inactive:
        print('incative');
        break;
      case AppLifecycleState.paused:
        _dispseSharedPreferences();
        print('paused');
        break;
    }
    _LastappLifecycleState = state;
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: userIdController,
              decoration: const InputDecoration(labelText: 'ID'),
            ),
            TextField(
              controller: PasswordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                _nullCheck();
              },
              child: const Text("Log In"),
            ),
          ],
        ),
      ),
    );
  }

  //---- function ---
  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userIdController.text = (prefs.getString('p_userid') ?? "");
      PasswordController.text = (prefs.getString('p_password') ?? "");

      print(userIdController.text);
      print(PasswordController.text);
    });
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('환영 합니다.'),
          content: const Text("신분이 확인 되었습니다."),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _saveSharedPrefereces();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SecondPage();
                      },
                    ),
                  );
                },
                child: const Text("OK"))
          ],
        );
      },
    );
  }

  _saveSharedPrefereces() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('p_userid', userIdController.text);
    pref.setString('p_password', PasswordController.text);
  }

  _dispseSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();

    pref.clear();
  }

  _nullCheck() {
    if (userIdController.text.isEmpty) {
      Get.snackbar("error", "아이디 또는 비밀번호를 입력해주세요",
          snackPosition: SnackPosition.BOTTOM);
    } else {
      _showDialog(context);
    }
  }

  //---- End ---
}
