import 'package:flutter/cupertino.dart';
import 'package:flutterblog/widget/titleBar.dart';

class NoResource extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [TitleBar("您找的资源没有呀"),
      Container(
        alignment : Alignment.center ,
        child: Text("没资源"),
      )],
    );
  }


}