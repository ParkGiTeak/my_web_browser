import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final WebViewController _webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://flutter.dev'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          PopupMenuButton<String>(
            onSelected: (value) {
              _webViewController.loadRequest(Uri.parse(value));
            },
            itemBuilder: (context) => [
              PopupMenuItem<String>(
                value: 'https://www.google.com',
                child: Text('구글'),
              ),
              PopupMenuItem<String>(
                value: 'https://www.naver.com',
                child: Text('네이버'),
              ),
              PopupMenuItem<String>(
                value: 'https://www.kakao.com',
                child: Text('카카오'),
              ),
            ],
          ),
        ],
        title: Text('나만의 웹브라우저'),
      ),
      body: WebViewWidget(controller: _webViewController),
    );
  }
}
