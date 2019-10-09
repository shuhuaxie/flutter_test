
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TestRenderBoxWidget extends SingleChildRenderObjectWidget{
  @override
  RenderObject createRenderObject(BuildContext context) {
    // TODO: implement createRenderObject
    return TestRenderBox();
  }

}

class TestRenderBox extends RenderBox{
  Size get size {
    return Size(100,100);
  }
  @override
  void performLayout() {
    // TODO: implement performLayout
    super.performLayout();
  }

  @override
  void performResize() {
    // TODO: implement performResize
    super.performResize();
  }

  int _getFlex(RenderBox child) {
    final FlexParentData2 childParentData = child.parentData;
    return childParentData.flex ?? 0;
  }
}

class FlexParentData2 extends ParentData{
  num flex;
}


