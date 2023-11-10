import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column (children: [WebViewWidget(controller: ControllerCallback())
        WebView(
          initialUrl: 'https://www.example.com',
          javascriptMode: JavascriptMode.unrestricted,
        ),

        ],)
      ),
    );
  }
}
