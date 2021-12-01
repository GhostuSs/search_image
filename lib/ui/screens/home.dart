import 'package:flutter/material.dart';
import 'package:image_search_app/project_settings/colors/color_palette.dart';
import 'package:image_search_app/ui/components/uikit/appbar.dart';
import 'package:image_search_app/ui/components/uikit/button.dart';
import 'package:image_search_app/ui/components/uikit/settings_card.dart';

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
      backgroundColor: ProjectColors.black,
      appBar: InnerAppBar(automaticalyImplyLeading: false, title: 'Search',),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawCard(
            textDown: 'Camera',
            iconDown: Icons.camera,
            iconUp: Icons.photo,
            textUp: 'Photo',
            onPressedDown: (){print('phot');},
            onPressedUp: (){print('cam');},
          )
        ],
      ),
    );
  }
}