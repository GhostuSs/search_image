import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/model/data/subscribe.dart';
import '../../../data/model/slider_model.dart';
import '../../../project_settings/colors/color_palette.dart';
import '../../../project_settings/images/onboarding.dart';
import '../../components/onboarding/rating_dialog.dart';
import '../../components/onboarding/slider_tile.dart';
import '../../components/uikit/button.dart';

class SubscribeScreen extends StatefulWidget {
  const SubscribeScreen({Key? key}) : super(key: key);

  @override
  _SubscribeScreenState createState() => _SubscribeScreenState();
}

class _SubscribeScreenState extends State<SubscribeScreen> {
  List<SliderModel> slides = [SliderModel(
      widget: const Picture(OnBoardingImages.allImageInfo),
      title: 'All image info',
      desc: 'Subscribe to unlock all the features, just '+r'$'+'3.99/Week ')];
  int currentIndex = 0;
  PageController pageController = PageController();
  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
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
}
