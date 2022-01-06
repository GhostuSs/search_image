import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_search_app/project_settings/colors/color_palette.dart';
import 'package:image_search_app/ui/components/uikit/ios_back_button.dart';
import 'package:provider/src/provider.dart';
import '../../../data/model/data/url_list_model.dart';
import '../../../data/model/data/words_list_model.dart';
import '../../../project_settings/api/api_controller.dart';
import '../../components/uikit/raw_segmented.dart';
import '../browser/browser_page.dart';

class HistoryScreen extends StatefulWidget {
  final String? urlGoogle;
  final String? urlYandex;
  const HistoryScreen({Key? key, this.urlGoogle, this.urlYandex}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HistoryScreenState();
  }
}

class _HistoryScreenState extends State<HistoryScreen> {

  int segmentedControlValue = 0;
  Widget returnableWidget=Container();

  void _selector() {

    switch (segmentedControlValue) {
      case 0:
        {
          setState(() {
            returnableWidget = Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: ProjectColors.darkGray.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Column(
                  children: [
                    for(int i = 0; i < context
                        .read<UrlList>()
                        .urlList
                        .length; i++)InkWell(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            const SizedBox(width: 15),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0)
                              ),
                              width: 32,
                              height: 32,
                              child: Image.network(context
                                  .read<UrlList>()
                                  .urlList[i]),
                            ),
                            Text(
                                context.read<UrlList>().dateList[i],
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
                      onTap: () async {
                        //TODO: implement function which will navigate you to url page
                        final word = context
                            .read<WordList>()
                            .wordList[i];
                        String? urlGoogle = await Api().searchByWordsGoogle(
                            word);
                        String? urlYandex = await Api().searchByWordsYandex(
                            word);
                        Navigator.push(context, MaterialPageRoute(builder: (
                            BuildContext ctx) =>
                            BrowserPage(
                              urlGoogle: urlGoogle, urlYandex: urlYandex,)));
                      },
                    )
                  ],
                ),
              ),
            );
          });
        }
        break;
      case 1 :
        {
          setState(() {
            returnableWidget = Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: ProjectColors.darkGray.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Column(
                  children: [
                    for(int i = 0; i < context
                        .read<WordList>()
                        .wordList
                        .length; i++)InkWell(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            const SizedBox(width: 15),
                            Text(
                                context
                                    .read<WordList>()
                                    .wordList[i],
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
                      onTap: () async {
                        final word = context
                            .read<WordList>()
                            .wordList[i];
                        String? urlGoogle = await Api().searchByWordsGoogle(
                            word);
                        String? urlYandex = await Api().searchByWordsYandex(
                            word);
                        Navigator.push(context, MaterialPageRoute(builder: (
                            BuildContext ctx) =>
                            BrowserPage(
                              urlGoogle: urlGoogle, urlYandex: urlYandex,)));
                      },
                    )
                  ],
                ),
              ),
            );
          });
        }
    }
  }

  Future<void> _getData() async {
    context.read<WordList>().wordList=await context.read<WordList>().getList();
    await context.read<UrlList>().getUrlList();
    await context.read<UrlList>().getDatesList();
  }

  @override
  initState() {
    _selector();
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _selector();
    print(context.read<UrlList>().dateList);
    print(context.read<UrlList>().urlList);
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
                returnableWidget
              ],
            ),
          ),
        ));
  }
}
