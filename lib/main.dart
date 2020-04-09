import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutterblog/commonhtml/404.dart';
import 'package:flutterblog/route.dart';
import 'package:flutterblog/widget/TileImage.dart';


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
        color: Colors.blue,
        onGenerateRoute: (settings) {
          print(settings);
          debugPrint(settings.toString());
          switch (settings.name) {
            case "/":
              return route();
            case "/firstPage":
              return route();
            case "/WidgetPage":
              return route();
            case "/CollectionPage":
              return route();
            case "/FourthPage":
              return route();
            case "/404":
              return SimpleRoute(builder: (_) => new NoResource());
            default:
              return route();
          }
        });
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
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  final List<ListItem> listData = [];
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
//    final file = new Directory("assets/myblog");
//    file.list().forEach((element) {
//      debugPrint(element.path);
//    });
//    Directory directory = Directory("/assets/config/");
//  directory.listSync().forEach((file) {
//    print(file.path);
//  });
//
//
//    Xml2Json xml2json = new Xml2Json();

    for (int i = 0; i < 20; i++) {
      listData.add( ListItem("我是测试标题$i", Icons.cake));
    }

    final AppBarTheme appBarTheme = AppBarTheme.of(context);
    final ThemeData theme = Theme.of(context);
    TextStyle centerStyle =
        appBarTheme.textTheme?.headline6 ?? theme.primaryTextTheme.headline6;
    debugPrint(centerStyle.toString());
    var size = MediaQuery.of(context).size;
    Size newSize;
    if (size.aspectRatio > 1.066667) {
      //图片变形
      newSize = new Size(size.width, size.height * 0.6);
    } else {
      //图片没变形
      newSize = new Size(size.width, size.width * 9 / 16);
    }
    return NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              // These are the slivers that show up in the "outer" scroll view.
              return <Widget>[
                SliverOverlapAbsorber(
                  // This widget takes the overlapping behavior of the SliverAppBar,
                  // and redirects it to the SliverOverlapInjector below. If it is
                  // missing, then it is possible for the nested "inner" scroll view
                  // below to end up under the SliverAppBar even when the inner
                  // scroll view thinks it has not been scrolled.
                  // This is not necessary if the "headerSliverBuilder" only builds
                  // widgets that do not overlap the next sliver.
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    title: const Text('豆腐的博客'),
                    backgroundColor: Colors.black,
                    // This is the title in the app bar.
                    pinned: true,
                    expandedHeight: newSize.height,
                    // The "forceElevated" property causes the SliverAppBar to show
                    // a shadow. The "innerBoxIsScrolled" parameter is true when the
                    // inner scroll view is scrolled beyond its "zero" point, i.e.
                    // when it appears to be scrolled below the SliverAppBar.
                    // Without this, there are cases where the shadow would appear
                    // or not appear inappropriately, because the SliverAppBar is
                    // not actually aware of the precise position of the inner
                    // scroll views.
                    forceElevated: innerBoxIsScrolled,
                    flexibleSpace: FlexibleSpaceBar(
                      background: TitleImage("assets/images/categories-bg.jpg"),
                    ),
                    titleSpacing: 50,
                    actions: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          0,
                          50,
                          0,
                        ),
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
    return  InkWell(
      child:  ListTile(
        leading:  Icon(listItem.iconData),
        title:  Text(listItem.title),
      ),
      onTap: () {},
    );
  }
}
