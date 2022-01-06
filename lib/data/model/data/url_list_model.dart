import 'package:shared_preferences/shared_preferences.dart';

class UrlList {

  List<String> urlList = List.empty(growable: true);
  List<String> dateList = List.empty(growable: true);

  clearList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  saveLists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('history_urls', urlList);
    prefs.setStringList('history_dates', dateList);
  }

  Future<void> getUrlList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var gotList = prefs.getStringList('history_urls');
    if (gotList != null) {
      List<String> dataSet = List.empty(growable: true);
      for (int i = 0; i < gotList.length; i++) {
        String item;
        item = gotList[i].replaceAll('"', '');
        dataSet.add(item);
      }
      urlList=dataSet;
    } else {
      urlList=[];
    }
  }
  Future<void> getDatesList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var gotList = prefs.getStringList('history_dates');
    if (gotList != null) {
      List<String> dataSet = List.empty(growable: true);
      for (int i = 0; i < gotList.length; i++) {
        String item;
        item = gotList[i].replaceAll('"', '');
        dataSet.add(item);
      }
      dateList=dataSet;
    } else {
      dateList=[];
    }
  }

  addToUrlList(String data) async {
    print('add to url');
    print(data);
    urlList.add(data);
    await saveLists();
  }
  addToDatesList(String data) async {
    dateList.add(data);
    await saveLists();
  }
}