
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget{
  final String url;
  final int selector;
  const WebViewPage({Key? key, required this.selector, required this.url}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WebViewPageState();
  }
}

class _WebViewPageState extends State<WebViewPage>{

  late WebViewController _webViewController;


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height*0.85,
      child: WebView(
        onWebViewCreated: (controller)=>_webViewController.loadUrl('f'), //TODO:Imlement func url    tutorial https://www.youtube.com/watch?v=rNCQ54kFgFY
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://www.google.com',
      ),
    );
  }

}