import 'package:flutter/material.dart';
import 'package:wewish/src/model/list_item.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../loading.dart';

class FirstTab extends StatefulWidget {
  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  final Stream<QuerySnapshot> firstStream =
      FirebaseFirestore.instance.collection("FirstTab").snapshots();
  List<Item> itemList = <Item>[];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: firstStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('불러오기에 실패하였습니다.');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingPage();
          }
          for (var doc in snapshot.data!.docs) {
            itemList.add(
                Item(doc["title"], doc["price"], doc["link"], doc["note"]));
          }
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
                      onPressed: () {},
                      icon: Icon(Icons.check_box_outline_blank)),
                  title: Text(item.title),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_drop_down_outlined)),
                );
              },
            ),
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
