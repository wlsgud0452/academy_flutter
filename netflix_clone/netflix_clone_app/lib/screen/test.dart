import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('URL Launcher'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final url = Uri.parse(
                  'https://dev-yakuza.posstree.com/en/',
                );
                if (await canLaunchUrl(url)) {
                  launchUrl(url);
                } else {
                  // ignore: avoid_print
                  print("Can't launch $url");
                }
              },
              child: const Text('Web Link'),
            ),
            ElevatedButton(
              onPressed: () async {
                final url = Uri(
                  scheme: 'mailto',
                  path: 'dev-yakuza@gmail.com',
                  query: 'subject=Hello&body=Test',
                );
                if (await canLaunchUrl(url)) {
                  launchUrl(url);
                } else {
                  // ignore: avoid_print
                  print("Can't launch $url");
                }
              },
              child: const Text('Mail to'),
            ),
            ElevatedButton(
              onPressed: () async {
                final url = Uri.parse('tel:+1 555 010 999');
                if (await canLaunchUrl(url)) {
                  launchUrl(url);
                } else {
                  // ignore: avoid_print
                  print("Can't launch $url");
                }
              },
              child: const Text('Tel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final url = Uri.parse('sms:5550101234');
                if (await canLaunchUrl(url)) {
                  launchUrl(url);
                } else {
                  // ignore: avoid_print
                  print("Can't launch $url");
                }
              },
              child: const Text('SMS'),
            ),
          ],
        ),
      ),
    );
  }
}
