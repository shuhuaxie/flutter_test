import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHomePage4 extends StatefulWidget {
  MyHomePage4({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage4> {
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
            RaisedButton(
                child: Text('check status'),
                onPressed: () =>
                    print('xie state of one ' + raisedButton.enabled.toString())),
          ],
        ),
      ),
    );
  }
}
