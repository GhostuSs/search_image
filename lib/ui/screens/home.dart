import 'package:flutter/material.dart';
import 'package:image_search_app/ui/components/uikit/button.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BaseButton(onPressed: () {  }, label: 'Continue',)
        ],
      ),
    );
  }
}