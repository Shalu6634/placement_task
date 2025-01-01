import 'package:flutter/material.dart';
import 'package:placement_task/provider/todos_provider.dart';
import 'package:placement_task/view/todosPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      builder:  (context, child) =>MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    TodosProvider todosProviderTrue =
    Provider.of<TodosProvider>(context, listen: true);
    TodosProvider todosProviderFalse =
    Provider.of<TodosProvider>(context, listen: false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: todosProviderTrue.theme==false?ThemeMode.light:ThemeMode.dark,
      home: const TodosPage(),
    );
  }
}
