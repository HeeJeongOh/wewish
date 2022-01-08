import 'package:flutter/material.dart';
import 'tabs/first_tab.dart';
import 'tabs/fourth_tab.dart';
import 'tabs/second_tab.dart';
import 'tabs/third_tab.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String first = "의류";
  String second = "악세사리";
  String third = "신발";
  String fourth = "여행";
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
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: Colors.black, style: BorderStyle.solid, width: 1)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  DefaultTabController(
                      length: 4, // length of tabs
                      initialIndex: 0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: TabBar(
                                labelColor: Colors.black,
                                indicatorColor: Colors.black,
                                unselectedLabelColor: Colors.black,
                                tabs: [
                                  Tab(text: first),
                                  Tab(text: second),
                                  Tab(text: third),
                                  Tab(text: fourth),
                                ],
                              ),
                            ),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.768,
                                color: Colors.white,
                                child: TabBarView(children: <Widget>[
                                  Container(
                                    child: Center(child: FirstTab()),
                                  ),
                                  Container(
                                    child: const Center(child: SecondTab()),
                                  ),
                                  Container(
                                    child: const Center(child: ThirdTab()),
                                  ),
                                  Container(
                                    child: const Center(child: FourthTab()),
                                  ),
                                ]))
                          ])),
                ]),
          ),
        ));
  }
}
