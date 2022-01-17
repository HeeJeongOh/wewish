import 'package:flutter/material.dart';
import 'package:wewish/src/model/list_item.dart';

class FirstTab extends StatefulWidget {
  @override
  _SecondTab createState() => new _SecondTab();
}

class _SecondTab extends State<FirstTab> {
  final TextEditingController _textFieldTitle = TextEditingController();
  final TextEditingController _textFieldPrice = TextEditingController();
  final TextEditingController _textFieldLink = TextEditingController();
  final TextEditingController _textFieldNote = TextEditingController();

  final List<Todo> _todos = <Todo>[];

  @override
  Widget build(BuildContext context) {
    if (_todos.length == 0) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text('It is empty', style: TextStyle(fontSize: 16))],
        )),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            splashColor: Colors.black,
            onPressed: () => _displayDialog(),
            tooltip: 'Add Item',
            child: Icon(
              Icons.add_outlined,
            )),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          children: _todos.map((Todo todo) {
            return TodoItem(
              todo: todo,
              onTodoChanged: _handleTodoChange,
            );
          }).toList(),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            splashColor: Colors.black,
            onPressed: () => _displayDialog(),
            tooltip: 'Add Item',
            child: Icon(
              Icons.add_outlined,
            )),
      );
    }
  }

  void _handleTodoChange(Todo todo) {
    setState(() {
      todo.checked = !todo.checked;
    });
  }

  void _addTodoItem(String title, String price, String link, String note) {
    setState(() {
      _todos.add(Todo(
          title: title, price: price, link: link, note: note, checked: false));
    });
    _textFieldTitle.clear();
    _textFieldPrice.clear();
    _textFieldLink.clear();
    _textFieldNote.clear();
  }

  Future<void> _displayDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new todo item'),
          content: Container(
              height: 300,
              width: 400,
              child: Column(children: [
                TextField(
                  controller: _textFieldTitle,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.text_fields_outlined),
                      hintText: 'Type new item title'),
                ),
                TextField(
                  controller: _textFieldPrice,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.money_outlined),
                      hintText: 'Type new item price'),
                ),
                TextField(
                  controller: _textFieldLink,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.link_outlined),
                      hintText: 'Type new item link'),
                ),
                TextField(
                  controller: _textFieldNote,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.note_outlined),
                      hintText: 'Type new item notes'),
                )
              ])),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Navigator.of(context).pop();
                _addTodoItem(_textFieldTitle.text, _textFieldPrice.text,
                    _textFieldLink.text, _textFieldNote.text);
              },
            ),
          ],
        );
      },
    );
  }
}
