// import 'package:flutter/material.dart';
// import 'package:placement_task/provider/todos_provider.dart';
// import 'package:placement_task/view/todosPage.dart';
// import 'package:provider/provider.dart';
//
// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => TodoProvider(),
//       builder:  (context, child) =>MyApp(),
//     ),
//   );
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     TodoProvider todosProviderTrue =
//     Provider.of<TodoProvider>(context, listen: true);
//     TodoProvider todosProviderFalse =
//     Provider.of<TodoProvider>(context, listen: false);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.light(),
//       darkTheme: ThemeData.dark(),
//       themeMode: todosProviderTrue.isDarkTheme==false?ThemeMode.light:ThemeMode.dark,
//       home: const TodosPage(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Daily_task_day2/view/detailScreen.dart';
import 'Daily_task_day2/view/homeScreen.dart';
import 'Daily_task_day2/view/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/details', page: () => DetailsScreen()),
      ],
    );
  }
}