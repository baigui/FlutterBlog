import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterblog/commonhtml/404.dart';
import 'package:flutterblog/route.dart';
import 'package:flutterblog/widget/TileImage.dart';

import 'widget/ArticalPage.dart';
import 'widget/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

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
        color: Colors.blue,
        onGenerateRoute: (settings) {
          print(settings);
          debugPrint(settings.toString());
          switch (settings.name) {
            case "/":
              return SimpleRoute(
                  builder: (_) =>
                  new Scaffold(
                    body: MyHomePage(title: 'Flutter Demo Home Page'),
                  ));
              break;
            case "artical":
              return SimpleRoute(
                  builder: (_) => new ArticalPage(), argus: settings.arguments);
              break;
            default:
              return SimpleRoute(builder: (_) => new NoResource());
          }
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final AppBarTheme appBarTheme = AppBarTheme.of(context);
    final ThemeData theme = Theme.of(context);
    TextStyle centerStyle =
        appBarTheme.textTheme?.headline6 ?? theme.primaryTextTheme.headline6;
    debugPrint(centerStyle.toString());
    var size = MediaQuery
        .of(context)
        .size;
    Size newSize;
    if (size.aspectRatio > 1.066667) {
      //图片变形
      newSize = new Size(size.width, size.height * 0.6);
    } else {
      //图片没变形
      newSize = new Size(size.width, size.width * 9 / 16);
    }
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        // These are the slivers that show up in the "outer" scroll view.
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              title: const Text('豆腐的博客'),
              backgroundColor: Colors.black,
              // This is the title in the app bar.
              pinned: true,
              expandedHeight: newSize.height,
              forceElevated: innerBoxIsScrolled,
              flexibleSpace: FlexibleSpaceBar(
                background: TitleImage("assets/images/categories-bg.jpg"),
              ),
              titleSpacing: 50,
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: Center(
                      child: Text(
                        "关于",
                        style: TextStyle(fontSize: 18),
                      )),
                )
              ],
//                bottom: Image.asset('images/categories-bg.jpg'),
            ),
          ),
        ];
      },
      body: HomePage(
//              child:  ListView.builder(
//                shrinkWrap: true,
//                itemBuilder: (BuildContext context, int index) {
//                  return  ListItemWidget(listData[index]);
//                },
//                itemCount: listData.length,
//              ),
      ),
    );
  }
}

class ListItem {
  final String title;
  final IconData iconData;

  ListItem(this.title, this.iconData);
}

class ListItemWidget extends StatelessWidget {
  final ListItem listItem;

  ListItemWidget(this.listItem);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: Icon(listItem.iconData),
        title: Text(listItem.title),
      ),
      onTap: () {},
    );
  }
}
