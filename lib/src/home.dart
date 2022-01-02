import 'package:flutter/material.dart';

import 'model/list_item.dart';
import 'tabs/fifth_tab.dart';
import 'tabs/first_tab.dart';
import 'tabs/fourth_tab.dart';
import 'tabs/second_tab.dart';
import 'tabs/third_tab.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  final String index;
  HomePage(this.index);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> _list = [];
  late CollectionReference collectionReference;

  @override
  void initState() {
    super.initState();
    switch (widget.index) {
      case "first":
        {
          // _list.clear();
          collectionReference =
              FirebaseFirestore.instance.collection('FirstTab');
          break;
        }
      case "second":
        {
          // currentStream = firestore.collection("FirstTab").snapshots();
          break;
        }
      case "third":
        {
          // currentStream = firestore.collection("FirstTab").snapshots();
          break;
        }
      case "fourth":
        {
          //currentStream = firestore.collection("FirstTab").snapshots();
          break;
        }
      default:
        {
          //currentStream = firestore.collection("FirstTab").snapshots();
          break;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: kToolbarHeight * 1.5,
          backgroundColor: Colors.white10,
          elevation: 0,
          title: const Center(
              child: Image(
            image: AssetImage('assets/images/wewish_2.png'),
            width: 250,
          )),
        ),
        body: FutureBuilder<DocumentSnapshot>(
            future: collectionReference.doc(collectionReference.path).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const LinearProgressIndicator();
              }
              List<dynamic>? docs = snapshot.data!.data() as List;
              for (var doc in docs) {
                _list.add(
                    Item(doc["title"], doc["price"], doc["link"], doc["note"]));
              }
              return Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        DefaultTabController(
                            length: 5, // length of tabs
                            initialIndex: 0,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Container(
                                    child: const TabBar(
                                      labelColor: Colors.redAccent,
                                      indicatorColor: Colors.white,
                                      unselectedLabelColor: Colors.black,
                                      tabs: [
                                        Tab(text: '여행'),
                                        Tab(text: '향수'),
                                        Tab(text: '빈노트'),
                                        Tab(text: '빈노트'),
                                        Tab(text: '빈노트'),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.765, //height of TabBarView

                                      decoration: BoxDecoration(
                                          border: Border(
                                              top: BorderSide(
                                                  color: Colors.black,
                                                  width: 1,
                                                  style: BorderStyle.solid))),
                                      child: TabBarView(children: <Widget>[
                                        Container(
                                          child: const Center(
                                              child: FirstTab(itemList: _list)),_
                                        ),
                                        Container(
                                          child:
                                              const Center(child: SecondTab()),
                                        ),
                                        Container(
                                          child:
                                              const Center(child: ThirdTab()),
                                        ),
                                        Container(
                                          child:
                                              const Center(child: FourthTab()),
                                        ),
                                        Container(
                                          child:
                                              const Center(child: FifthTab()),
                                        ),
                                      ]))
                                ])),
                      ]),
                ),
              );
            }));
  }
}
