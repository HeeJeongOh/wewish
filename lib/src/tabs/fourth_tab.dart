import 'package:flutter/material.dart';

class FourthTab extends StatefulWidget {
  const FourthTab({Key? key}) : super(key: key);
  @override
  _FourthTabState createState() => _FourthTabState();
}

class _FourthTabState extends State<FourthTab> {
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
