import 'package:flutter/material.dart';

class FifthTab extends StatefulWidget {
  const FifthTab({Key? key}) : super(key: key);
  @override
  _FifthTabState createState() => _FifthTabState();
}

class _FifthTabState extends State<FifthTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [Text('노트가 비어있습니다.', style: TextStyle(fontSize: 16))],
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
