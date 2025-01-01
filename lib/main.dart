import 'package:flutter/material.dart';
import 'package:placement_task/provider/todos_provider.dart';
import 'package:placement_task/view/todosPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      builder:  (context, child) =>MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    TodoProvider todosProviderTrue =
    Provider.of<TodoProvider>(context, listen: true);
    TodoProvider todosProviderFalse =
    Provider.of<TodoProvider>(context, listen: false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: todosProviderTrue.isDarkTheme==false?ThemeMode.light:ThemeMode.dark,
      home: const TodosPage(),
    );
  }
}
