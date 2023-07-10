import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; //Icon(icons.person);에 필요
import 'package:webview_flutter/webview_flutter.dart';

import 'fitness_app/fitness_app_home_screen.dart';
import 'main.dart';
// import 'settings_tab.dart';
// import 'widgets.dart';

class LoginWebview extends StatefulWidget {

  static const title = 'Webview';
  static const androidIcon = Icon(Icons.person);
  static const iosIcon = Icon(CupertinoIcons.profile_circled);

  const LoginWebview({super.key});

  @override
  State<LoginWebview> createState() => _LoginWebviewState();
}

class _LoginWebviewState extends State<LoginWebview> {
  late final WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..loadRequest(Uri.parse('http://172.10.5.121:443/'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => FitnessAppHomeScreen()),
          );
        },
      ),
    );
  }

}