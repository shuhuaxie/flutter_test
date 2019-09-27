import 'package:flutter/material.dart';
import 'dart:math';


class PieData {
  String name; // 名称
  Color color; // 颜色
  num percentage; //百分比
  var price; //成交额

}

class DemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new DemoPageState();
  }
}

///自定义  饼状图
/// @author yinl
class MyCustomCircle extends StatelessWidget {
  //数据源
  List<PieData> datas;

  //当前数据对象
  PieData data;
  var dataSize;

  //当前选中
  var currentSelect;

  MyCustomCircle(this.datas, this.data, this.currentSelect);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: MyView(datas, data, currentSelect, true));
  }
}

class DemoPageState extends State<DemoPage> {
  //数据源 下标  表示当前是PieData哪个对象
  int subscript = 0;

  //数据源
  List<PieData> mData;

  //传递值
  PieData pieData;

  //当前选中
  var currentSelect = 0;

  ///初始化 控制器
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //初始化 扇形 数据
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return _buildHeader();
  }

  /// 构建布局（这里还做了其它的尝试，所以布局可以进行优化，比如按钮处使用的Column,这里可以在按钮下方再添加文字啥的，根据各自需求来改变就行）
  Widget _buildHeader() {
    // 卡片的中间显示我们自定义的饼状图
    return new Container(
      color: Color(0xfff4f4f4),
      height: 200.0,
      width: 400.0,
      child: new Card(
        margin: const EdgeInsets.all(50.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 左侧按钮
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new IconButton(
                  icon: new Icon(Icons.arrow_left),
                  color: Colors.green[500],
                  onPressed: _left,
                ),
              ],
            ),
            //  自定义的饼状图
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Container(
                  width: 90.0,
                  height: 90.0,
                  padding: const EdgeInsets.only(bottom: 20.0),

                  /// 使用我们自定义的饼状图 ，并传入相应的参数
                  child: new MyCustomCircle(mData, pieData, currentSelect),
                ),
              ],
            ),
// 右侧按钮
            new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new IconButton(
                  icon: new Icon(Icons.arrow_right),
                  color: Colors.green[500],
                  onPressed: _changeData,
                ),
              ],
            ),
//
          ],
        ),
      ),
    );
  }

  ///点击按钮时  改变显示的内容
  void _left() {
    setState(() {
      if (subscript > 0) {
        --subscript;
        --currentSelect;
      }
      pieData = mData[subscript];
    });
  }

  ///改变饼状图
  void _changeData() {
    setState(() {
      if (subscript < mData.length) {
        ++subscript;
        ++currentSelect;
      }
      pieData = mData[subscript];
    });
  }

  //初始化数据源
  void initData() {
    mData = new List();
    PieData p1 = new PieData();
    p1.name = 'A';
    p1.price = 'a';
    p1.percentage = 0.1932;
    p1.color = Color(0xffff3333);

    pieData = p1;
    mData.add(p1);

    PieData p2 = new PieData();
    p2.name = 'B';
    p2.price = 'b';
    p2.percentage = 0.15;
    p2.color = Color(0xffccccff);
    mData.add(p2);

    PieData p3 = new PieData();
    p3.name = 'C';
    p3.price = 'c';
    p3.percentage = 0.1132;
    p3.color = Color(0xffCD00CD);
    mData.add(p3);

    PieData p4 = new PieData();
    p4.name = 'D';
    p4.price = 'd';
    p4.percentage = 0.0868;
    p4.color = Color(0xffFFA500);
    mData.add(p4);

    PieData p5 = new PieData();
    p5.name = 'E';
    p5.price = 'e';
    p5.percentage = 0.18023;
    p5.color = Color(0xff40E0D0);
    mData.add(p5);

    PieData p6 = new PieData();
    p6.name = 'F';
    p6.price = 'f';
    p6.percentage = 0.12888;
    p6.color = Color(0xffFFFF00);
    mData.add(p6);

    PieData p7 = new PieData();
    p7.name = 'G';
    p7.price = 'g';
    p7.percentage = 0.0888;
    p7.color = Color(0xff00ff66);
    mData.add(p7);

    PieData p8 = new PieData();
    p8.name = 'H';
    p8.price = 'h';
    p8.percentage = 0.06;
    p8.color = Color(0xffD9D9D9);
    mData.add(p8);
  }
}

class MyView extends CustomPainter {
  //中间文字
  var text = '111';
  bool isChange = false;

  //当前选中的扇形
  var currentSelect = 0;

  //画笔
  Paint _mPaint;
  Paint TextPaint;

  // 扇形大小
  int mWidth, mHeight;

  // 圆半径
  num mRadius, mInnerRadius, mBigRadius;

  // 扇形起始弧度（Andorid中是角度）
  num mStartAngle = 0;

  // 矩形（扇形绘制的区域）
  Rect mOval, mBigOval;

// 扇形 数据
  List<PieData> mData;
  PieData pieData;

  // 构造函数，接受需要的参数值
  MyView(this.mData, this.pieData, this.currentSelect, this.isChange);

  /**
   * 重写 paint方法，在其中写绘制饼状图的逻辑
   */
  @override
  void paint(Canvas canvas, Size size) {
    // 初始化各类工具等
    _mPaint = new Paint();
    TextPaint = new Paint();
    mHeight = 100;
    mWidth = 100;

    /// 生成纵轴文字的TextPainter
    TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      maxLines: 1,
    );

    // 文字画笔 风格定义
    TextPainter _newVerticalAxisTextPainter(String text) {
      return textPainter
        ..text = TextSpan(
          text: text,
          style: new TextStyle(
            color: Colors.black,
            fontSize: 10.0,
          ),
        );
    }

    // 正常半径
    mRadius = 50.0;
    //加大半径  用来绘制被选中的扇形区域
    mBigRadius = 55.0;
    //內园半径
    mInnerRadius = mRadius * 0.50;
    // 未选中的扇形绘制的矩形区域
    mOval = Rect.fromLTRB(-mRadius, -mRadius, mRadius, mRadius);
    // 选中的扇形绘制的矩形区域
    mBigOval = Rect.fromLTRB(-mBigRadius, -mBigRadius, mBigRadius, mBigRadius);
    //当没有数据时 直接返回
    if (mData.length == null || mData.length <= 0) {
      return;
    }

    ///绘制逻辑与Android差不多
    canvas.save();
    // 将坐标点移动到View的中心
    canvas.translate(50.0, 50.0);
    // 1. 画扇形
    num startAngle = 0.0;
    for (int i = 0; i < mData.length; i++) {
      PieData p = mData[i];
      double hudu = p.percentage;
      //计算当前偏移量（单位为弧度）
      double sweepAngle = 2 * pi * hudu;
      //画笔的颜色
      _mPaint..color = p.color;
      if (currentSelect >= 0 && i == currentSelect) {
        //如果当前为所选中的扇形 则将其半径加大  突出显示
        canvas.drawArc(mBigOval, startAngle, sweepAngle, true, _mPaint);
      } else {
        // 绘制没被选中的扇形  正常半径
        canvas.drawArc(mOval, startAngle, sweepAngle, true, _mPaint);
      }
      //计算每次开始绘制的弧度
      startAngle += sweepAngle;
    }

//    canvas.drawRect(mOval, _mPaint);  // 矩形区域

    // 2.画内圆
    _mPaint..color = Colors.white;
    canvas.drawCircle(Offset.zero, mInnerRadius, _mPaint);

    canvas.restore();

    //当前百分比值
    double percentage = pieData.percentage * 100;
    // 绘制文字内容
    var texts = '${percentage}%';
    var tp = _newVerticalAxisTextPainter(texts)..layout();

    // Text的绘制起始点 = 可用宽度 - 文字宽度 - 左边距
    var textLeft = 35.0;
    tp.paint(canvas, Offset(textLeft, 50.0 - tp.height / 2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
