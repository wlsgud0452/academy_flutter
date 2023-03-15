import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Webview extends StatefulWidget {
  const Webview({super.key});

  @override
  State<Webview> createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}



// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class Webview extends StatefulWidget {
//   final String site;
//   const Webview({super.key, required this.site});

//   @override
//   State<Webview> createState() => _WebviewState();
// }

// class _WebviewState extends State<Webview> {
//   final Completer<WebViewController> _controller =
//       Completer<WebViewController>();
//   late bool isLoading; // for indicator
//   late String siteName; // sitename

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     isLoading = true;
//     siteName = 'www.naver.com';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           WebView(
//             initialUrl: 'https://$siteName',
//             javascriptMode: JavascriptMode.unrestricted,
//             onWebViewCreated: (WebViewController webViewController) {
//               _controller.complete(webViewController);
//             },
//             onPageFinished: (url) {
//               setState(
//                 () {
//                   isLoading = false;
//                 },
//               );
//             },
//             onPageStarted: (url) {
//               setState(
//                 () {
//                   isLoading = true;
//                 },
//               );
//             },
//           ),
//           isLoading
//               ? Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : Stack(),
//         ],
//       ),
//     );
//   }
// }
