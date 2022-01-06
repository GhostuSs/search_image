import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_search_app/project_settings/colors/color_palette.dart';
import 'package:image_search_app/routes.dart';
import 'package:image_search_app/ui/components/uikit/ios_back_button.dart';
import 'package:image_search_app/ui/screens/settings/settings_screen.dart';
import '../../components/uikit/raw_segmented.dart';

class HistoryOfWordsScreen extends StatefulWidget {
  final String? urlGoogle;
  final String? urlYandex;
  const HistoryOfWordsScreen({Key? key, this.urlGoogle, this.urlYandex}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HistoryOfWordsScreenState();
  }
}

class _HistoryOfWordsScreenState extends State<HistoryOfWordsScreen> {
  int segmentedControlValue = 0;
  final List<CardData> _items = [
    CardData(text: 'Dog', onCardPressed: (){}),
    CardData(text: 'Cat', onCardPressed: (){})
  ];
  void onCardPressed(){
    Navigator.pushNamed(context, MainNavigationRoutes.home);
  }
  @override
  initState() {
    super.initState();
  }
  Future<String> getValue() async {
    String url;
    segmentedControlValue==0 ? url=widget.urlGoogle! : url=widget.urlYandex!;
    return url;
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: ProjectColors.black,
          appBar: const CupertinoNavigationBar(
            backgroundColor: ProjectColors.darkGray,
            leading: IosBackBtn(),
          ),
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RawSegmented(
                      tabsNames: const ['Images','Words'],
                      onValueChanged: (int? value) {
                        setState(() {
                          segmentedControlValue = value!;
                        });
                      },
                      segmentedControlValue: segmentedControlValue,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: ProjectColors.darkGray.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Column(
                      children: [
                        for(int i=0;i<_items.length;i++)InkWell(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                _items[i].iconPath!= null ? Padding(
                                    padding: const EdgeInsets.only(left: 20,right: 15,top: 10,bottom: 10),
                                    child: Image.asset(_items[i].iconPath!)
                                )
                                    :Container(width: 15,),
                                Text(
                                    _items[i].text,
                                    style: TextStyle(
                                        color: ProjectColors.white.withOpacity(0.9),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.0,
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
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
