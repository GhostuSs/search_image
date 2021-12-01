// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:image_search_app/project_settings/images/onboarding.dart';


class SliderModel{
  Widget widget;
  String title;
  String desc;

  SliderModel({required this.widget,required this.title,required this.desc});
}

List<SliderModel> getSlides(){
  List<SliderModel> slides = List.empty(growable: true);
  slides.add(SliderModel(
      widget: Picture(OnBoardingImages.searchForImages),
      title: 'Search for images',
      desc: "The application searches by photo,\nlink or camera shot in the search \nengines"));
   slides.add(SliderModel(
      widget: Picture(OnBoardingImages.helpUsToImprove),
      title: 'Help us to improve\nthe app',
      desc: "We're constantly improving and\nneed your opinion"));
  slides.add(SliderModel(
      widget: Picture(OnBoardingImages.searchHistory),
      title: 'Search history',
      desc: "View the images you were\nlooking for"));
  slides.add(SliderModel(
      widget: Picture(OnBoardingImages.allImageInfo),
      title: 'All image info',
      desc: 'Subscribe to unlock all the features, just '+r'$'+'3.99/Week '));
  return slides;
}

class Picture extends StatelessWidget{
  final name;
  const Picture(this.name);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:Center(child: Image.asset(name,scale: 1.5,)));
  }
}