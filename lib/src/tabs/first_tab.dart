import 'package:flutter/material.dart';
import 'package:wewish/src/model/list_item.dart';

class FirstTab extends StatefulWidget {
  final List<Item> itemList;
  const FirstTab({Key? key, required this.itemList}) : super(key: key);
  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  List<Item> itemList = <Item>[];

  @override
  void initState() {
    super.initState();
    itemList = widget.itemList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        // Let the ListView know how many items it needs to build.
        itemCount: itemList.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
          final item = itemList[index];

          return ListTile(
            leading: IconButton(
                onPressed: () {}, icon: Icon(Icons.check_box_outline_blank)),
            title: Text(item.title),
            trailing: IconButton(
                onPressed: () {}, icon: Icon(Icons.arrow_drop_down_outlined)),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
