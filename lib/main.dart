import 'package:flutter/material.dart';
import 'package:flutter_app_test/customview.dart';
import 'package:flutter_app_test/test2.dart';
import 'package:flutter_app_test/test3.dart';
import 'package:flutter_app_test/test4.dart';
import 'package:flutter_app_test/test6.dart';
import 'package:flutter_app_test/test7.dart';
import 'package:flutter_app_test/test8.dart';

import 'animation.dart';
import 'bug_1.dart';
import 'key_test.dart';
import 'mycustomview.dart';

void main() => runApp(new LogoApp());

class LogoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xddffffff),
        body: Screen(),
      ),
    );
  }
}
