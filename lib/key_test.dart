import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class StatelessContainer extends StatelessWidget {
  final Color color =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  List<Widget> widgets = [
    StatelessContainer(),
    StatelessContainer(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgets,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: switchWidget,
        child: Icon(Icons.undo),
      ),
    );
  }

  switchWidget() {
    print('xie widget 0 :' + widgets.elementAt(0).runtimeType.toString());
    print('xie widget 1 :' + widgets.elementAt(1).runtimeType.toString());
    print('xie widget 1 :' + widgets.elementAt(0).key.toString());
    print('xie widget 1 :' + widgets.elementAt(1).key.toString());
    print('xie widget runtimeType == :' +
        (widgets.elementAt(0).runtimeType == widgets.elementAt(1).runtimeType)
            .toString());
    print('xie widget key == :' +
        (widgets.elementAt(0).key == widgets.elementAt(1).key).toString());
    print('xie widget canUpdate :' +
        Widget.canUpdate(widgets.elementAt(0), widgets.elementAt(1))
            .toString());
    widgets.insert(0, widgets.removeAt(1));
    setState(() {});
  }
}
