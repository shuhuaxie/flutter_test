import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHomePage3 extends StatefulWidget {
  MyHomePage3({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage3> {
  bool _buttonEnabled = true;

  @override
  Widget build(BuildContext context) {
    print('xie _MyHomePageState.build...');
    var children3 = RaisedButton(
//                animationDuration: Duration(seconds: 10),
//                disabledColor: Colors.black12,
            child: Text(_buttonEnabled ? 'Enabled' : 'Disabled'),
            onPressed: _buttonEnabled ? () {} : null)
//        onPressed: () {}
        ;
    var children2 = <Widget>[
      Text(
        'foo text3',
      ),
      children3,
      RaisedButton(
          child: Text('Toggle enabled'),
          onPressed: () => setState(() => _buttonEnabled = !_buttonEnabled)),
      RaisedButton(
          child: Text('check status'),
          onPressed: () =>
              print('xie state of one ' + children3.enabled.toString())),
    ];
    var column = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children2,
    );
    return Scaffold(
      body: Center(
        child: column,
      ),
    );
  }
}
