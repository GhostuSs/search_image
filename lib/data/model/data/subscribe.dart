import 'package:shared_preferences/shared_preferences.dart';

class Subscribe{
  bool status=false;
  int quantities=0;

  Future<void> checkStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    status = prefs.getBool('subscribe') ?? false;
  }
}