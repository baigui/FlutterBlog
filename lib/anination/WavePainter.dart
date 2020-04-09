import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui show Gradient, lerpDouble;


class WavePainter extends CustomPainter {
  int waveCount;
  int crestCount;
  double waveHeight;

  Animation<double> _xAnimation;
  Animation<double> _yAnimation;

  WavePainter({this.waveCount = 1,
    this.crestCount = 2,
    this.waveHeight = 20,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
    waveHeight = height * 0.1;

    //因为这是被瑟斯曲线，只要移动中间点的位置，就可以实现波浪状
    double xMove = width * _xAnimation.value;

    double yMove = height*0.2;
    Offset waveCenter = new Offset(xMove, height-yMove);

    List<Path> wavePaths = [];

    //这个算法计算出两个屏幕的值，就算量应该大了一点吧。不在想纠结这个问题了。
    for (int index = 0; index < waveCount; index++) {
      double direction = pow(-1.0, index);
      Path path = new Path()
      //左下侧点位置
        ..moveTo(waveCenter.dx - width, waveCenter.dy)
      //左上侧
        ..lineTo(waveCenter.dx - width, height)
      //右上
        ..lineTo(waveCenter.dx + width, height)
        ..lineTo(waveCenter.dx + width, waveCenter.dy);


      for (int i = 0; i < 2; i++) {
        for (int j = 0; j < crestCount; j++) {
          double a = pow(-1.0, j);
          path
          //前坐标是控制点，后坐标是结束点
            ..quadraticBezierTo(
                waveCenter.dx +
                    width * (1 - i - (1 + 2 * j) / (2 * crestCount)),
                waveCenter.dy + waveHeight * a * direction,
                waveCenter.dx +
                    width * (1 - i - (2 + 2 * j) / (2 * crestCount)),
                waveCenter.dy);
        }
      }
      path..close();
      wavePaths.add(path);
    }

    canvas.save();
    var paint = new Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill;

    paint.shader = ui.Gradient.linear(Offset(0,height*0.95),Offset(0,height * 0.7),[Colors.white,Color.fromARGB(0, 255, 255, 255)]);
    canvas.drawPath(wavePaths[0], paint);
    canvas.restore();
  }


@override
bool shouldRepaint(CustomPainter oldDelegate) {
  return oldDelegate != this;
}

set XAnimation(Animation<double> value) {
  _xAnimation = value;
}

Animation<double> get XAnimation => _xAnimation;}
