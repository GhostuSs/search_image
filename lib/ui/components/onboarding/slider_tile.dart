import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_search_app/project_settings/colors/color_palette.dart';
import 'package:image_search_app/project_settings/typography/app_typography.dart';


class SliderTile extends StatelessWidget {
  final String  title, desc;
  final int index;
  final Widget widget;
  final bool flag;
  const SliderTile(
      {Key? key, required this.widget,
        required this.title,
        required this.desc,
        required this.flag, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.topRight,
              child: flag
                  ? Padding(
                padding: EdgeInsets.only(
                    right: 20, top: height*0.06),
                child: InkWell(
                  onTap: ()=>Navigator.pushNamed(context, '/'),
                  child: const SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(
                      CupertinoIcons.clear,
                      color: ProjectColors.textLightGray,
                      size: 30.0,
                    ),
                  ),
                ),
              )
                  : Padding(
                padding: EdgeInsets.only(top: height*0.09),
                child: const Text(''),
              )),
          SizedBox(height:height*0.01),
          height>700 ? SizedBox(height: height*0.1,):const Text(''),
          Center(
            child: Column(
              children: [
                flag ? const Text('') :SizedBox(height: height*0.03),
                widget,
                SizedBox(height: height*0.035),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      fontSize: height*0.028
                    ),
                  ),
                ),
                SizedBox(height: height*0.01),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.014),
                    child: Text(desc,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          color: ProjectColors.textLightGray,
                          fontSize: height*0.022,
                          fontFamily: 'Montserrat'
                        )
                    )
                ),
              ],
            ),
          ),
        ]);
  }
}