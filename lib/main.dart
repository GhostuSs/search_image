import 'package:flutter/material.dart';
import 'package:image_search_app/data/model/data/subscribe.dart';
import 'package:image_search_app/project_settings/colors/color_palette.dart';
import 'package:image_search_app/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/model/data/url_list_model.dart';
import 'data/model/data/words_list_model.dart';


bool seen=false;
bool subscribe = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  seen = prefs.getBool("seen") ?? false;
  await prefs.setBool("seen", true);
  subscribe = prefs.getBool("subscribe") ?? false;
  runApp(const App());
}

class App extends StatefulWidget{
  const App({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _App();
  }
}

class _App extends State<App>{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<UrlList>(create: (_) => UrlList()),
          Provider<WordList>(create: (_) => WordList()),
          Provider<Subscribe>(create: (_) => Subscribe()),
        ],
        child: MaterialApp(
            theme: ThemeData.dark(),
            color: ProjectColors.white,
            debugShowCheckedModeBanner: false,
            initialRoute:returnableRoute(seen, subscribe),
            routes: routes
        ));
  }
  String returnableRoute(bool seen,bool subscribe){
    String route=MainNavigationRoutes.onboarding;
    if(seen&&subscribe){
      route=MainNavigationRoutes.home;
    }else{
      if(!subscribe&&!seen){
        route=MainNavigationRoutes.onboarding;
      }else{
        if(!subscribe&&seen){
          route=MainNavigationRoutes.subscribe;
        }
      }
    }
    
    return route;
  }

}
