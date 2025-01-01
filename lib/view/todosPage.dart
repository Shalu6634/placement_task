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
    TodoProvider todosProviderTrue =
        Provider.of<TodoProvider>(context, listen: true);
    TodoProvider todosProviderFalse =
        Provider.of<TodoProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              todosProviderFalse.screenTheme();
            },
            child: Icon(
              todosProviderTrue.isDarkTheme == false
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          ),
          centerTitle: true,
          title: const Text('TODO APP'),
          actions: [
            IconButton(
              onPressed: () {
                todosProviderFalse.screenView();
              },
              icon:
                  Icon(todosProviderTrue.isGrid ? Icons.grid_view : Icons.list),
            ),
          ],
        ),
        body: Consumer<TodoProvider>(
          builder: (context, provider, child) {
            if (provider.todos.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              );
            }
            return (todosProviderTrue.isGrid
                ? GridView.builder(
                    itemCount: todosProviderTrue.todos.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                                    todosProviderTrue.todos[index].title
                                        .toString(),
                                    style: TextStyle(
                                      letterSpacing: 0.2,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      decoration: todosProviderTrue
                                                  .todos[index].completed ==
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
                                    (todosProviderTrue.todos[index].completed!
                                        ? 'Completed'
                                        : 'Pending'),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: todosProviderTrue
                                                  .todos[index].completed ==
                                              true
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                  ),
                                  Checkbox(
                                      value: todosProviderTrue
                                          .todos[index].completed,
                                      onChanged: (value) {},
                                      activeColor: Colors.green),
                                ],
                              )
                            ]),
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: todosProviderTrue.todos.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 3,
                        shadowColor: Colors.blueGrey,
                        child: ListTile(
                          leading: Text(
                            todosProviderTrue.todos[index].id.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          title: Text(
                              todosProviderTrue.todos[index].title.toString(),
                              style: TextStyle(
                                  decoration: todosProviderTrue
                                              .todos[index].completed ==
                                          true
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                          subtitle: Text(
                            (todosProviderTrue.todos[index].completed!
                                ? 'Completed'
                                : 'Pending'),
                            style: TextStyle(
                              color: todosProviderTrue.todos[index].completed ==
                                      true
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                          trailing: Checkbox(
                              value: todosProviderTrue.todos[index].completed,
                              onChanged: (value) {},
                              activeColor: Colors.green),
                        ),
                      );
                    },
                  ));
          },
        ));
  }
}
