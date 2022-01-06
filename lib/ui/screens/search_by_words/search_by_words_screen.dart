
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_search_app/data/model/data/words_list_model.dart';
import 'package:image_search_app/ui/components/uikit/ios_back_button.dart';
import 'package:image_search_app/ui/components/uikit/textfield.dart';
import 'package:dio/dio.dart';
import 'package:image_search_app/ui/screens/browser/browser_page.dart';
import 'package:provider/src/provider.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.black,
      appBar: const CupertinoNavigationBar(
        backgroundColor: ProjectColors.darkGray,
        leading: IosBackBtn(),
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
                String? urlGoogle = await Api().searchByWordsGoogle(searchController.text);
                String? urlYandex = await Api().searchByWordsYandex(searchController.text);
                await context.read<WordList>().addList(searchController.text);
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx)=>BrowserPage(urlGoogle: urlGoogle,urlYandex: urlYandex,)));
          },
          ),
            ],
      ),
    );
  }

}