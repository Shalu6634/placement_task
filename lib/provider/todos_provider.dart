//
// import 'package:flutter/cupertino.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../helper/todo_helper.dart';
// import '../modal/todo_modal.dart';
//
//
// class TodosProvider extends ChangeNotifier {
//   ApiHelper apiHelper = ApiHelper();
//
//   List todoList = [];
//   bool status = true;
//   bool theme = true;
//   Future<void> fromList() async {
//     final todo = await apiHelper.fetchDataFromApi();
//     todoList = todo.map((e) => TodoModel.fromJson(e)).toList();
//     notifyListeners();
//   }
//
//   Future<void> setStatus()
//   async {
//     status=!status;
//     SharedPreferences  preferences = await SharedPreferences.getInstance();
//     preferences.setBool('status', status);
//     notifyListeners();
//   }
//   Future<void> getStatus()
//   async {
//     status=!status;
//     SharedPreferences  preferences= await SharedPreferences.getInstance();
//     preferences.getBool('status')??false;
//     notifyListeners();
//   }
//
//   Future<void> setTheme()
//   async {
//     theme = !theme;
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     preferences.setBool('theme', theme);
//     notifyListeners();
//   }
//   Future<void> getTheme()
//   async {
//     theme = !theme;
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     preferences.getBool('theme')??false;
//     notifyListeners();
//   }
//
//   TodosProvider() {
//     fromList();
//     getStatus();
//     getTheme();
//   }
// }


import 'package:flutter/cupertino.dart';
import 'package:placement_task/modal/todo_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helper/todo_helper.dart';

class TodoProvider with ChangeNotifier {
  List<TodoModel> todos = [];
  bool isGrid = false;
  bool isDarkTheme = false;
  ApiHelper apiHelper = ApiHelper();

  Future<void> fetchTodos() async {
    List pro = await apiHelper.fetchDataFromApi();
    todos = pro.map((data) => TodoModel.fromJson(data)).toList();
    notifyListeners();
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    isGrid = prefs.getBool('isGrid') ?? false;
    isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    notifyListeners();
  }

  Future<void> screenView() async {
    isGrid = !isGrid;
    print(isGrid);
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isGrid', isGrid);
    notifyListeners();
  }

  Future<void> screenTheme() async {
    isDarkTheme = !isDarkTheme;
    print(isDarkTheme);
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkTheme', isDarkTheme);
    notifyListeners();
  }

  TodoProvider() {
    loadData();
    fetchTodos();
  }
}
