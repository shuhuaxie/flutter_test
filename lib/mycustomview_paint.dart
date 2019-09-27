import 'package:flutter/material.dart';
import 'dart:math';

class MyCustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint();
    paint.color = Color(0xffff0000);
    canvas.drawCircle(Offset(20, 20), 15, paint);
    TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        maxLines: 1,
        text: TextSpan(
            text: "hello flutter",
            style: new TextStyle(
              color: Colors.black,
              fontSize: 10.0,
            )));
    textPainter.layout(
      minWidth: 0,
      maxWidth: 500,
    );
    textPainter.paint(canvas, Offset(50, 200));
    // PhysicalShape _ _ShapeBorderPaint
    //                 ShapeBorderClipper
    ShapeBorder shape =
        new CircleBorder(side: BorderSide(width: 40, style: BorderStyle.solid));
    shape.paint(canvas, Offset(100,100) & size, textDirection: TextDirection.ltr);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
