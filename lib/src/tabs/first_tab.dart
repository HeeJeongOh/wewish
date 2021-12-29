import 'package:flutter/material.dart';
import 'package:wewish/src/model/list_item.dart';

class FirstTab extends StatefulWidget {
  const FirstTab({Key? key}) : super(key: key);
  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  final items = List<Item>.generate(
      12, (i) => Item('제주도 $i', '30,000', 'www.naver.com', ''));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        // Let the ListView know how many items it needs to build.
        itemCount: items.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
          final item = items[index];

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
