import 'package:flutter/material.dart';
import 'package:image_search_app/ui/components/uikit/appbar.dart';
import 'package:image_search_app/ui/components/uikit/ios_back_button.dart';

import '../../../project_settings/colors/color_palette.dart';
import '../../../project_settings/images/icons.dart';

class SettingsScreen extends StatefulWidget{
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SettingsScreenState();
  }
}

class _SettingsScreenState extends State<SettingsScreen>{
  
  final List<CardData> _items = [
    CardData(text: 'Rate app', iconPath: AppIcons.favorite, onCardPressed: (){}),
    CardData(text: 'Share', iconPath: AppIcons.share, onCardPressed: (){}),
    CardData(text: 'Privacy policy', iconPath: AppIcons.privacy, onCardPressed: (){}),
    CardData(text: 'Term of use', iconPath: AppIcons.term, onCardPressed: (){}),
    CardData(text: 'Support', iconPath: AppIcons.support, onCardPressed: (){})
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ProjectColors.black,
      appBar: const InnerAppBar(
        automaticalyImplyLeading: false,
        backBtn: IosBackBtn(),
        title: 'Settings',
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Container(
            decoration: BoxDecoration(
              color: ProjectColors.darkGray.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              children: [
                for(int i=0;i<_items.length;i++)InkWell(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: height*0.005),
                    child: Row(
                      children: [
                        _items[i].iconPath!= null ? Padding(
                            padding: EdgeInsets.only(left: 20,right: 15,top: height*0.01,bottom: height*0.01),
                            child: Image.asset(_items[i].iconPath!)
                        )
                            :Container(),
                        Text(
                            _items[i].text,
                            style: TextStyle(
                                color: ProjectColors.white.withOpacity(0.9),
                                fontWeight: FontWeight.w500,
                                fontSize: height*0.026,
                                fontFamily: 'JosefinSans-SemiBold'
                            )
                        ),
                        const Spacer(),
                        const Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: ProjectColors.textLightGray,
                            )
                        )
                      ],
                    ),
                  ),
                  onTap: _items[i].onCardPressed,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}

class CardData{
  CardData({required this.text,this.iconPath, required this.onCardPressed});
  
  final String text;
  final String? iconPath;
  final void Function() onCardPressed;
}