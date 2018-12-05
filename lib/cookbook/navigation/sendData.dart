import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

class MasterScreen extends StatelessWidget {
  final List<Todo> todoList;

  MasterScreen({Key key, @required this.todoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Master'),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
          itemBuilder: (context, index) {
          return ListTile(
            title: Text(todoList[index].title),
            onTap: () {

            },
          );
        }),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Todo todo;

  DetailScreen({Key key, @required this.todo}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${todo.title}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('${todo.description}'),
      ),
    );
  }
}

