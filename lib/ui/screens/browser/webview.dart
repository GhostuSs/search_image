
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget{
  const WebViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WebViewPageState();
  }
}

class _WebViewPageState extends State<WebViewPage>{
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height*0.85,
      child: const WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://www.google.com',
      ),
    );
  }

}