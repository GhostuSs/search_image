import 'package:flutter/material.dart';
import 'package:image_search_app/ui/screens/home.dart';
import 'package:image_search_app/ui/screens/onboarding.dart';

var routes = {
  '/': (BuildContext context) => HomePage(),
  '/onboarding': (BuildContext context) => const OnBoardingScreen(),
};