import 'package:flutter/material.dart';

void main() {
  final todos = List.generate(
    20,
    (i) => ToDo(
      'Todo $i',
      'A description of what needs to be done for Todo $i',
    ),
  );
  runApp(Nav2App(todos: todos, title: "todoList"));
}

class ToDo {
  final String title;
  final String description;
  ToDo(this.title, this.description);
}

class Nav2App extends StatelessWidget {
  const Nav2App({Key? key, required this.todos, required String title})
      : super(key: key);

  final List<ToDo> todos;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      //passing in the ListView.builder
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return Card(child: ListTile(
            title: Text(todos[index].title),
            onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(todo: todos[index]),
          ),
        );
      },
          ));
        },
      ),
    ));
  }
}

class DetailScreen extends StatelessWidget {
  // In the constructor, require a Todo.
  const DetailScreen({Key? key, required this.todo}) : super(key: key);

  // Declare a field that holds the Todo.
  final ToDo todo;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return MaterialApp(
        home: Scaffold(
        appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    ));
  }
}
