import 'dart:async';

import 'package:flutter/material.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    siteName = 'www.naver.com';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.amber,
        title: Column(
          children: [
            const Text(
              'WebView',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () {
                    setState(() {
                      siteName = "www.google.co.kr/search?q=ss";
                    });
                    _reloadSite();
                  },
                  child: const Text('Google'),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  onPressed: () {
                    setState(() {
                      siteName =
                          "search.naver.com/search.naver?where=nexearch&sm=top_sug.pre&fbm=0&acr=2&acq=ss&qdt=0&ie=utf8&query=asd";
                    });
                    _reloadSite();
                  },
                  child: const Text('naver'),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  onPressed: () {
                    setState(() {
                      siteName = "www.daum.net";
                    });
                    _reloadSite();
                  },
                  child: const Text('Daum'),
                ),
              ],
            )
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
            return FloatingActionButton(
              onPressed: () {
                controller.data!.goBack();
              },
              child: const Icon(Icons.arrow_back),
            );
          }
          return Stack();
        },
      ),
    );
  }
  // --- function

  _reloadSite() {
    _controller.future.then((value) => value.loadUrl('https://$siteName'));
  }
}// End
