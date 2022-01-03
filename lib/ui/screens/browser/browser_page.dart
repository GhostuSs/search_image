import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_search_app/project_settings/colors/color_palette.dart';
import 'package:image_search_app/ui/screens/browser/webview.dart';
import '../../components/uikit/raw_segmented.dart';

class BrowserPage extends StatefulWidget {
  final String? urlGoogle;
  final String? urlYandex;
  const BrowserPage({Key? key, this.urlGoogle, this.urlYandex}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BrowserPageState();
  }
}

class _BrowserPageState extends State<BrowserPage> {
  int segmentedControlValue = 0;
  late Future<String> _value;

  @override
  initState() {
    super.initState();
    _value = getValue();
  }
  Future<String> getValue() async {
    String url;
    segmentedControlValue==0 ? url=widget.urlGoogle! : url=widget.urlYandex!;
    return url;
  }
  @override
  Widget build(BuildContext context) {
    _value = getValue();
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: ProjectColors.black,
          appBar: CupertinoNavigationBar(
            backgroundColor: ProjectColors.darkGray,
            leading: TextButton(
              onPressed: () => Navigator.pop(context),
              child: Row(children: const [
                Icon(
                  Icons.arrow_back_ios,
                  color: CupertinoColors.systemBlue,
                  size: 23,
                ),
                Text(
                  'Back',
                  style: TextStyle(color: CupertinoColors.systemBlue),
                )
              ]),
            ),
          ),
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RawSegmented(
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
                FutureBuilder(
                  future: _value,
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot,) {
                    print(snapshot.connectionState);
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(color: ProjectColors.orange,)
                          ],),
                      );
                    } else{
                      print(snapshot.data);
                      return WebViewPage(url: snapshot.data!);
                    }
                  },
                )
                //WebViewPage(url: widget.url!)
              ],
            ),
          ),
        ));
  }
}
