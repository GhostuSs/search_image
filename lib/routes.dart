import 'package:flutter/material.dart';
import 'package:image_search_app/ui/screens/home.dart';
import 'package:image_search_app/ui/screens/onboarding/onboarding.dart';
import 'package:image_search_app/ui/screens/search_url/search_url_screen.dart';
import 'package:image_search_app/ui/screens/settings/settings_screen.dart';

abstract class MainNavigationRoutes{

  static const String home = '/';
  static const String settings = '/settings';
  static const String onboarding = '/onboarding';
  static const String searchUrl = '/searchurl';
}
final routes = {
  MainNavigationRoutes.home: (BuildContext context) => HomePage(),
  MainNavigationRoutes.onboarding: (BuildContext context) => const OnBoardingScreen(),
  MainNavigationRoutes.settings: (BuildContext context) => const SettingsScreen(),
  MainNavigationRoutes.searchUrl: (BuildContext context) => const SearchUrlScreen(),
};

