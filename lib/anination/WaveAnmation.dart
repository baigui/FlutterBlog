import 'package:flutter/material.dart';
import 'package:flutterblog/anination/WavePainter.dart';

class WaveAnimation extends StatefulWidget {
  Size size;

  WaveAnimation(this.size);

  @override
  _ProgressManagerState createState() => new _ProgressManagerState();
}

class _ProgressManagerState extends State<WaveAnimation>
    with TickerProviderStateMixin {
  AnimationController xController;
  Animation<double> xAnimation;

  @override
  void initState() {
    super.initState();
    xController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    xAnimation = new Tween(begin: 0.0, end: 1.0).animate(xController);
    xAnimation.addListener(_change);

    doDelay(xController, 0);
  }

  @override
  Widget build(BuildContext context) {
//    debugPrint(MediaQuery.of(context).size.width.toString());
    return new CustomPaint(
      size: widget.size,
      painter: new WavePainter()..XAnimation = xAnimation,
    );
  }

  void _change() {
    setState(() {});
  }

  void doDelay(AnimationController controller, int delay) async {
    Future.delayed(Duration(milliseconds: delay), () {
      controller..repeat();
    });
  }

  @override
  void dispose() {
    xController.dispose();
    xAnimation.removeListener(_change);
    super.dispose();
  }
}
