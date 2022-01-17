import 'package:flutter/material.dart';

class Todo {
  Todo(
      {required this.title,
      required this.price,
      required this.link,
      required this.note,
      required this.checked});
  final String title;
  final String price;
  final String link;
  final String note;

  bool checked;
}

class TodoItem extends StatelessWidget {
  TodoItem({
    required this.todo,
    required this.onTodoChanged,
  }) : super(key: ObjectKey(todo));

  final Todo todo;
  final onTodoChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTodoChanged(todo);
      },
      leading: Icon(todo.checked
          ? Icons.check_box_outlined
          : Icons.check_box_outline_blank),
      title: Text(todo.title,
          style: todo.checked
              ? TextStyle(
                  color: Colors.black54,
                  decoration: TextDecoration.lineThrough,
                )
              : null),
      //extension
      trailing: IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      todo.title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    content: Container(
                      height: 300,
                      width: 400,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.black,
                        width: 1,
                      )),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('price',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w800)),
                              Text(todo.price)
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('link',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w800)),
                              Text(todo.link)
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('notes',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w800)),
                              Text(todo.note)
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          icon: Icon(Icons.more_horiz_outlined)),
    );
  }
}
