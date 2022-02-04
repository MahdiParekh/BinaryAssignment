import 'package:assignment/StateManagement/poviderStateM.dart';
import 'package:assignment/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>Notifiers(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) =>  HomePage(),
        },
      ),
    );
  }
}




