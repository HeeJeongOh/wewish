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
      children: [Text('Preparing...', style: TextStyle(fontSize: 16))],
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
