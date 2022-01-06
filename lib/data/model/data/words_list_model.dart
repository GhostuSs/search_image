import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class WordList {
  List<String> wordList = List.empty(growable: true);

  clearList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  saveList(List<String> gotList) async {
    List list = gotList;
    list = list.map((item) => json.encode(item)).toList();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('history_words', list as List<String>);
    print('saved in func');
  }

  Future<List<String>> getList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var gotList = prefs.getStringList('history_words');
    if (gotList != null) {
      print('got non-null list');
      print(gotList);
      List<String> dataSet = List.empty(growable: true);
      for (int i = 0; i < gotList.length; i++) {
        String item;
        item = gotList[i].replaceAll('"', '');
        dataSet.add(item);
      }
      return dataSet;
    } else {
      return [];
    }
  }

  addList(String data) async {
    List<String> list = await getList();
    list.add(data);
    for (int i = 0; i < list.length; i++) {
      print(list[i]);
    }
    await saveList(list);
  }

  removeLast() async {
    List<String> list = await getList();
    list.removeLast();
    await saveList(list);
  }
}