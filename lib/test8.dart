import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide RaisedButton;
import 'package:flutter/rendering.dart';

import 'mock/material/raised_button.dart';
import 'mock/mock_inter/MockRaisedButton.dart';

class MyHomePage8 extends StatefulWidget {
  MyHomePage8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage8> {
  bool _buttonEnabled = true;

  @override
  Widget build(BuildContext context) {
    var raisedButton = MockRaisedButton(
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
