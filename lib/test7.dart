import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHomePage7 extends StatefulWidget {
  MyHomePage7({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage7> {
  bool _buttonEnabled = true;

  @override
  Widget build(BuildContext context) {
    var raisedButton = RaisedButton(
        child: Text(_buttonEnabled ? 'Enabled' : 'Disabled'),
        onPressed: _buttonEnabled ? () {} : null);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'foo text',
            ),
            raisedButton,
            RaisedButton(
                child: Text('Toggle enabled'),
                onPressed: () =>
                    setState(() => _buttonEnabled = !_buttonEnabled)),
            PhysicalShapeW(),
          ],
        ),
      ),
    );
  }
}

class PhysicalShapeW extends StatelessWidget {
  Tween<double> _elevation = Tween<double>(begin: 0.2);
  ColorTween _shadowColor = ColorTween(begin: Color(0x1f000000));
  ShapeBorderTween _border = ShapeBorderTween(begin: new CircleBorder());

  @override
  Widget build(BuildContext context) {
    print('xie physical build...');
    return PhysicalShape(
      child: _ShapeBorderPaint(
//        child: widget.child,
        shape: new CircleBorder(side: BorderSide()),
//        borderOnForeground: widget.borderOnForeground,
      ),
      clipper: ShapeBorderClipper(
        shape: new CircleBorder(side: BorderSide()),
        textDirection: Directionality.of(context),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 0.5,
      color: Color(0x1f000000),
      shadowColor: Color(0x1f000000),
    );
  }
}

class _ShapeBorderPaint extends StatelessWidget {
  const _ShapeBorderPaint({
    @required this.child,
    @required this.shape,
    this.borderOnForeground = true,
  });

  final Widget child;
  final ShapeBorder shape;
  final bool borderOnForeground;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: child,
      painter: borderOnForeground
          ? null
          : _ShapeBorderPainter(shape, Directionality.of(context)),
      foregroundPainter: borderOnForeground
          ? _ShapeBorderPainter(shape, Directionality.of(context))
          : null,
    );
  }
}

class _ShapeBorderPainter extends CustomPainter {
  _ShapeBorderPainter(this.border, this.textDirection);

  final ShapeBorder border;
  final TextDirection textDirection;

  @override
  void paint(Canvas canvas, Size size) {
    border.paint(canvas, Offset.zero & size, textDirection: textDirection);
  }

  @override
  bool shouldRepaint(_ShapeBorderPainter oldDelegate) {
    return oldDelegate.border != border;
  }
}

typedef TweenVisitor<T> = Tween<T> Function(
    Tween<T> tween, T targetValue, TweenConstructor<T> constructor);

//child: _ShapeBorderPaint(
//child: widget.child,
//shape: shape,
//borderOnForeground: widget.borderOnForeground,
//),
//clipper: ShapeBorderClipper(
//shape: shape,
//textDirection: Directionality.of(context),
//),
//clipBehavior: widget.clipBehavior,
//elevation: elevation,
//color: _elevationOverlayColor(context, widget.color, elevation, 1),
//shadowColor: _shadowColor.evaluate(animation),
