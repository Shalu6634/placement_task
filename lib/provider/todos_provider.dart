
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/todo_helper.dart';
import '../modal/todo_modal.dart';


class TodosProvider extends ChangeNotifier {
  ApiHelper apiHelper = ApiHelper();

  List todoList = [];

  bool status = true;
  bool theme = true;
  Future<List> fromList() async {
    final todo = await apiHelper.fetchDataFromApi();
    todoList = todo.map((e) => TodoModel.fromJson(e)).toList();
    return todoList;
  }

  Future<void> setStatus()
  async {
    status=!status;
    SharedPreferences  preferences = await SharedPreferences.getInstance();
    preferences.setBool('status', status);
    notifyListeners();
  }
  Future<void> getStatus()
  async {
    status=!status;
    SharedPreferences  prefer= await SharedPreferences.getInstance();
    prefer.getBool('status')??false;
    notifyListeners();
  }

  Future<void> setTheme()
  async {
    theme = !theme;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('theme', theme);
    notifyListeners();
  }
  Future<void> getTheme()
  async {
    theme = !theme;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.getBool('theme');
    notifyListeners();
  }

  TodosProvider() {
    fromList();
    getStatus();
    getTheme();
  }
}
