import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_search_app/project_settings/colors/color_palette.dart';
import 'package:image_search_app/ui/screens/browser/webview.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../components/uikit/raw_segmented.dart';

class BrowserPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BrowserPageState();
  }
}

class _BrowserPageState extends State<BrowserPage> {
  int segmentedControlValue = 0;

  @override
  Widget build(BuildContext context) {
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
                WebViewPage(selector: null,)
              ],
            ),
          ),
        ));
  }
}
