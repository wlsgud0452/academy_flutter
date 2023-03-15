import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late bool isLoading; // for indicator
  late String siteName; // sitename

  late TextEditingController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    siteName = 'www.naver.com';
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                onSubmitted: (value) {
                  _searchSite();
                },
                controller: controller,
                decoration: InputDecoration(hintText: '주소를 입력해주세요'),
              ),
            ),
            IconButton(
                onPressed: () {
                  _searchSite();
                },
                icon: Icon(Icons.search))
          ],
        ),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://$siteName',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onPageFinished: (url) {
              setState(() {
                isLoading = false;
              });
            },
            onPageStarted: (url) {
              setState(() {
                isLoading = true;
              });
            },
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
      floatingActionButton: FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (BuildContext context,
            // 메모리 부분에 화면을 스냅샷 찍어 놓는다고 보면 된다.
            AsyncSnapshot<WebViewController> controller) {
          if (controller.hasData) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    controller.data!.goBack();
                  },
                  child: const Icon(Icons.arrow_back),
                  backgroundColor: Colors.red,
                ),
                FloatingActionButton(
                  onPressed: () {
                    controller.data!.reload();
                  },
                  child: const Icon(Icons.replay),
                  backgroundColor: Colors.amber,
                ),
                FloatingActionButton(
                  onPressed: () {
                    controller.data!.goForward();
                  },
                  child: const Icon(Icons.arrow_forward),
                ),
              ],
            );
          }
          return Stack();
        },
      ),
    );
  }

  _reloadSite() {
    _controller.future.then((value) => value.loadUrl('https://$siteName'));
  }

  _searchSite() {
    String search = '';
    if (controller.text.contains(' ')) {
      search = controller.text.replaceAll(' ', '+');
    }
    print(utf8.encode(search));

    _controller.future.then(
        (value) => value.loadUrl('https://www.google.co.kr/search?q=$search'));
  }
}
