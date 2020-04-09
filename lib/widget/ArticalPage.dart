import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutterblog/conf/config.dart';
import 'package:flutterblog/conf/const.dart';

class ArticalPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ArticlaPage();
}

class _ArticlaPage extends State<ArticalPage> {
  String content = "";
  String Url = "";
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Url = ModalRoute.of(context).settings.arguments;
      debugPrint("路由返回fff:"+Url);
      getHttp(Url);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MarkdownBody(data: content);
  }

  Future getHttp(url) async {
    debugPrint(url);
    Dio dio = new Dio();
    try {
      Response response = await dio.get(
          url, options: Options(responseType: ResponseType.plain));
      print(response.data);
      setState(() {
        content = response.data;
      });
    } catch (e) {
      return print(e);
    }
  }
}
