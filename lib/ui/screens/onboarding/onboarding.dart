import 'package:flutter/material.dart';
import 'package:image_search_app/data/model/slider_model.dart';
import 'package:image_search_app/project_settings/colors/color_palette.dart';
import 'package:image_search_app/ui/components/onboarding/rating_dialog.dart';
import 'package:image_search_app/ui/components/uikit/button.dart';
import 'package:image_search_app/ui/components/onboarding/slider_tile.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/model/data/subscribe.dart';

class OnBoardingScreen extends StatefulWidget{
  const OnBoardingScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _OnBoardingScreen();
  }

}

class _OnBoardingScreen extends State<OnBoardingScreen> {
  List<SliderModel> slides = List.empty(growable: true);
  int currentIndex = 0;
  PageController pageController = PageController();
  @override
  void initState() {
    super.initState();
    slides = getSlides();
  }
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ProjectColors.black,
      body: Container(
        child: PageView.builder(
            controller: pageController,
            onPageChanged: (val)=>setState((){currentIndex=val;}),
            itemBuilder: (context,index){
              return SliderTile(
                index:index,
                flag: index ==slides.length-1 ? true : false,
                widget: slides[index].widget,
                title: slides[index].title,
                desc: slides[index].desc,
              );
            }
        ),
      ),
      floatingActionButton: currentIndex==slides.length-1
          ?floatingBtm('Continue',() async {
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setBool('subscribe', true);
            context.read<Subscribe>().status=await prefs.getBool('subscribe') ?? true;
            Navigator.pushNamed(context, '/');

            },width,height)
          :floatingBtm('Continue',onContinue,width,height),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  Future<void> onContinue() async {
    if (currentIndex==1) await showDialog(context: context,builder: (context)=>const RateMyApp());
    setState(() {
      currentIndex++;
      pageController.animateToPage(
          currentIndex, duration: const Duration(milliseconds: 300),
          curve: Curves.linear);
    });
  }
  void onStartFree(){
    Navigator.pushNamed(context, '/');
  }
  Widget floatingBtm(String text,onPressed,width,height){
    return Container(
      padding: EdgeInsets.symmetric(vertical: height<700 ? height*0.033 : height*0.055),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:EdgeInsets.only(left: 60.0,right: 60.0,top:height*0.01,bottom: height*0.01),
            child: BaseButton(
              onPressed: onPressed,
            label: 'Continue',
            ),
          ),
          currentIndex==slides.length-1 ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: const Text(
                    'Privacy Policy',
                    style: TextStyle(
                        color: ProjectColors.textLightGray,
                        fontFamily: 'Montserrat',
                        fontSize: 12.0
                    ),
                  ),
                  onTap: ()=>{},
                ),
                SizedBox(width: height*0.043),
                InkWell(
                  child: const Text(
                    'Restore',
                    style: TextStyle(
                        color: ProjectColors.textLightGray,
                        fontFamily: 'Montserrat',
                        fontSize: 12.0
                    ),
                  ),
                  onTap: ()=>{},
                ),
                SizedBox(width: height*0.043),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height*0.01),
                  child: InkWell(
                    child: const Text(
                      'Terms of Use',
                      style: TextStyle(
                          color: ProjectColors.textLightGray,
                          fontFamily: 'Montserrat',
                          fontSize: 12.0
                      ),
                    ),
                    onTap: ()=>{},
                  ),
                )
              ]
          ) : const Text(''),
        ],
      ),
    );
  }
}
