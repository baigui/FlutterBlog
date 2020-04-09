import 'package:flutter/material.dart';
import 'package:flutterblog/anination/GuseterDectordemo.dart';
import 'package:flutterblog/route.dart';
import 'package:flutterblog/widget/titleBar.dart';

import 'widget/HomePage.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Route<dynamic> route({String name, int index}) {
    return SimpleRoute(
        name: name,
        builder: (_) => new Scaffold(
          body: MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        textTheme: TextTheme(
          //设置Material的默认字体样式
          bodyText2: TextStyle(color: Color(0xFF888888), fontSize: 16.0),
        ),
      ),
      home: Scaffold(body: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GuseterDector();


  }
}


