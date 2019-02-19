import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  static const _appTitle = 'Todo List';
  final todoList = <String>[];
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appTitle),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: textEditingController,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (BuildContext context, int index) {
                  final todo = todoList[index];

                  return Dismissible(
                    key: Key('$todo$index'),
                    onDismissed: (direction) => todoList.removeAt(index),
                    child: ListTile(title: Text(todo),),
                    background: Container(color: Colors.red,),
                  );
                }
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            todoList.add(textEditingController.text);
            textEditingController.clear();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
