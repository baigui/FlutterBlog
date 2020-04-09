import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterblog/widget/Toast.dart';

class TitleBar extends StatefulWidget {
  final String title;

  TitleBar(this.title, {Key key}) : super(key: key);

  @override
  _AppBarState createState() => _AppBarState();
}

class _AppBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Widget title = new FlatButton(
        hoverColor: Colors.black38,
        onPressed: (){
          Toast.show(context,"我的妈啊");
        },
        child: Text(
          widget.title,
          style: TextStyle(
              color: Colors.white
          ),
        ));

    Widget bar = Align(
        alignment: Alignment.centerLeft,
        child: title
    );
    return ClipRect(
    child: Material(
    color: Color.fromARGB(255,26, 26, 26),
    child : CustomSingleChildLayout(
    delegate: const _ToolbarContainerLayout(),
    child: bar
    ),
    ));
  }
}

// Bottom justify the kToolbarHeight child which may overflow the top.
class _ToolbarContainerLayout extends SingleChildLayoutDelegate {
  const _ToolbarContainerLayout();

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.tighten(height: kToolbarHeight);
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.maxWidth, kToolbarHeight);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(0.0, size.height - childSize.height);
  }

  @override
  bool shouldRelayout(_ToolbarContainerLayout oldDelegate) => false;
}
