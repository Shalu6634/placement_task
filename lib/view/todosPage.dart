import 'package:flutter/material.dart';
import 'package:placement_task/provider/todos_provider.dart';
import 'package:provider/provider.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  @override
  Widget build(BuildContext context) {
    TodosProvider todosProviderTrue =
        Provider.of<TodosProvider>(context, listen: true);
    TodosProvider todosProviderFalse =
        Provider.of<TodosProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading:  GestureDetector(
          onTap: (){
            todosProviderFalse.setTheme();
          },
          child: Icon(
            todosProviderTrue.theme==false?Icons.light_mode:Icons.dark_mode,

          ),
        ),
        centerTitle: true,
        title: const Text('TODO APP'),
        actions: [
          IconButton(
            onPressed: () {
              todosProviderFalse.setStatus();
            },
            icon: Icon(todosProviderTrue.status ? Icons.list : Icons.grid_view),
          ),
        ],
      ),
      body: (
          todosProviderTrue.status
          ? ListView.builder(
              itemCount: todosProviderTrue.todoList.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  shadowColor: Colors.blueGrey,
                  child: ListTile(
                    leading: Text(
                      todosProviderTrue.todoList[index].id.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    title: Text(
                        todosProviderTrue.todoList[index].title.toString(),
                        style: TextStyle( decoration:
                        todosProviderTrue.todoList[index].completed ==
                            true
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    subtitle: Text(
                      (todosProviderTrue.todoList[index].completed
                          ? 'Completed'
                          : 'Pending'),
                      style: TextStyle(
                        color:
                            todosProviderTrue.todoList[index].completed == true
                                ? Colors.green
                                : Colors.red,
                      ),
                    ),
                    trailing: Checkbox(
                        value: todosProviderTrue.todoList[index].completed,
                        onChanged: (value) {},
                        activeColor: Colors.green),
                  ),
                );
              },
            )
          : GridView.builder(
              itemCount: todosProviderTrue.todoList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(1.0),
                child: Card(
                  elevation: 6,
                  shadowColor: Colors.blueGrey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          title: Center(
                            child: Text(
                              todosProviderTrue.todoList[index].title.toString(),
                              style: TextStyle(
                                letterSpacing: 0.2,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                decoration:
                                    todosProviderTrue.todoList[index].completed ==
                                            true
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              (todosProviderTrue.todoList[index].completed
                                  ? 'Completed'
                                  : 'Pending'),
                              style: TextStyle(
                                fontSize: 15,
                                color:
                                    todosProviderTrue.todoList[index].completed ==
                                            true
                                        ? Colors.green
                                        : Colors.red,
                              ),
                            ),
                            Checkbox(
                                value:
                                    todosProviderTrue.todoList[index].completed,
                                onChanged: (value) {},
                                activeColor: Colors.green),
                          ],
                        )
                      ]),
                ),
              ),
            )),
    );
  }
}
