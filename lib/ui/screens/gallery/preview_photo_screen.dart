import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_search_app/project_settings/colors/color_palette.dart';
import 'package:image_search_app/ui/components/uikit/appbar.dart';
import 'dart:io';
import 'package:image_search_app/ui/components/uikit/ios_back_button.dart';
import '../../../project_settings/api/api_controller.dart';

class PreviewPhotoScreen extends StatefulWidget{
  const PreviewPhotoScreen({Key? key, required this.image}) : super(key: key);

  final File image;
  @override
  State<StatefulWidget> createState() {
    return _PreviewPhotoScreenState();
  }
}

class _PreviewPhotoScreenState extends State<PreviewPhotoScreen>{
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.black,
      appBar: InnerAppBar(
        automaticalyImplyLeading: false,
        title: 'Gallery',
        backBtn: const IosBackBtn(),
        actions: [
          TextButton(
              onPressed: () async {
                await Api().uploadImage(widget.image);
                },
              child: const Text(
                'Ok',
                style: TextStyle(
                    color: CupertinoColors.systemBlue,
                    fontSize: 18
                ),
              )
          )
        ],

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.file(widget.image)
        ],
      ),
    );
  }
}