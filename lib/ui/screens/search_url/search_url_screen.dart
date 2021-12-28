import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_search_app/ui/components/uikit/appbar.dart';
import 'package:image_search_app/ui/components/uikit/textfield.dart';

import '../../../project_settings/colors/color_palette.dart';

class SearchUrlScreen extends StatefulWidget{
  const SearchUrlScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SearchUrlScreenState();
  }
}

class _SearchUrlScreenState extends State<SearchUrlScreen>{

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.black,
      appBar: CupertinoNavigationBar(
        backgroundColor: ProjectColors.darkGray,
        leading: InkWell(
          onTap: ()=>Navigator.pop(context),
          child: Row(
            children:const [
            Icon(Icons.arrow_back_ios,color: CupertinoColors.systemBlue,size: 23,),
              Text('Back',style: TextStyle(color: CupertinoColors.systemBlue),)
            ]
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 40),

          RawTextField(
              textFieldController: searchController,
              onChanged: (value){
                value=searchController.text;
              }
          )
        ],
      ),
    );
  }

}