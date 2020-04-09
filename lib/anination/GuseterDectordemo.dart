import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GuseterDector extends StatelessWidget {
  final GlobalKey<RawGestureDetectorState> _gestureDetectorKey =
      GlobalKey<RawGestureDetectorState>();
  var gestures;
  @override
  Widget build(BuildContext context) {
    gestures = <Type, GestureRecognizerFactory>{
      VerticalDragGestureRecognizer:
          GestureRecognizerFactoryWithHandlers<VerticalDragGestureRecognizer>(
              () => VerticalDragGestureRecognizer(),
              (VerticalDragGestureRecognizer instance) {
        instance
          ..onDown = _handleDragDown
          ..onStart = _handleDragStart
          ..onUpdate = _handleDragUpdate
          ..onEnd = _handleDragEnd
          ..onCancel = _handleDragCancel;
      })
    };

    return RawGestureDetector(
      gestures: gestures,
        child : Container(
      color: Colors.yellow,
      width: 400,
      height: 400,
    ));
  }

  void _handleDragDown(DragDownDetails details) {
    debugPrint("_handleDragDown $details");
  }

  void _handleDragStart(DragStartDetails details) {
    debugPrint("_handleDragStart $details");
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    debugPrint("_handleDragUpdate $details");
  }

  void _handleDragEnd(DragEndDetails details) {
    debugPrint("_handleDragEnd $details");
  }

  void _handleDragCancel() {}
}
