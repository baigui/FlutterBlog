import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterblog/anination/WaveAnmation.dart';

class TitleImage extends StatelessWidget {
  String url;

  TitleImage(this.url);

  @override
  Widget build(BuildContext context) {
    debugPrint(MediaQuery.of(context).size.toString());

    var size = MediaQuery.of(context).size;
    Size newSize;
    if (size.aspectRatio > 1.066667){
      //图片变形
      newSize = new Size(size.width, size.height*0.6);
    }else{
      //图片没变形
      newSize = new Size(size.width, size.width*9/16);
    }
    return Stack(
        alignment :AlignmentDirectional.bottomCenter,
        children: [
        Container(
            color: Colors.white,
            constraints: BoxConstraints(
                maxHeight: size.aspectRatio > 1.066667
                    ? size.height * 0.6
                    : size.height),
            child: Image.asset(
              url,
              width: size.width,
              fit: BoxFit.fitWidth,
            )),
        WaveAnimation(newSize)],

    );
  }
}
