import 'package:flutter/material.dart';

class ThirdTab extends StatefulWidget {
  const ThirdTab({Key? key}) : super(key: key);
  @override
  _ThirdTabState createState() => _ThirdTabState();
}

class _ThirdTabState extends State<ThirdTab> {
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
