import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_search_app/ui/components/uikit/textfield.dart';

import '../../../project_settings/api/api_controller.dart';
import '../../../project_settings/colors/color_palette.dart';
import '../browser/browser_page.dart';

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
            child: Text('Insert link to start search',
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
              String? urlGoogle = await Api().searchByImageGoogle(searchController.text);
              String? urlYandex = await Api().searchByImageYandex(searchController.text);
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx)=>BrowserPage(urlGoogle: urlGoogle,urlYandex: urlYandex,)));
            },
          )
        ],
      ),
    );
  }

}