class TodoModel {
  int? userId, id;
  String? title;
  bool? completed;

  TodoModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  factory TodoModel.fromJson(Map m1) {
    return TodoModel(
        userId: m1['userId'],
        id: m1['id'],
        title: m1['title'],
        completed: m1['completed']);
  }
}
