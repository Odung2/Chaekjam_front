import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; //Icon(icons.person);에 필요
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'fitness_app/fitness_app_home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class MyWebView extends StatefulWidget {
  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  InAppWebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('WebView Popup Example'),
      // ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse('http://172.10.5.121:443/auth/kakao')),
        onWebViewCreated: (controller) {
          _webViewController = controller;
        },
        onLoadStart: (controller, url) {
          // Handle URL loading events here
        },
        onLoadStop: (controller, url) async {
          if (url.toString().contains('/auth/success/')) {
            final String parameter = url.toString().split('/auth/success/').last;
            // Save the parameter to shared preferences
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('success_parameter', parameter);
            myFunction();

            // Redirected to the desired URL, navigate to the next screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => FitnessAppHomeScreen()),
            );
          }
        },
      ),
    );
  }
}

void myFunction() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String? successParameter = prefs.getString('success_parameter');

  // Use the retrieved value as needed
  print(successParameter);
}

