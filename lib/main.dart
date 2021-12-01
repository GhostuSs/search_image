import 'package:flutter/material.dart';
import 'package:image_search_app/project_settings/colors/color_palette.dart';
import 'package:image_search_app/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/model/data/data_model.dart';


bool seen=false;
bool subscribe=false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  seen = prefs.getBool("seen") ?? false;
  await prefs.setBool("seen", true);
  subscribe = prefs.getBool("subscribe") ?? false;
  seen=false;
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
          Provider<Data>(create: (_) => Data()),
        ],
        child: MaterialApp(
            theme: ThemeData.dark(),
            color: ProjectColors.white,
            debugShowCheckedModeBanner: false,
            initialRoute: seen ? '/' : "/onboarding" ,
            routes: routes
        ));
  }

}