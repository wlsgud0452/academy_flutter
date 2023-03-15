import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Navigator_AppBar',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/SendMail');
            },
            icon: const Icon(
              Icons.mail,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/ReceivedMail');
            },
            icon: const Icon(
              Icons.mail_outline,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/SendMail');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: const Text('보낸 편지함'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ReceivedMail');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text('받은 편지함'),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('images/pi1.png'),
              ),
              accountName: const Text('Pickachu'),
              accountEmail: const Text("pickachu@naver.com"),
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              onDetailsPressed: () {
                //
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/SendMail');
              },
              leading: const Icon(
                Icons.mail,
                color: Colors.blue,
              ),
              title: const Text('보낸 편지함'),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/ReceivedMail');
              },
              leading: const Icon(
                Icons.mail_outline,
                color: Colors.red,
              ),
              title: const Text('받은 편지함'),
            ),
          ],
        ),
      ),
    );
  }
}
