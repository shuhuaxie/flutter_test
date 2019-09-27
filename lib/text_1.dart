import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class normal_text extends Text{
  normal_text(String data) : super(data);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return super.build(context);
  }
}

class LearnText extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LearnText();
  }
}

class _LearnText extends State<LearnText> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
          width: 360,
          color:Color(0xeeff0000),
          child: new Text("360"),
        ),
        new Container(
          width: 350,
          color:Color(0x99ff0000),
          child: new Text("350"),
        ),
        new Flexible(
          child: new Center(
            child: new Text(
              '学习Text',
              textAlign: TextAlign.center, //文本对齐方式  居中
              textDirection: TextDirection.rtl, //文本方向
              softWrap: false, //是否自动换行 false文字不考虑容器大小  单行显示   超出；屏幕部分将默认截断处理
              overflow: TextOverflow
                  .ellipsis, //文字超出屏幕之后的处理方式  TextOverflow.clip剪裁   TextOverflow.fade 渐隐  TextOverflow.ellipsis省略号
              textScaleFactor: 3.0, //字体显示的赔率
              maxLines: 10, //最大行数
              style: new TextStyle(
                decorationColor: const Color(0xff000000), //线的颜色
                decoration: TextDecoration
                    .none, //none无文字装饰   lineThrough删除线   overline文字上面显示线    underline文字下面显示线
                decorationStyle: TextDecorationStyle
                    .solid, //文字装饰的风格  dashed,dotted虚线(简短间隔大小区分)  double三条线  solid两条线
                wordSpacing: 0.0, //单词间隙(负值可以让单词更紧凑)
                letterSpacing: 0.0, //字母间隙(负值可以让字母更紧凑)
                fontStyle: FontStyle.normal, //文字样式，斜体和正常
                fontSize: 10.0, //字体大小
                fontWeight: FontWeight.w300, //字体粗细  粗体和正常
                color: const Color(0xff000000), //文字颜色
              ),
            ),
          ),
          flex: 1,
        ),
//        new RichText()  和下一行同样效果实现同一text的不同效果
        new Text.rich(
          new TextSpan(
            text: 'TextSpan',
            style: new TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              decoration: TextDecoration.none,
            ),
            children: <TextSpan>[
              new TextSpan(
                text: '拼接1',
              ),
              new TextSpan(
                text: '拼接2',
              ),
              new TextSpan(
                text: '拼接3',
              ),
              new TextSpan(
                text: '拼接4',
              ),
              new TextSpan(
                text: '拼接5',
              ),
              new TextSpan(
                text: '拼接6',
              ),
              new TextSpan(
                text: '拼接7',
                style: new TextStyle(
                  color: Colors.yellow,
                ),
                recognizer:new TapGestureRecognizer()..onTap=(){//增加一个点击事件
                  print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}