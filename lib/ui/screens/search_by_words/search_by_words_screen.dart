import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_search_app/routes.dart';
import 'package:image_search_app/ui/components/uikit/textfield.dart';
import 'package:dio/dio.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../project_settings/api/api_controller.dart';
import '../../../project_settings/colors/color_palette.dart';

class SearchWordsScreen extends StatefulWidget{
  const SearchWordsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SearchWordsScreenState();
  }
}

class _SearchWordsScreenState extends State<SearchWordsScreen>{

  TextEditingController searchController = TextEditingController();
  final Dio dio=Dio();
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.black,
      appBar: CupertinoNavigationBar(
        backgroundColor: ProjectColors.darkGray,
        leading: TextButton(
          onPressed: ()=>Navigator.pop(context),
          child: Row(
              children:const [
                Icon(Icons.arrow_back_ios,color: CupertinoColors.systemBlue,size: 23,),
                Text('Back',style: TextStyle(color: CupertinoColors.systemBlue),)
              ]
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Text('Image search by words',
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Montserrat'
              ),),
          ),
          RawTextField(
              textFieldController: searchController,
              onChanged: (value){
                value=searchController.text;
              }, onSearchPressed: () async{
                await Api().searchByWordsGoogle(searchController.text);
                await Api().searchByWordsYandex(searchController.text);
                Navigator.pushNamed(context, MainNavigationRoutes.browser);
          },
          ),
            ],
      ),
    );
  }

}