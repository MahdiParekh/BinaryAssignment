import 'package:flutter/material.dart';

class DummyPage extends StatefulWidget {
  late String pageName;
  DummyPage({required this.pageName});

  @override
  _DummyPageState createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: Center(child: Text(widget.pageName,)),));
  }
}
