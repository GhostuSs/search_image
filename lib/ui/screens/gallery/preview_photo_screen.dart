import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_search_app/data/model/data/url_list_model.dart';
import 'package:image_search_app/project_settings/colors/color_palette.dart';
import 'package:image_search_app/ui/components/uikit/appbar.dart';
import 'dart:io';
import 'package:image_search_app/ui/components/uikit/ios_back_button.dart';
import 'package:image_search_app/ui/screens/browser/browser_page.dart';
import 'package:provider/src/provider.dart';
import '../../../data/model/data/subscribe.dart';
import '../../../project_settings/api/api_controller.dart';
import '../../../project_settings/api/base_url.dart';
import '../../../project_settings/api/routes/api_routes.dart';

class PreviewPhotoScreen extends StatefulWidget{
  const PreviewPhotoScreen({Key? key, required this.image}) : super(key: key);

  final File image;
  @override
  State<StatefulWidget> createState() {
    return _PreviewPhotoScreenState();
  }
}

class _PreviewPhotoScreenState extends State<PreviewPhotoScreen>{
  bool flag =true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ProjectColors.black,
      appBar: InnerAppBar(
        automaticalyImplyLeading: false,
        title: 'Gallery',
        backBtn: const IosBackBtn(),
        actions: [
          flag ? TextButton(
              onPressed: () async {
                setState(() {
                  flag=false;
                });
                await Api().uploadImage(widget.image,context);
                final String? urlGoogle = BaseUrl.google+ApiRoutes.searchByImageGoogle+context.read<UrlList>().urlList.last;
                print('Ok pressed: $urlGoogle');
                final String? urlYandex = await Api().searchByUrlYandex(context.read<UrlList>().urlList.last);
                setState(() {
                  flag=true;
                });
                if(context.read<Subscribe>().quantities<6){
                  context.read<Subscribe>().quantities++;
                  Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>BrowserPage(urlGoogle: urlGoogle,urlYandex: urlYandex,)));
                }else{
                  Navigator.pushNamed(context, '/subscribe');
                }
              },
              child: Text(
                'Ok',
                style: TextStyle(
                    color: CupertinoColors.systemBlue,
                    fontSize: height*0.02
                ),
              )
          ) : const Padding(padding: EdgeInsets.only(right: 20),child: CupertinoActivityIndicator(),)
        ],

      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Image.file(widget.image)
          ],
        ),
      ),
    );
  }
}