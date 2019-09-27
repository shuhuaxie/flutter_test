import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _buttonEnabled = true;

  @override
  Widget build(BuildContext context) {
    print('xie _MyHomePageState.build...');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'foo text',
            ),
            RaisedButton(
                key: Key('bad one'),
//                animationDuration: Duration(seconds: 10),
//                disabledColor: Colors.black12,
                child: Text(_buttonEnabled ? 'Enabled' : 'Disabled'),
                onPressed: _buttonEnabled ? () {} : null),
//                onPressed: null),
            RaisedButton(
                key: Key('good one'),
                child: Text('Toggle enabled'),
                onPressed: () =>
                    setState(() => _buttonEnabled = !_buttonEnabled)),
          ],
        ),
      ),
    );
  }
}

// 2.0 -> 0.0
// TODO
Color _elevationOverlayColor(
    BuildContext context, Color background, double elevation, int type) {
//  print('xie $type  _elevationOverlayColor elevation:' + elevation.toString());
//  print('xie background:' + background.toString());

  final ThemeData theme = Theme.of(context);
//  print('xie theme.applyElevationOverlayColor:' +
//      (theme.applyElevationOverlayColor.toString()));
//  print('xie theme.colorScheme.surface:' +
//      (theme.colorScheme.surface.toString()));

  if (elevation > 0.0 &&
      theme.applyElevationOverlayColor &&
      background == theme.colorScheme.surface) {
    // Compute the opacity for the given elevation
    // This formula matches the values in the spec:
    // https://material.io/design/color/dark-theme.html#properties
    print('xie elevation:' + elevation.toString());
    final double opacity = (9.5 * math.log(elevation + 1) + 2) / 100.0;
    final Color overlay = Colors.white.withOpacity(opacity);
    // should not be (0x1f000000)
    print('xie overlay:' + overlay.toString());

    var alphaBlend = Color.alphaBlend(overlay, background);
    print('xie alphaBlend:' + alphaBlend.toString());
    return alphaBlend;
  }
//  print('_ele end');
  return background;
}

class RaisedButton extends MaterialButton {
  /// Create a filled button.
  ///
  /// The [autofocus] and [clipBehavior] arguments must not be null.
  /// Additionally,  [elevation], [hoverElevation], [focusElevation],
  /// [highlightElevation], and [disabledElevation] must be non-negative, if
  /// specified.
  const RaisedButton({
    Key key,
    @required VoidCallback onPressed,
    ValueChanged<bool> onHighlightChanged,
    ButtonTextTheme textTheme,
    Color textColor,
    Color disabledTextColor,
    Color color,
    Color disabledColor,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    Brightness colorBrightness,
    double elevation,
    double focusElevation,
    double hoverElevation,
    double highlightElevation,
    double disabledElevation,
    EdgeInsetsGeometry padding,
    ShapeBorder shape,
    Clip clipBehavior,
    FocusNode focusNode,
    bool autofocus = false,
    MaterialTapTargetSize materialTapTargetSize,
    Duration animationDuration,
    Widget child,
  })  : assert(autofocus != null),
        assert(elevation == null || elevation >= 0.0),
        assert(focusElevation == null || focusElevation >= 0.0),
        assert(hoverElevation == null || hoverElevation >= 0.0),
        assert(highlightElevation == null || highlightElevation >= 0.0),
        assert(disabledElevation == null || disabledElevation >= 0.0),
        super(
          key: key,
          onPressed: onPressed,
          onHighlightChanged: onHighlightChanged,
          textTheme: textTheme,
          textColor: textColor,
          disabledTextColor: disabledTextColor,
          color: color,
          disabledColor: disabledColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          colorBrightness: colorBrightness,
          elevation: elevation,
          focusElevation: focusElevation,
          hoverElevation: hoverElevation,
          highlightElevation: highlightElevation,
          disabledElevation: disabledElevation,
          padding: padding,
          shape: shape,
          clipBehavior: clipBehavior,
          focusNode: focusNode,
          autofocus: autofocus,
          materialTapTargetSize: materialTapTargetSize,
          animationDuration: animationDuration,
          child: child,
        );

  /// Create a filled button from a pair of widgets that serve as the button's
  /// [icon] and [label].
  ///
  /// The icon and label are arranged in a row and padded by 12 logical pixels
  /// at the start, and 16 at the end, with an 8 pixel gap in between.
  ///
  /// The [elevation], [highlightElevation], [disabledElevation], [icon],
  /// [label], and [clipBehavior] arguments must not be null.

  @override
  Widget build(BuildContext context) {
    print('xie ' + runtimeType.toString() + ' build ' + enabled.toString());
    final ThemeData theme = Theme.of(context);
    final ButtonThemeData buttonTheme = ButtonTheme.of(context);
    return RawMaterialButton(
      key: key,
      onPressed: onPressed,
      onHighlightChanged: onHighlightChanged,
      clipBehavior: clipBehavior ?? Clip.none,
      fillColor: buttonTheme.getFillColor(this),
      textStyle: theme.textTheme.button
          .copyWith(color: buttonTheme.getTextColor(this)),
      focusColor: buttonTheme.getFocusColor(this),
      hoverColor: buttonTheme.getHoverColor(this),
      highlightColor: buttonTheme.getHighlightColor(this),
      splashColor: buttonTheme.getSplashColor(this),
      elevation: buttonTheme.getElevation(this),
      focusElevation: buttonTheme.getFocusElevation(this),
      hoverElevation: buttonTheme.getHoverElevation(this),
      highlightElevation: buttonTheme.getHighlightElevation(this),
      disabledElevation: buttonTheme.getDisabledElevation(this),
      padding: buttonTheme.getPadding(this),
      constraints: buttonTheme.getConstraints(this),
      shape: buttonTheme.getShape(this),
      focusNode: focusNode,
      autofocus: autofocus,
      animationDuration: buttonTheme.getAnimationDuration(this),
      materialTapTargetSize: buttonTheme.getMaterialTapTargetSize(this),
      child: child,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<double>('elevation', elevation,
        defaultValue: null));
    properties.add(DiagnosticsProperty<double>('focusElevation', focusElevation,
        defaultValue: null));
    properties.add(DiagnosticsProperty<double>('hoverElevation', hoverElevation,
        defaultValue: null));
    properties.add(DiagnosticsProperty<double>(
        'highlightElevation', highlightElevation,
        defaultValue: null));
    properties.add(DiagnosticsProperty<double>(
        'disabledElevation', disabledElevation,
        defaultValue: null));
  }
}

class RawMaterialButton extends StatefulWidget {
  /// Create a button based on [Semantics], [Material], and [InkWell] widgets.
  ///
  /// The [shape], [elevation], [focusElevation], [hoverElevation],
  /// [highlightElevation], [disabledElevation], [padding], [constraints],
  /// [autofocus], and [clipBehavior] arguments must not be null. Additionally,
  /// [elevation], [focusElevation], [hoverElevation], [highlightElevation], and
  /// [disabledElevation] must be non-negative.
  const RawMaterialButton({
    Key key,
    @required this.onPressed,
    this.onHighlightChanged,
    this.textStyle,
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.elevation = 2.0,
    this.focusElevation = 4.0,
    this.hoverElevation = 4.0,
    this.highlightElevation = 8.0,
    this.disabledElevation = 0.0,
    this.padding = EdgeInsets.zero,
    this.constraints = const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
    this.shape = const RoundedRectangleBorder(),
    this.animationDuration = kThemeChangeDuration,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    MaterialTapTargetSize materialTapTargetSize,
    this.child,
  })  : materialTapTargetSize =
            materialTapTargetSize ?? MaterialTapTargetSize.padded,
        assert(shape != null),
        assert(elevation != null && elevation >= 0.0),
        assert(focusElevation != null && focusElevation >= 0.0),
        assert(hoverElevation != null && hoverElevation >= 0.0),
        assert(highlightElevation != null && highlightElevation >= 0.0),
        assert(disabledElevation != null && disabledElevation >= 0.0),
        assert(padding != null),
        assert(constraints != null),
        assert(animationDuration != null),
        assert(clipBehavior != null),
        assert(autofocus != null),
        super(key: key);

  /// Called when the button is tapped or otherwise activated.
  ///
  /// If this is set to null, the button will be disabled, see [enabled].
  final VoidCallback onPressed;

  /// Called by the underlying [InkWell] widget's [InkWell.onHighlightChanged]
  /// callback.
  ///
  /// If [onPressed] changes from null to non-null while a gesture is ongoing,
  /// this can fire during the build phase (in which case calling
  /// [State.setState] is not allowed).
  final ValueChanged<bool> onHighlightChanged;

  /// Defines the default text style, with [Material.textStyle], for the
  /// button's [child].
  ///
  /// If [textStyle.color] is a [MaterialStateProperty<Color>], [MaterialStateProperty.resolve]
  /// is used for the following [MaterialState]s:
  ///
  ///  * [MaterialState.pressed].
  ///  * [MaterialState.hovered].
  ///  * [MaterialState.focused].
  ///  * [MaterialState.disabled].
  final TextStyle textStyle;

  /// The color of the button's [Material].
  final Color fillColor;

  /// The color for the button's [Material] when it has the input focus.
  final Color focusColor;

  /// The color for the button's [Material] when a pointer is hovering over it.
  final Color hoverColor;

  /// The highlight color for the button's [InkWell].
  final Color highlightColor;

  /// The splash color for the button's [InkWell].
  final Color splashColor;

  /// The elevation for the button's [Material] when the button
  /// is [enabled] but not pressed.
  ///
  /// Defaults to 2.0. The value is always non-negative.
  ///
  /// See also:
  ///
  ///  * [highlightElevation], the default elevation.
  ///  * [hoverElevation], the elevation when a pointer is hovering over the
  ///    button.
  ///  * [focusElevation], the elevation when the button is focused.
  ///  * [disabledElevation], the elevation when the button is disabled.
  final double elevation;

  /// The elevation for the button's [Material] when the button
  /// is [enabled] and a pointer is hovering over it.
  ///
  /// Defaults to 4.0. The value is always non-negative.
  ///
  /// If the button is [enabled], and being pressed (in the highlighted state),
  /// then the [highlightElevation] take precedence over the [hoverElevation].
  ///
  /// See also:
  ///
  ///  * [elevation], the default elevation.
  ///  * [focusElevation], the elevation when the button is focused.
  ///  * [disabledElevation], the elevation when the button is disabled.
  ///  * [highlightElevation], the elevation when the button is pressed.
  final double hoverElevation;

  /// The elevation for the button's [Material] when the button
  /// is [enabled] and has the input focus.
  ///
  /// Defaults to 4.0. The value is always non-negative.
  ///
  /// If the button is [enabled], and being pressed (in the highlighted state),
  /// or a mouse cursor is hovering over the button, then the [hoverElevation]
  /// and [highlightElevation] take precedence over the [focusElevation].
  ///
  /// See also:
  ///
  ///  * [elevation], the default elevation.
  ///  * [hoverElevation], the elevation when a pointer is hovering over the
  ///    button.
  ///  * [disabledElevation], the elevation when the button is disabled.
  ///  * [highlightElevation], the elevation when the button is pressed.
  final double focusElevation;

  /// The elevation for the button's [Material] when the button
  /// is [enabled] and pressed.
  ///
  /// Defaults to 8.0. The value is always non-negative.
  ///
  /// See also:
  ///
  ///  * [elevation], the default elevation.
  ///  * [hoverElevation], the elevation when a pointer is hovering over the
  ///  button.
  ///  * [focusElevation], the elevation when the button is focused.
  ///  * [disabledElevation], the elevation when the button is disabled.
  final double highlightElevation;

  /// The elevation for the button's [Material] when the button
  /// is not [enabled].
  ///
  /// Defaults to 0.0. The value is always non-negative.
  ///
  /// See also:
  ///
  ///  * [elevation], the default elevation.
  ///  * [hoverElevation], the elevation when a pointer is hovering over the
  ///  button.
  ///  * [focusElevation], the elevation when the button is focused.
  ///  * [highlightElevation], the elevation when the button is pressed.
  final double disabledElevation;

  /// The internal padding for the button's [child].
  final EdgeInsetsGeometry padding;

  /// Defines the button's size.
  ///
  /// Typically used to constrain the button's minimum size.
  final BoxConstraints constraints;

  /// The shape of the button's [Material].
  ///
  /// The button's highlight and splash are clipped to this shape. If the
  /// button has an elevation, then its drop shadow is defined by this shape.
  ///
  /// If [shape] is a [MaterialStateProperty<ShapeBorder>], [MaterialStateProperty.resolve]
  /// is used for the following [MaterialState]s:
  ///
  /// * [MaterialState.pressed].
  /// * [MaterialState.hovered].
  /// * [MaterialState.focused].
  /// * [MaterialState.disabled].
  final ShapeBorder shape;

  /// Defines the duration of animated changes for [shape] and [elevation].
  ///
  /// The default value is [kThemeChangeDuration].
  final Duration animationDuration;

  /// Typically the button's label.
  final Widget child;

  /// Whether the button is enabled or disabled.
  ///
  /// Buttons are disabled by default. To enable a button, set its [onPressed]
  /// property to a non-null value.
  bool get enabled => onPressed != null;

  /// Configures the minimum size of the tap target.
  ///
  /// Defaults to [MaterialTapTargetSize.padded].
  ///
  /// See also:
  ///
  ///  * [MaterialTapTargetSize], for a description of how this affects tap targets.
  final MaterialTapTargetSize materialTapTargetSize;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Clip}
  final Clip clipBehavior;

  @override
  _RawMaterialButtonState createState() => _RawMaterialButtonState();
}

class _RawMaterialButtonState extends State<RawMaterialButton> {
  final Set<MaterialState> _states = <MaterialState>{};

  bool get _hovered => _states.contains(MaterialState.hovered);

  bool get _focused => _states.contains(MaterialState.focused);

  bool get _pressed => _states.contains(MaterialState.pressed);

  bool get _disabled => _states.contains(MaterialState.disabled);

  void _updateState(MaterialState state, bool value) {
    value ? _states.add(state) : _states.remove(state);
  }

  void _handleHighlightChanged(bool value) {
    if (_pressed != value) {
      setState(() {
        _updateState(MaterialState.pressed, value);
        if (widget.onHighlightChanged != null) {
          widget.onHighlightChanged(value);
        }
      });
    }
  }

  void _handleHoveredChanged(bool value) {
    if (_hovered != value) {
      setState(() {
        _updateState(MaterialState.hovered, value);
      });
    }
  }

  void _handleFocusedChanged(bool value) {
    if (_focused != value) {
      setState(() {
        _updateState(MaterialState.focused, value);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _updateState(MaterialState.disabled, !widget.enabled);
  }

  @override
  void didUpdateWidget(RawMaterialButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateState(MaterialState.disabled, !widget.enabled);
    // If the button is disabled while a press gesture is currently ongoing,
    // InkWell makes a call to handleHighlightChanged. This causes an exception
    // because it calls setState in the middle of a build. To preempt this, we
    // manually update pressed to false when this situation occurs.
    if (_disabled && _pressed) {
      _handleHighlightChanged(false);
    }
  }

  double get _effectiveElevation {
    // These conditionals are in order of precedence, so be careful about
    // reorganizing them.
    if (_disabled) {
      return widget.disabledElevation;
    }
    if (_pressed) {
      return widget.highlightElevation;
    }
    if (_hovered) {
      return widget.hoverElevation;
    }
    if (_focused) {
      return widget.focusElevation;
    }
    return widget.elevation;
  }

  @override
  Widget build(BuildContext context) {
    print('xie ' + runtimeType.toString() + " build:");
    print('xie widget.fillColor ' + widget.fillColor.toString());
    final Color effectiveTextColor = MaterialStateProperty.resolveAs<Color>(
        widget.textStyle?.color, _states);
    final ShapeBorder effectiveShape =
        MaterialStateProperty.resolveAs<ShapeBorder>(widget.shape, _states);

    final Widget result = Focus(
      focusNode: widget.focusNode,
      onFocusChange: _handleFocusedChanged,
      autofocus: widget.autofocus,
      child: ConstrainedBox(
        constraints: widget.constraints,
        child: Material(
          key: widget.key,
          elevation: _effectiveElevation,
          textStyle: widget.textStyle?.copyWith(color: effectiveTextColor),
          shape: effectiveShape,
          color: widget.fillColor,
          type: widget.fillColor == null
              ? MaterialType.transparency
              : MaterialType.button,
          animationDuration: widget.animationDuration,
          clipBehavior: widget.clipBehavior,
          child: InkWell(
            onHighlightChanged: _handleHighlightChanged,
            splashColor: widget.splashColor,
            highlightColor: widget.highlightColor,
            focusColor: widget.focusColor,
            hoverColor: widget.hoverColor,
            onHover: _handleHoveredChanged,
            onTap: widget.onPressed,
            customBorder: effectiveShape,
            child: IconTheme.merge(
              data: IconThemeData(color: effectiveTextColor),
              child: Container(
                padding: widget.padding,
                child: Center(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
    Size minSize;
    switch (widget.materialTapTargetSize) {
      case MaterialTapTargetSize.padded:
        minSize = const Size(48.0, 48.0);
        break;
      case MaterialTapTargetSize.shrinkWrap:
        minSize = Size.zero;
        break;
    }

    return Semantics(
      container: true,
      button: true,
      enabled: widget.enabled,
      child: _InputPadding(
        minSize: minSize,
        child: result,
      ),
    );
  }
}

class _InputPadding extends SingleChildRenderObjectWidget {
  const _InputPadding({
    Key key,
    Widget child,
    this.minSize,
  }) : super(key: key, child: child);

  final Size minSize;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderInputPadding(minSize);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant _RenderInputPadding renderObject) {
    renderObject.minSize = minSize;
  }
}

class _RenderInputPadding extends RenderShiftedBox {
  _RenderInputPadding(this._minSize, [RenderBox child]) : super(child);

  Size get minSize => _minSize;
  Size _minSize;

  set minSize(Size value) {
    if (_minSize == value) return;
    _minSize = value;
    markNeedsLayout();
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    if (child != null)
      return math.max(child.getMinIntrinsicWidth(height), minSize.width);
    return 0.0;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    if (child != null)
      return math.max(child.getMinIntrinsicHeight(width), minSize.height);
    return 0.0;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    if (child != null)
      return math.max(child.getMaxIntrinsicWidth(height), minSize.width);
    return 0.0;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    if (child != null)
      return math.max(child.getMaxIntrinsicHeight(width), minSize.height);
    return 0.0;
  }

  @override
  void performLayout() {
    if (child != null) {
      child.layout(constraints, parentUsesSize: true);
      final double height = math.max(child.size.width, minSize.width);
      final double width = math.max(child.size.height, minSize.height);
      size = constraints.constrain(Size(height, width));
      final BoxParentData childParentData = child.parentData;
      childParentData.offset = Alignment.center.alongOffset(size - child.size);
    } else {
      size = Size.zero;
    }
  }

  @override
  bool hitTest(BoxHitTestResult result, {Offset position}) {
    if (super.hitTest(result, position: position)) {
      return true;
    }
    final Offset center = child.size.center(Offset.zero);
    return result.addWithRawTransform(
      transform: MatrixUtils.forceToPoint(center),
      position: center,
      hitTest: (BoxHitTestResult result, Offset position) {
        assert(position == center);
        return child.hitTest(result, position: center);
      },
    );
  }
}

class ButtonThemeData extends Diagnosticable {
  /// Create a button theme object that can be used with [ButtonTheme]
  /// or [ThemeData].
  ///
  /// The [textTheme], [minWidth], [height], [alignedDropDown], and
  /// [layoutBehavior] parameters must not be null. The [minWidth] and
  /// [height] parameters must greater than or equal to zero.
  ///
  /// The ButtonTheme's methods that have a [MaterialButton] parameter and
  /// have a name with a `get` prefix are used by [RaisedButton],
  /// [OutlineButton], and [FlatButton] to configure a [RawMaterialButton].
  const ButtonThemeData({
    this.textTheme = ButtonTextTheme.normal,
    this.minWidth = 88.0,
    this.height = 36.0,
    EdgeInsetsGeometry padding,
    ShapeBorder shape,
    this.layoutBehavior = ButtonBarLayoutBehavior.padded,
    this.alignedDropdown = false,
    Color buttonColor,
    Color disabledColor,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    this.colorScheme,
    MaterialTapTargetSize materialTapTargetSize,
  })  : assert(textTheme != null),
        assert(minWidth != null && minWidth >= 0.0),
        assert(height != null && height >= 0.0),
        assert(alignedDropdown != null),
        assert(layoutBehavior != null),
        _buttonColor = buttonColor,
        _disabledColor = disabledColor,
        _focusColor = focusColor,
        _hoverColor = hoverColor,
        _highlightColor = highlightColor,
        _splashColor = splashColor,
        _padding = padding,
        _shape = shape,
        _materialTapTargetSize = materialTapTargetSize;

  /// The minimum width for buttons.
  ///
  /// The actual horizontal space allocated for a button's child is
  /// at least this value less the theme's horizontal [padding].
  ///
  /// Defaults to 88.0 logical pixels.
  final double minWidth;

  /// The minimum height for buttons.
  ///
  /// Defaults to 36.0 logical pixels.
  final double height;

  /// Defines a button's base colors, and the defaults for the button's minimum
  /// size, internal padding, and shape.
  ///
  /// Despite the name, this property is not a [TextTheme], its value is not a
  /// collection of [TextStyle]s.
  final ButtonTextTheme textTheme;

  /// Defines whether a [ButtonBar] should size itself with a minimum size
  /// constraint or with padding.
  ///
  /// Defaults to [ButtonBarLayoutBehavior.padded].
  final ButtonBarLayoutBehavior layoutBehavior;

  /// Simply a convenience that returns [minWidth] and [height] as a
  /// [BoxConstraints] object:
  ///
  /// ```dart
  /// return BoxConstraints(
  ///   minWidth: minWidth,
  ///   minHeight: height,
  /// );
  /// ```
  BoxConstraints get constraints {
    return BoxConstraints(
      minWidth: minWidth,
      minHeight: height,
    );
  }

  /// Padding for a button's child (typically the button's label).
  ///
  /// Defaults to 24.0 on the left and right if [textTheme] is
  /// [ButtonTextTheme.primary], 16.0 on the left and right otherwise.
  ///
  /// See also:
  ///
  ///  * [getPadding], which is used by [RaisedButton], [OutlineButton]
  ///    and [FlatButton].
  EdgeInsetsGeometry get padding {
    if (_padding != null) return _padding;
    switch (textTheme) {
      case ButtonTextTheme.normal:
      case ButtonTextTheme.accent:
        return const EdgeInsets.symmetric(horizontal: 16.0);
      case ButtonTextTheme.primary:
        return const EdgeInsets.symmetric(horizontal: 24.0);
    }
    assert(false);
    return EdgeInsets.zero;
  }

  final EdgeInsetsGeometry _padding;

  /// The shape of a button's material.
  ///
  /// The button's highlight and splash are clipped to this shape. If the
  /// button has an elevation, then its drop shadow is defined by this
  /// shape as well.
  ///
  /// Defaults to a rounded rectangle with circular corner radii of 4.0 if
  /// [textTheme] is [ButtonTextTheme.primary], a rounded rectangle with
  /// circular corner radii of 2.0 otherwise.
  ///
  /// See also:
  ///
  ///  * [getShape], which is used by [RaisedButton], [OutlineButton]
  ///    and [FlatButton].
  ShapeBorder get shape {
    if (_shape != null) return _shape;
    switch (textTheme) {
      case ButtonTextTheme.normal:
      case ButtonTextTheme.accent:
        return const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
        );
      case ButtonTextTheme.primary:
        return const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        );
    }
    return const RoundedRectangleBorder();
  }

  final ShapeBorder _shape;

  /// If true, then a [DropdownButton] menu's width will match the button's
  /// width.
  ///
  /// If false (the default), then the dropdown's menu will be wider than
  /// its button. In either case the dropdown button will line up the leading
  /// edge of the menu's value with the leading edge of the values
  /// displayed by the menu items.
  ///
  /// This property only affects [DropdownButton] and its menu.
  final bool alignedDropdown;

  /// The background fill color for [RaisedButton]s.
  ///
  /// This property is null by default.
  ///
  /// If the button is in the focused, hovering, or highlighted state, then the
  /// [focusColor], [hoverColor], or [highlightColor] will take precedence over
  /// the [focusColor].
  ///
  /// See also:
  ///
  ///  * [getFillColor], which is used by [RaisedButton] to compute its
  ///    background fill color.
  final Color _buttonColor;

  /// The background fill color for disabled [RaisedButton]s.
  ///
  /// This property is null by default.
  ///
  /// See also:
  ///
  ///  * [getDisabledFillColor], which is used by [RaisedButton] to compute its
  ///    background fill color.
  final Color _disabledColor;

  /// The fill color of the button when it has the input focus.
  ///
  /// This property is null by default.
  ///
  /// If the button is in the hovering or highlighted state, then the [hoverColor]
  /// or [highlightColor] will take precedence over the [focusColor].
  ///
  /// See also:
  ///
  ///  * [getFocusColor], which is used by [RaisedButton], [OutlineButton]
  ///    and [FlatButton].
  final Color _focusColor;

  /// The fill color of the button when a pointer is hovering over it.
  ///
  /// This property is null by default.
  ///
  /// If the button is in the highlighted state, then the [highlightColor] will
  /// take precedence over the [hoverColor].
  ///
  /// See also:
  ///
  ///  * [getHoverColor], which is used by [RaisedButton], [OutlineButton]
  ///    and [FlatButton].
  final Color _hoverColor;

  /// The color of the overlay that appears when a button is pressed.
  ///
  /// This property is null by default.
  ///
  /// See also:
  ///
  ///  * [getHighlightColor], which is used by [RaisedButton], [OutlineButton]
  ///    and [FlatButton].
  final Color _highlightColor;

  /// The color of the ink "splash" overlay that appears when a button is tapped.
  ///
  /// This property is null by default.
  ///
  /// See also:
  ///
  ///  * [getSplashColor], which is used by [RaisedButton], [OutlineButton]
  ///    and [FlatButton].
  final Color _splashColor;

  /// A set of thirteen colors that can be used to derive the button theme's
  /// colors.
  ///
  /// This property was added much later than the theme's set of highly
  /// specific colors, like [ThemeData.buttonColor], [ThemeData.highlightColor],
  /// [ThemeData.splashColor] etc.
  ///
  /// The colors for new button classes can be defined exclusively in terms
  /// of [colorScheme]. When it's possible, the existing buttons will
  /// (continue to) gradually migrate to it.
  final ColorScheme colorScheme;

  // The minimum size of a button's tap target.
  //
  // This property is null by default.
  //
  // See also:
  //
  //  * [getMaterialTargetTapSize], which is used by [RaisedButton],
  //    [OutlineButton] and [FlatButton].
  final MaterialTapTargetSize _materialTapTargetSize;

  /// The [button]'s overall brightness.
  ///
  /// Returns the button's [MaterialButton.colorBrightness] if it is non-null,
  /// otherwise the color scheme's [ColorScheme.brightness] is returned.
  Brightness getBrightness(MaterialButton button) {
    return button.colorBrightness ?? colorScheme.brightness;
  }

  /// Defines the [button]'s base colors, and the defaults for the button's
  /// minimum size, internal padding, and shape.
  ///
  /// Despite the name, this property is not the [TextTheme] whose
  /// [TextTheme.button] is used as the button text's [TextStyle].
  ButtonTextTheme getTextTheme(MaterialButton button) {
    return button.textTheme ?? textTheme;
  }

  /// The foreground color of the [button]'s text and icon when
  /// [MaterialButton.onPressed] is null (when MaterialButton.enabled is false).
  ///
  /// Returns the button's [MaterialButton.disabledColor] if it is non-null.
  /// Otherwise the color scheme's [ColorScheme.onSurface] color is returned
  /// with its opacity set to 0.38.
  ///
  /// If [MaterialButton.textColor] is a [MaterialStateProperty<Color>], it will be
  /// used as the `disabledTextColor`. It will be resolved in the [MaterialState.disabled] state.
  Color getDisabledTextColor(MaterialButton button) {
    if (button.textColor is MaterialStateProperty<Color>)
      return button.textColor;
    if (button.disabledTextColor != null) return button.disabledTextColor;
    return colorScheme.onSurface.withOpacity(0.38);
  }

  /// The [button]'s background color when [MaterialButton.onPressed] is null
  /// (when [MaterialButton.enabled] is false).
  ///
  /// Returns the button's [MaterialButton.disabledColor] if it is non-null.
  ///
  /// Otherwise the value of the `disabledColor` constructor parameter
  /// is returned, if it is non-null.
  ///
  /// Otherwise the color scheme's [ColorScheme.onSurface] color is returned
  /// with its opacity set to 0.38.
  Color getDisabledFillColor(MaterialButton button) {

    if (button.disabledColor != null) return button.disabledColor;
    if (_disabledColor != null) return _disabledColor;
    return colorScheme.onSurface.withOpacity(0.38);
  }

  /// The button's background fill color or null for buttons that don't have
  /// a background color.
  ///
  /// Returns [MaterialButton.color] if it is non-null and the button
  /// is enabled.
  ///
  /// Otherwise, returns [MaterialButton.disabledColor] if it is non-null and
  /// the button is disabled.
  ///
  /// Otherwise, if button is a [FlatButton] or an [OutlineButton] then null is
  /// returned.
  ///
  /// Otherwise, if button is a [RaisedButton], returns the `buttonColor`
  /// constructor parameter if it was non-null and the button is enabled.
  ///
  /// Otherwise the fill color depends on the value of [getTextTheme].
  ///
  ///  * [ButtonTextTheme.normal] or [ButtonTextTheme.accent], the
  ///    color scheme's [ColorScheme.primary] color if the [button] is enabled
  ///    the value of [getDisabledFillColor] otherwise.
  ///  * [ButtonTextTheme.primary], if the [button] is enabled then the value
  ///    of the `buttonColor` constructor parameter if it is non-null,
  ///    otherwise the color scheme's ColorScheme.primary color. If the button
  ///    is not enabled then the colorScheme's [ColorScheme.onSurface] color
  ///    with opacity 0.12.
  Color getFillColor(MaterialButton button) {
    final Color fillColor =
        button.enabled ? button.color : button.disabledColor;
    if (fillColor != null) return fillColor;

    if (button is FlatButton ||
        button is OutlineButton ||
        button.runtimeType == MaterialButton) return null;
    // Do this...
    if (button.enabled && button is RaisedButton && _buttonColor != null) {
      return _buttonColor;
    }

    switch (getTextTheme(button)) {
      case ButtonTextTheme.normal:
      case ButtonTextTheme.accent:
        return button.enabled
            ? colorScheme.primary
            : getDisabledFillColor(button);
      case ButtonTextTheme.primary:
        return button.enabled
            ? _buttonColor ?? colorScheme.primary
            : colorScheme.onSurface.withOpacity(0.12);
    }

    assert(false);
    return null;
  }

  /// The foreground color of the [button]'s text and icon.
  ///
  /// If [button] is not [MaterialButton.enabled], the value of
  /// [getDisabledTextColor] is returned. If the button is enabled and
  /// [buttonTextColor] is non-null, then [buttonTextColor] is returned.
  ///
  /// Otherwise the text color depends on the value of [getTextTheme]
  /// and [getBrightness].
  ///
  ///  * [ButtonTextTheme.normal]: [Colors.white] is used if [getBrightness]
  ///    resolves to [Brightness.dark]. [Colors.black87] is used if
  ///    [getBrightness] resolves to [Brightness.light].
  ///  * [ButtonTextTheme.accent]: [colorScheme.secondary].
  ///  * [ButtonTextTheme.primary]: If [getFillColor] is dark then [Colors.white],
  ///    otherwise if [button] is a [FlatButton] or an [OutlineButton] then
  ///    [colorScheme.primary], otherwise [Colors.black].
  Color getTextColor(MaterialButton button) {
    if (!button.enabled) return getDisabledTextColor(button);

    if (button.textColor != null) return button.textColor;

    switch (getTextTheme(button)) {
      case ButtonTextTheme.normal:
        return getBrightness(button) == Brightness.dark
            ? Colors.white
            : Colors.black87;

      case ButtonTextTheme.accent:
        return colorScheme.secondary;

      case ButtonTextTheme.primary:
        {
          final Color fillColor = getFillColor(button);
          final bool fillIsDark = fillColor != null
              ? ThemeData.estimateBrightnessForColor(fillColor) ==
                  Brightness.dark
              : getBrightness(button) == Brightness.dark;
          if (fillIsDark) return Colors.white;
          if (button is FlatButton || button is OutlineButton)
            return colorScheme.primary;
          return Colors.black;
        }
    }

    assert(false);
    return null;
  }

  /// The color of the ink "splash" overlay that appears when the (enabled)
  /// [button] is tapped.
  ///
  /// Returns the button's [MaterialButton.splashColor] if it is non-null.
  ///
  /// Otherwise, returns the value of the `splashColor` constructor parameter
  /// it is non-null and [button] is a [RaisedButton] or an [OutlineButton].
  ///
  /// Otherwise, returns the value of the `splashColor` constructor parameter
  /// if it is non-null and [button] is a [FlatButton] and
  /// [getTextTheme] is not [ButtonTextTheme.primary]
  ///
  /// Otherwise, returns [getTextColor] with an opacity of 0.12.
  Color getSplashColor(MaterialButton button) {
    if (button.splashColor != null) return button.splashColor;

    if (_splashColor != null &&
        (button is RaisedButton || button is OutlineButton))
      return _splashColor;

    if (_splashColor != null && button is FlatButton) {
      switch (getTextTheme(button)) {
        case ButtonTextTheme.normal:
        case ButtonTextTheme.accent:
          return _splashColor;
        case ButtonTextTheme.primary:
          break;
      }
    }

    return getTextColor(button).withOpacity(0.12);
  }

  /// The fill color of the button when it has input focus.
  ///
  /// Returns the button's [MaterialButton.focusColor] if it is non-null.
  /// Otherwise the focus color depends on [getTextTheme]:
  ///
  ///  * [ButtonTextTheme.normal], [ButtonTextTheme.accent]: returns the
  ///    value of the `focusColor` constructor parameter if it is non-null,
  ///    otherwise the value of [getTextColor] with opacity 0.12.
  ///  * [ButtonTextTheme.primary], returns [Colors.transparent].
  Color getFocusColor(MaterialButton button) {
    return button.focusColor ??
        _focusColor ??
        getTextColor(button).withOpacity(0.12);
  }

  /// The fill color of the button when it has input focus.
  ///
  /// Returns the button's [MaterialButton.focusColor] if it is non-null.
  /// Otherwise the focus color depends on [getTextTheme]:
  ///
  ///  * [ButtonTextTheme.normal], [ButtonTextTheme.accent],
  ///    [ButtonTextTheme.primary]: returns the value of the `focusColor`
  ///    constructor parameter if it is non-null, otherwise the value of
  ///    [getTextColor] with opacity 0.04.
  Color getHoverColor(MaterialButton button) {
    return button.hoverColor ??
        _hoverColor ??
        getTextColor(button).withOpacity(0.04);
  }

  /// The color of the overlay that appears when the [button] is pressed.
  ///
  /// Returns the button's [MaterialButton.highlightColor] if it is non-null.
  /// Otherwise the highlight color depends on [getTextTheme]:
  ///
  ///  * [ButtonTextTheme.normal], [ButtonTextTheme.accent]: returns the
  ///    value of the `highlightColor` constructor parameter if it is non-null,
  ///    otherwise the value of [getTextColor] with opacity 0.16.
  ///  * [ButtonTextTheme.primary], returns [Colors.transparent].
  Color getHighlightColor(MaterialButton button) {
    if (button.highlightColor != null) return button.highlightColor;

    switch (getTextTheme(button)) {
      case ButtonTextTheme.normal:
      case ButtonTextTheme.accent:
        return _highlightColor ?? getTextColor(button).withOpacity(0.16);
      case ButtonTextTheme.primary:
        return Colors.transparent;
    }

    assert(false);
    return Colors.transparent;
  }

  /// The [button]'s elevation when it is enabled and has not been pressed.
  ///
  /// Returns the button's [MaterialButton.elevation] if it is non-null.
  ///
  /// If button is a [FlatButton] then elevation is 0.0, otherwise it is 2.0.
  double getElevation(MaterialButton button) {
    if (button.elevation != null) return button.elevation;
    if (button is FlatButton) return 0.0;
    return 2.0;
  }

  /// The [button]'s elevation when it is enabled and has focus.
  ///
  /// Returns the button's [MaterialButton.focusElevation] if it is non-null.
  ///
  /// If button is a [FlatButton] or an [OutlineButton] then the focus
  /// elevation is 0.0, otherwise the highlight elevation is 4.0.
  double getFocusElevation(MaterialButton button) {
    if (button.focusElevation != null) return button.focusElevation;
    if (button is FlatButton) return 0.0;
    if (button is OutlineButton) return 0.0;
    return 4.0;
  }

  /// The [button]'s elevation when it is enabled and has focus.
  ///
  /// Returns the button's [MaterialButton.hoverElevation] if it is non-null.
  ///
  /// If button is a [FlatButton] or an [OutlineButton] then the hover
  /// elevation is 0.0, otherwise the highlight elevation is 4.0.
  double getHoverElevation(MaterialButton button) {
    if (button.hoverElevation != null) return button.hoverElevation;
    if (button is FlatButton) return 0.0;
    if (button is OutlineButton) return 0.0;
    return 4.0;
  }

  /// The [button]'s elevation when it is enabled and has been pressed.
  ///
  /// Returns the button's [MaterialButton.highlightElevation] if it is non-null.
  ///
  /// If button is a [FlatButton] or an [OutlineButton] then the highlight
  /// elevation is 0.0, otherwise the highlight elevation is 8.0.
  double getHighlightElevation(MaterialButton button) {
    if (button.highlightElevation != null) return button.highlightElevation;
    if (button is FlatButton) return 0.0;
    if (button is OutlineButton) return 0.0;
    return 8.0;
  }

  /// The [button]'s elevation when [MaterialButton.onPressed] is null (when
  /// MaterialButton.enabled is false).
  ///
  /// Returns the button's [MaterialButton.elevation] if it is non-null.
  ///
  /// Otherwise the disabled elevation is 0.0.
  double getDisabledElevation(MaterialButton button) {
    if (button.disabledElevation != null) return button.disabledElevation;
    return 0.0;
  }

  /// Padding for the [button]'s child (typically the button's label).
  ///
  /// Returns the button's [MaterialButton.padding] if it is non-null.
  ///
  /// If this is a button constructed with [RaisedButton.icon] or
  /// [FlatButton.icon] or [OutlineButton.icon] then the padding is:
  /// `EdgeInsetsDirectional.only(start: 12.0, end: 16.0)`.
  ///
  /// Otherwise, returns [padding] if it is non-null.
  ///
  /// Otherwise, returns horizontal padding of 24.0 on the left and right if
  /// [getTextTheme] is [ButtonTextTheme.primary], 16.0 on the left and right
  /// otherwise.
  EdgeInsetsGeometry getPadding(MaterialButton button) {
    if (button.padding != null) return button.padding;

    if (button is MaterialButtonWithIconMixin)
      return const EdgeInsetsDirectional.only(start: 12.0, end: 16.0);

    if (_padding != null) return _padding;

    switch (getTextTheme(button)) {
      case ButtonTextTheme.normal:
      case ButtonTextTheme.accent:
        return const EdgeInsets.symmetric(horizontal: 16.0);
      case ButtonTextTheme.primary:
        return const EdgeInsets.symmetric(horizontal: 24.0);
    }
    assert(false);
    return EdgeInsets.zero;
  }

  /// The shape of the [button]'s [Material].
  ///
  /// Returns the button's [MaterialButton.shape] if it is non-null, otherwise
  /// [shape] is returned.
  ShapeBorder getShape(MaterialButton button) {
    return button.shape ?? shape;
  }

  /// The duration of the [button]'s highlight animation.
  ///
  /// Returns the button's [MaterialButton.animationDuration] it if is non-null,
  /// otherwise 200ms.
  Duration getAnimationDuration(MaterialButton button) {
    return button.animationDuration ?? kThemeChangeDuration;
  }

  /// The [BoxConstraints] that the define the [button]'s size.
  ///
  /// By default this method just returns [constraints]. Subclasses
  /// could override this method to return a value that was,
  /// for example, based on the button's type.
  BoxConstraints getConstraints(MaterialButton button) => constraints;

  /// The minimum size of the [button]'s tap target.
  ///
  /// Returns the button's [MaterialButton.tapTargetSize] if it is non-null.
  ///
  /// Otherwise the value of the [materialTapTargetSize] constructor
  /// parameter is returned if that's non-null.
  ///
  /// Otherwise [MaterialTapTargetSize.padded] is returned.
  MaterialTapTargetSize getMaterialTapTargetSize(MaterialButton button) {
    return button.materialTapTargetSize ??
        _materialTapTargetSize ??
        MaterialTapTargetSize.padded;
  }

  /// Creates a copy of this button theme data object with the matching fields
  /// replaced with the non-null parameter values.
  ButtonThemeData copyWith({
    ButtonTextTheme textTheme,
    ButtonBarLayoutBehavior layoutBehavior,
    double minWidth,
    double height,
    EdgeInsetsGeometry padding,
    ShapeBorder shape,
    bool alignedDropdown,
    Color buttonColor,
    Color disabledColor,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    ColorScheme colorScheme,
    MaterialTapTargetSize materialTapTargetSize,
  }) {
    return ButtonThemeData(
      textTheme: textTheme ?? this.textTheme,
      layoutBehavior: layoutBehavior ?? this.layoutBehavior,
      minWidth: minWidth ?? this.minWidth,
      height: height ?? this.height,
      padding: padding ?? this.padding,
      shape: shape ?? this.shape,
      alignedDropdown: alignedDropdown ?? this.alignedDropdown,
      buttonColor: buttonColor ?? _buttonColor,
      disabledColor: disabledColor ?? _disabledColor,
      focusColor: focusColor ?? _focusColor,
      hoverColor: hoverColor ?? _hoverColor,
      highlightColor: highlightColor ?? _highlightColor,
      splashColor: splashColor ?? _splashColor,
      colorScheme: colorScheme ?? this.colorScheme,
      materialTapTargetSize: materialTapTargetSize ?? _materialTapTargetSize,
    );
  }

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType) return false;
    final ButtonThemeData typedOther = other;
    return textTheme == typedOther.textTheme &&
        minWidth == typedOther.minWidth &&
        height == typedOther.height &&
        padding == typedOther.padding &&
        shape == typedOther.shape &&
        alignedDropdown == typedOther.alignedDropdown &&
        _buttonColor == typedOther._buttonColor &&
        _disabledColor == typedOther._disabledColor &&
        _focusColor == typedOther._focusColor &&
        _hoverColor == typedOther._hoverColor &&
        _highlightColor == typedOther._highlightColor &&
        _splashColor == typedOther._splashColor &&
        colorScheme == typedOther.colorScheme &&
        _materialTapTargetSize == typedOther._materialTapTargetSize;
  }

  @override
  int get hashCode {
    return hashValues(
      textTheme,
      minWidth,
      height,
      padding,
      shape,
      alignedDropdown,
      _buttonColor,
      _disabledColor,
      _focusColor,
      _hoverColor,
      _highlightColor,
      _splashColor,
      colorScheme,
      _materialTapTargetSize,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    const ButtonThemeData defaultTheme = ButtonThemeData();
    properties.add(EnumProperty<ButtonTextTheme>('textTheme', textTheme,
        defaultValue: defaultTheme.textTheme));
    properties.add(DoubleProperty('minWidth', minWidth,
        defaultValue: defaultTheme.minWidth));
    properties.add(
        DoubleProperty('height', height, defaultValue: defaultTheme.height));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('padding', padding,
        defaultValue: defaultTheme.padding));
    properties.add(DiagnosticsProperty<ShapeBorder>('shape', shape,
        defaultValue: defaultTheme.shape));
    properties.add(FlagProperty(
      'alignedDropdown',
      value: alignedDropdown,
      defaultValue: defaultTheme.alignedDropdown,
      ifTrue: 'dropdown width matches button',
    ));
    properties
        .add(ColorProperty('buttonColor', _buttonColor, defaultValue: null));
    properties.add(
        ColorProperty('disabledColor', _disabledColor, defaultValue: null));
    properties
        .add(ColorProperty('focusColor', _focusColor, defaultValue: null));
    properties
        .add(ColorProperty('hoverColor', _hoverColor, defaultValue: null));
    properties.add(
        ColorProperty('highlightColor', _highlightColor, defaultValue: null));
    properties
        .add(ColorProperty('splashColor', _splashColor, defaultValue: null));
    properties.add(DiagnosticsProperty<ColorScheme>('colorScheme', colorScheme,
        defaultValue: defaultTheme.colorScheme));
    properties.add(DiagnosticsProperty<MaterialTapTargetSize>(
        'materialTapTargetSize', _materialTapTargetSize,
        defaultValue: null));
  }
}

class ButtonTheme extends InheritedWidget {
  /// Creates a button theme.
  ///
  /// The [textTheme], [minWidth], [height], and [colorScheme] arguments
  /// must not be null.
  ButtonTheme({
    Key key,
    ButtonTextTheme textTheme = ButtonTextTheme.normal,
    ButtonBarLayoutBehavior layoutBehavior = ButtonBarLayoutBehavior.padded,
    double minWidth = 88.0,
    double height = 36.0,
    EdgeInsetsGeometry padding,
    ShapeBorder shape,
    bool alignedDropdown = false,
    Color buttonColor,
    Color disabledColor,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    ColorScheme colorScheme,
    MaterialTapTargetSize materialTapTargetSize,
    Widget child,
  })  : assert(textTheme != null),
        assert(minWidth != null && minWidth >= 0.0),
        assert(height != null && height >= 0.0),
        assert(alignedDropdown != null),
        assert(layoutBehavior != null),
        data = ButtonThemeData(
          textTheme: textTheme,
          minWidth: minWidth,
          height: height,
          padding: padding,
          shape: shape,
          alignedDropdown: alignedDropdown,
          layoutBehavior: layoutBehavior,
          buttonColor: buttonColor,
          disabledColor: disabledColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          colorScheme: colorScheme,
          materialTapTargetSize: materialTapTargetSize,
        ),
        super(key: key, child: child);

  /// Creates a button theme from [data].
  ///
  /// The [data] argument must not be null.
  const ButtonTheme.fromButtonThemeData({
    Key key,
    @required this.data,
    Widget child,
  })  : assert(data != null),
        super(key: key, child: child);

  /// Creates a button theme that is appropriate for button bars, as used in
  /// dialog footers and in the headers of data tables.
  ///
  /// This theme is denser, with a smaller [minWidth] and [padding], than the
  /// default theme. Also, this theme uses [ButtonTextTheme.accent] rather than
  /// [ButtonTextTheme.normal].
  ///
  /// For best effect, the label of the button at the edge of the container
  /// should have text that ends up wider than 64.0 pixels. This ensures that
  /// the alignment of the text matches the alignment of the edge of the
  /// container.
  ///
  /// For example, buttons at the bottom of [Dialog] or [Card] widgets use this
  /// button theme.
  ButtonTheme.bar({
    Key key,
    ButtonTextTheme textTheme = ButtonTextTheme.accent,
    double minWidth = 64.0,
    double height = 36.0,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(horizontal: 8.0),
    ShapeBorder shape,
    bool alignedDropdown = false,
    Color buttonColor,
    Color disabledColor,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    ColorScheme colorScheme,
    Widget child,
    ButtonBarLayoutBehavior layoutBehavior = ButtonBarLayoutBehavior.padded,
  })  : assert(textTheme != null),
        assert(minWidth != null && minWidth >= 0.0),
        assert(height != null && height >= 0.0),
        assert(alignedDropdown != null),
        data = ButtonThemeData(
          textTheme: textTheme,
          minWidth: minWidth,
          height: height,
          padding: padding,
          shape: shape,
          alignedDropdown: alignedDropdown,
          layoutBehavior: layoutBehavior,
          buttonColor: buttonColor,
          disabledColor: disabledColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          colorScheme: colorScheme,
        ),
        super(key: key, child: child);

  /// Specifies the color and geometry of buttons.
  final ButtonThemeData data;

  /// The closest instance of this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// ButtonThemeData theme = ButtonTheme.of(context);
  /// ```
  static ButtonThemeData of(BuildContext context) {
    final ButtonTheme inheritedButtonTheme =
        context.inheritFromWidgetOfExactType(ButtonTheme);
    ButtonThemeData buttonTheme = inheritedButtonTheme?.data;
    if (buttonTheme?.colorScheme == null) {
      // if buttonTheme or buttonTheme.colorScheme is null
      final ThemeData theme = Theme.of(context);
      buttonTheme ??= theme.buttonTheme;
      if (buttonTheme.colorScheme == null) {
        buttonTheme = buttonTheme.copyWith(
          colorScheme: theme.buttonTheme.colorScheme ?? theme.colorScheme,
        );
        assert(buttonTheme.colorScheme != null);
      }
    }
    return buttonTheme;
  }

  @override
  bool updateShouldNotify(ButtonTheme oldWidget) => data != oldWidget.data;
}

class Theme extends StatelessWidget {
  /// Applies the given theme [data] to [child].
  ///
  /// The [data] and [child] arguments must not be null.
  const Theme({
    Key key,
    @required this.data,
    this.isMaterialAppTheme = false,
    @required this.child,
  })  : assert(child != null),
        assert(data != null),
        super(key: key);

  /// Specifies the color and typography values for descendant widgets.
  final ThemeData data;

  /// True if this theme was installed by the [MaterialApp].
  ///
  /// When an app uses the [Navigator] to push a route, the route's widgets
  /// will only inherit from the app's theme, even though the widget that
  /// triggered the push may inherit from a theme that "shadows" the app's
  /// theme because it's deeper in the widget tree. Apps can find the shadowing
  /// theme with `Theme.of(context, shadowThemeOnly: true)` and pass it along
  /// to the class that creates a route's widgets. Material widgets that push
  /// routes, like [PopupMenuButton] and [DropdownButton], do this.
  final bool isMaterialAppTheme;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  static final ThemeData _kFallbackTheme = ThemeData.fallback();

  /// The data from the closest [Theme] instance that encloses the given
  /// context.
  ///
  /// If the given context is enclosed in a [Localizations] widget providing
  /// [MaterialLocalizations], the returned data is localized according to the
  /// nearest available [MaterialLocalizations].
  ///
  /// Defaults to [new ThemeData.fallback] if there is no [Theme] in the given
  /// build context.
  ///
  /// If [shadowThemeOnly] is true and the closest [Theme] ancestor was
  /// installed by the [MaterialApp] — in other words if the closest [Theme]
  /// ancestor does not shadow the application's theme — then this returns null.
  /// This argument should be used in situations where its useful to wrap a
  /// route's widgets with a [Theme], but only when the application's overall
  /// theme is being shadowed by a [Theme] widget that is deeper in the tree.
  /// See [isMaterialAppTheme].
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// @override
  /// Widget build(BuildContext context) {
  ///   return Text(
  ///     'Example',
  ///     style: Theme.of(context).textTheme.title,
  ///   );
  /// }
  /// ```
  ///
  /// When the [Theme] is actually created in the same `build` function
  /// (possibly indirectly, e.g. as part of a [MaterialApp]), the `context`
  /// argument to the `build` function can't be used to find the [Theme] (since
  /// it's "above" the widget being returned). In such cases, the following
  /// technique with a [Builder] can be used to provide a new scope with a
  /// [BuildContext] that is "under" the [Theme]:
  ///
  /// ```dart
  /// @override
  /// Widget build(BuildContext context) {
  ///   return MaterialApp(
  ///     theme: ThemeData.light(),
  ///     body: Builder(
  ///       // Create an inner BuildContext so that we can refer to
  ///       // the Theme with Theme.of().
  ///       builder: (BuildContext context) {
  ///         return Center(
  ///           child: Text(
  ///             'Example',
  ///             style: Theme.of(context).textTheme.title,
  ///           ),
  ///         );
  ///       },
  ///     ),
  ///   );
  /// }
  /// ```
  static ThemeData of(BuildContext context, {bool shadowThemeOnly = false}) {
    final _InheritedTheme inheritedTheme =
        context.inheritFromWidgetOfExactType(_InheritedTheme);
    if (shadowThemeOnly) {
      if (inheritedTheme == null || inheritedTheme.theme.isMaterialAppTheme)
        return null;
      return inheritedTheme.theme.data;
    }

    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    final ScriptCategory category =
        localizations?.scriptCategory ?? ScriptCategory.englishLike;
    final ThemeData theme = inheritedTheme?.theme?.data ?? _kFallbackTheme;
    return ThemeData.localize(
        theme, theme.typography.geometryThemeFor(category));
  }

  @override
  Widget build(BuildContext context) {
    print('xie Theme: build');
    return _InheritedTheme(
        theme: this,
        child: CupertinoTheme(
          // We're using a MaterialBasedCupertinoThemeData here instead of a
          // CupertinoThemeData because it defers some properties to the Material
          // ThemeData.
          data: MaterialBasedCupertinoThemeData(
            materialTheme: data,
          ),
          child: IconTheme(
            data: data.iconTheme,
            child: child,
          ),
        ));
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<ThemeData>('data', data, showName: false));
  }
}

class MaterialBasedCupertinoThemeData extends CupertinoThemeData {
  /// Create a [MaterialBasedCupertinoThemeData] based on a Material [ThemeData]
  /// and its `cupertinoOverrideTheme`.
  ///
  /// The [materialTheme] parameter must not be null.
  MaterialBasedCupertinoThemeData({
    @required ThemeData materialTheme,
  })  : assert(materialTheme != null),
        _materialTheme = materialTheme,
        // Pass all values to the superclass so Material-agnostic properties
        // like barBackgroundColor can still behave like a normal
        // CupertinoThemeData.
        super.raw(
          materialTheme.cupertinoOverrideTheme?.brightness,
          materialTheme.cupertinoOverrideTheme?.primaryColor,
          materialTheme.cupertinoOverrideTheme?.primaryContrastingColor,
          materialTheme.cupertinoOverrideTheme?.textTheme,
          materialTheme.cupertinoOverrideTheme?.barBackgroundColor,
          materialTheme.cupertinoOverrideTheme?.scaffoldBackgroundColor,
        );

  final ThemeData _materialTheme;

  @override
  Brightness get brightness =>
      _materialTheme.cupertinoOverrideTheme?.brightness ??
      _materialTheme.brightness;

  @override
  Color get primaryColor =>
      _materialTheme.cupertinoOverrideTheme?.primaryColor ??
      _materialTheme.colorScheme.primary;

  @override
  Color get primaryContrastingColor =>
      _materialTheme.cupertinoOverrideTheme?.primaryContrastingColor ??
      _materialTheme.colorScheme.onPrimary;

  @override
  Color get scaffoldBackgroundColor =>
      _materialTheme.cupertinoOverrideTheme?.scaffoldBackgroundColor ??
      _materialTheme.scaffoldBackgroundColor;

  /// Copies the [ThemeData]'s `cupertinoOverrideTheme`.
  ///
  /// Only the specified override attributes of the [ThemeData]'s
  /// `cupertinoOverrideTheme` and the newly specified parameters are in the
  /// returned [CupertinoThemeData]. No derived attributes from iOS defaults or
  /// from cascaded Material theme attributes are copied.
  ///
  /// [MaterialBasedCupertinoThemeData.copyWith] cannot change the base
  /// Material [ThemeData]. To change the base Material [ThemeData], create a
  /// new Material [Theme] and use `copyWith` on the Material [ThemeData]
  /// instead.
  @override
  CupertinoThemeData copyWith({
    Brightness brightness,
    Color primaryColor,
    Color primaryContrastingColor,
    CupertinoTextThemeData textTheme,
    Color barBackgroundColor,
    Color scaffoldBackgroundColor,
  }) {
    return _materialTheme.cupertinoOverrideTheme?.copyWith(
          brightness: brightness,
          primaryColor: primaryColor,
          primaryContrastingColor: primaryContrastingColor,
          textTheme: textTheme,
          barBackgroundColor: barBackgroundColor,
          scaffoldBackgroundColor: scaffoldBackgroundColor,
        ) ??
        CupertinoThemeData(
          brightness: brightness,
          primaryColor: primaryColor,
          primaryContrastingColor: primaryContrastingColor,
          textTheme: textTheme,
          barBackgroundColor: barBackgroundColor,
          scaffoldBackgroundColor: scaffoldBackgroundColor,
        );
  }
}

class _InheritedTheme extends InheritedWidget {
  const _InheritedTheme({
    Key key,
    @required this.theme,
    @required Widget child,
  })  : assert(theme != null),
        super(key: key, child: child);

  final Theme theme;

  @override
  bool updateShouldNotify(_InheritedTheme old) => theme.data != old.theme.data;
}

// solve for the actual color of the highlight:
const Color _kLightThemeHighlightColor = Color(0x66BCBCBC);

// The same video shows the splash compositing to #D7D7D7 on a background of
// #E1E1E1. Again, assuming the splash has an opacity of 0x66, we can solve for
// the actual color of the splash:
const Color _kLightThemeSplashColor = Color(0x66C8C8C8);

// Unfortunately, a similar video isn't available for the dark theme, which
// means we assume the values in the spec are actually correct.
const Color _kDarkThemeHighlightColor = Color(0x40CCCCCC);
const Color _kDarkThemeSplashColor = Color(0x40CCCCCC);

class ThemeData extends Diagnosticable {
  /// Create a [ThemeData] given a set of preferred values.
  ///
  /// Default values will be derived for arguments that are omitted.
  ///
  /// The most useful values to give are, in order of importance:
  ///
  ///  * The desired theme [brightness].
  ///
  ///  * The primary color palette (the [primarySwatch]), chosen from
  ///    one of the swatches defined by the material design spec. This
  ///    should be one of the maps from the [Colors] class that do not
  ///    have "accent" in their name.
  ///
  ///  * The [accentColor], sometimes called the secondary color, and,
  ///    if the accent color is specified, its brightness
  ///    ([accentColorBrightness]), so that the right contrasting text
  ///    color will be used over the accent color.
  ///
  /// See <https://material.io/design/color/> for
  /// more discussion on how to pick the right colors.
  factory ThemeData({
    Brightness brightness,
    MaterialColor primarySwatch,
    Color primaryColor,
    Brightness primaryColorBrightness,
    Color primaryColorLight,
    Color primaryColorDark,
    Color accentColor,
    Brightness accentColorBrightness,
    Color canvasColor,
    Color scaffoldBackgroundColor,
    Color bottomAppBarColor,
    Color cardColor,
    Color dividerColor,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    InteractiveInkFeatureFactory splashFactory,
    Color selectedRowColor,
    Color unselectedWidgetColor,
    Color disabledColor,
    Color buttonColor,
    ButtonThemeData buttonTheme,
    ToggleButtonsThemeData toggleButtonsTheme,
    Color secondaryHeaderColor,
    Color textSelectionColor,
    Color cursorColor,
    Color textSelectionHandleColor,
    Color backgroundColor,
    Color dialogBackgroundColor,
    Color indicatorColor,
    Color hintColor,
    Color errorColor,
    Color toggleableActiveColor,
    String fontFamily,
    TextTheme textTheme,
    TextTheme primaryTextTheme,
    TextTheme accentTextTheme,
    InputDecorationTheme inputDecorationTheme,
    IconThemeData iconTheme,
    IconThemeData primaryIconTheme,
    IconThemeData accentIconTheme,
    SliderThemeData sliderTheme,
    TabBarTheme tabBarTheme,
    TooltipThemeData tooltipTheme,
    CardTheme cardTheme,
    ChipThemeData chipTheme,
    TargetPlatform platform,
    MaterialTapTargetSize materialTapTargetSize,
    bool applyElevationOverlayColor,
    PageTransitionsTheme pageTransitionsTheme,
    AppBarTheme appBarTheme,
    BottomAppBarTheme bottomAppBarTheme,
    ColorScheme colorScheme,
    DialogTheme dialogTheme,
    FloatingActionButtonThemeData floatingActionButtonTheme,
    Typography typography,
    CupertinoThemeData cupertinoOverrideTheme,
    SnackBarThemeData snackBarTheme,
    BottomSheetThemeData bottomSheetTheme,
    PopupMenuThemeData popupMenuTheme,
    MaterialBannerThemeData bannerTheme,
    DividerThemeData dividerTheme,
  }) {
    brightness ??= Brightness.light;
    final bool isDark = brightness == Brightness.dark;
    primarySwatch ??= Colors.blue;
    primaryColor ??= isDark ? Colors.grey[900] : primarySwatch;
    primaryColorBrightness ??= estimateBrightnessForColor(primaryColor);
    primaryColorLight ??= isDark ? Colors.grey[500] : primarySwatch[100];
    primaryColorDark ??= isDark ? Colors.black : primarySwatch[700];
    final bool primaryIsDark = primaryColorBrightness == Brightness.dark;
    toggleableActiveColor ??=
        isDark ? Colors.tealAccent[200] : (accentColor ?? primarySwatch[600]);
    accentColor ??= isDark ? Colors.tealAccent[200] : primarySwatch[500];
    accentColorBrightness ??= estimateBrightnessForColor(accentColor);
    final bool accentIsDark = accentColorBrightness == Brightness.dark;
    canvasColor ??= isDark ? Colors.grey[850] : Colors.grey[50];
    scaffoldBackgroundColor ??= canvasColor;
    bottomAppBarColor ??= isDark ? Colors.grey[800] : Colors.white;
    cardColor ??= isDark ? Colors.grey[800] : Colors.white;
    dividerColor ??= isDark ? const Color(0x1FFFFFFF) : const Color(0x1F000000);

    // Create a ColorScheme that is backwards compatible as possible
    // with the existing default ThemeData color values.
    colorScheme ??= ColorScheme.fromSwatch(
      primarySwatch: primarySwatch,
      primaryColorDark: primaryColorDark,
      accentColor: accentColor,
      cardColor: cardColor,
      backgroundColor: backgroundColor,
      errorColor: errorColor,
      brightness: brightness,
    );

    splashFactory ??= InkSplash.splashFactory;
    selectedRowColor ??= Colors.grey[100];
    unselectedWidgetColor ??= isDark ? Colors.white70 : Colors.black54;
    // Spec doesn't specify a dark theme secondaryHeaderColor, this is a guess.
    secondaryHeaderColor ??= isDark ? Colors.grey[700] : primarySwatch[50];
    textSelectionColor ??= isDark ? accentColor : primarySwatch[200];
    // TODO(sandrasandeep): change to color provided by Material Design team
    cursorColor = cursorColor ?? const Color.fromRGBO(66, 133, 244, 1.0);
    textSelectionHandleColor ??=
        isDark ? Colors.tealAccent[400] : primarySwatch[300];
    backgroundColor ??= isDark ? Colors.grey[700] : primarySwatch[200];
    dialogBackgroundColor ??= isDark ? Colors.grey[800] : Colors.white;
    indicatorColor ??= accentColor == primaryColor ? Colors.white : accentColor;
    hintColor ??= isDark ? const Color(0x80FFFFFF) : const Color(0x8A000000);
    errorColor ??= Colors.red[700];
    inputDecorationTheme ??= const InputDecorationTheme();
    pageTransitionsTheme ??= const PageTransitionsTheme();
    primaryIconTheme ??= primaryIsDark
        ? const IconThemeData(color: Colors.white)
        : const IconThemeData(color: Colors.black);
    accentIconTheme ??= accentIsDark
        ? const IconThemeData(color: Colors.white)
        : const IconThemeData(color: Colors.black);
    iconTheme ??= isDark
        ? const IconThemeData(color: Colors.white)
        : const IconThemeData(color: Colors.black87);
    platform ??= defaultTargetPlatform;
    typography ??= Typography(platform: platform);
    final TextTheme defaultTextTheme =
        isDark ? typography.white : typography.black;
    textTheme = defaultTextTheme.merge(textTheme);
    final TextTheme defaultPrimaryTextTheme =
        primaryIsDark ? typography.white : typography.black;
    primaryTextTheme = defaultPrimaryTextTheme.merge(primaryTextTheme);
    final TextTheme defaultAccentTextTheme =
        accentIsDark ? typography.white : typography.black;
    accentTextTheme = defaultAccentTextTheme.merge(accentTextTheme);
    materialTapTargetSize ??= MaterialTapTargetSize.padded;
    applyElevationOverlayColor ??= false;
    if (fontFamily != null) {
      textTheme = textTheme.apply(fontFamily: fontFamily);
      primaryTextTheme = primaryTextTheme.apply(fontFamily: fontFamily);
      accentTextTheme = accentTextTheme.apply(fontFamily: fontFamily);
    }

    // Used as the default color (fill color) for RaisedButtons. Computing the
    // default for ButtonThemeData for the sake of backwards compatibility.
    buttonColor ??= isDark ? primarySwatch[600] : Colors.grey[300];
    focusColor ??= isDark
        ? Colors.white.withOpacity(0.12)
        : Colors.black.withOpacity(0.12);
    hoverColor ??= isDark
        ? Colors.white.withOpacity(0.04)
        : Colors.black.withOpacity(0.04);
    buttonTheme ??= ButtonThemeData(
      colorScheme: colorScheme,
      buttonColor: buttonColor,
      disabledColor: disabledColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      materialTapTargetSize: materialTapTargetSize,
    );
    toggleButtonsTheme ??= const ToggleButtonsThemeData();
    disabledColor ??= isDark ? Colors.white38 : Colors.black38;
    highlightColor ??=
        isDark ? _kDarkThemeHighlightColor : _kLightThemeHighlightColor;
    splashColor ??= isDark ? _kDarkThemeSplashColor : _kLightThemeSplashColor;

    sliderTheme ??= const SliderThemeData();
    tabBarTheme ??= const TabBarTheme();
    tooltipTheme ??= const TooltipThemeData();
    appBarTheme ??= const AppBarTheme();
    bottomAppBarTheme ??= const BottomAppBarTheme();
    cardTheme ??= const CardTheme();
    chipTheme ??= ChipThemeData.fromDefaults(
      secondaryColor: primaryColor,
      brightness: brightness,
      labelStyle: textTheme.body2,
    );
    dialogTheme ??= const DialogTheme();
    floatingActionButtonTheme ??= const FloatingActionButtonThemeData();
    cupertinoOverrideTheme = cupertinoOverrideTheme?.noDefault();
    snackBarTheme ??= const SnackBarThemeData();
    bottomSheetTheme ??= const BottomSheetThemeData();
    popupMenuTheme ??= const PopupMenuThemeData();
    bannerTheme ??= const MaterialBannerThemeData();
    dividerTheme ??= const DividerThemeData();

    return ThemeData.raw(
      brightness: brightness,
      primaryColor: primaryColor,
      primaryColorBrightness: primaryColorBrightness,
      primaryColorLight: primaryColorLight,
      primaryColorDark: primaryColorDark,
      accentColor: accentColor,
      accentColorBrightness: accentColorBrightness,
      canvasColor: canvasColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      bottomAppBarColor: bottomAppBarColor,
      cardColor: cardColor,
      dividerColor: dividerColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      splashFactory: splashFactory,
      selectedRowColor: selectedRowColor,
      unselectedWidgetColor: unselectedWidgetColor,
      disabledColor: disabledColor,
      buttonTheme: buttonTheme,
      buttonColor: buttonColor,
      toggleButtonsTheme: toggleButtonsTheme,
      toggleableActiveColor: toggleableActiveColor,
      secondaryHeaderColor: secondaryHeaderColor,
      textSelectionColor: textSelectionColor,
      cursorColor: cursorColor,
      textSelectionHandleColor: textSelectionHandleColor,
      backgroundColor: backgroundColor,
      dialogBackgroundColor: dialogBackgroundColor,
      indicatorColor: indicatorColor,
      hintColor: hintColor,
      errorColor: errorColor,
      textTheme: textTheme,
      primaryTextTheme: primaryTextTheme,
      accentTextTheme: accentTextTheme,
      inputDecorationTheme: inputDecorationTheme,
      iconTheme: iconTheme,
      primaryIconTheme: primaryIconTheme,
      accentIconTheme: accentIconTheme,
      sliderTheme: sliderTheme,
      tabBarTheme: tabBarTheme,
      tooltipTheme: tooltipTheme,
      cardTheme: cardTheme,
      chipTheme: chipTheme,
      platform: platform,
      materialTapTargetSize: materialTapTargetSize,
      applyElevationOverlayColor: applyElevationOverlayColor,
      pageTransitionsTheme: pageTransitionsTheme,
      appBarTheme: appBarTheme,
      bottomAppBarTheme: bottomAppBarTheme,
      colorScheme: colorScheme,
      dialogTheme: dialogTheme,
      floatingActionButtonTheme: floatingActionButtonTheme,
      typography: typography,
      cupertinoOverrideTheme: cupertinoOverrideTheme,
      snackBarTheme: snackBarTheme,
      bottomSheetTheme: bottomSheetTheme,
      popupMenuTheme: popupMenuTheme,
      bannerTheme: bannerTheme,
      dividerTheme: dividerTheme,
    );
  }

  /// Create a [ThemeData] given a set of exact values. All the values must be
  /// specified. They all must also be non-null except for
  /// [cupertinoOverrideTheme].
  ///
  /// This will rarely be used directly. It is used by [lerp] to
  /// create intermediate themes based on two themes created with the
  /// [new ThemeData] constructor.
  const ThemeData.raw({
    // Warning: make sure these properties are in the exact same order as in
    // operator == and in the hashValues method and in the order of fields
    // in this class, and in the lerp() method.
    @required this.brightness,
    @required this.primaryColor,
    @required this.primaryColorBrightness,
    @required this.primaryColorLight,
    @required this.primaryColorDark,
    @required this.canvasColor,
    @required this.accentColor,
    @required this.accentColorBrightness,
    @required this.scaffoldBackgroundColor,
    @required this.bottomAppBarColor,
    @required this.cardColor,
    @required this.dividerColor,
    @required this.focusColor,
    @required this.hoverColor,
    @required this.highlightColor,
    @required this.splashColor,
    @required this.splashFactory,
    @required this.selectedRowColor,
    @required this.unselectedWidgetColor,
    @required this.disabledColor,
    @required this.buttonTheme,
    @required this.buttonColor,
    @required this.toggleButtonsTheme,
    @required this.secondaryHeaderColor,
    @required this.textSelectionColor,
    @required this.cursorColor,
    @required this.textSelectionHandleColor,
    @required this.backgroundColor,
    @required this.dialogBackgroundColor,
    @required this.indicatorColor,
    @required this.hintColor,
    @required this.errorColor,
    @required this.toggleableActiveColor,
    @required this.textTheme,
    @required this.primaryTextTheme,
    @required this.accentTextTheme,
    @required this.inputDecorationTheme,
    @required this.iconTheme,
    @required this.primaryIconTheme,
    @required this.accentIconTheme,
    @required this.sliderTheme,
    @required this.tabBarTheme,
    @required this.tooltipTheme,
    @required this.cardTheme,
    @required this.chipTheme,
    @required this.platform,
    @required this.materialTapTargetSize,
    @required this.applyElevationOverlayColor,
    @required this.pageTransitionsTheme,
    @required this.appBarTheme,
    @required this.bottomAppBarTheme,
    @required this.colorScheme,
    @required this.dialogTheme,
    @required this.floatingActionButtonTheme,
    @required this.typography,
    @required this.cupertinoOverrideTheme,
    @required this.snackBarTheme,
    @required this.bottomSheetTheme,
    @required this.popupMenuTheme,
    @required this.bannerTheme,
    @required this.dividerTheme,
  })  : assert(brightness != null),
        assert(primaryColor != null),
        assert(primaryColorBrightness != null),
        assert(primaryColorLight != null),
        assert(primaryColorDark != null),
        assert(accentColor != null),
        assert(accentColorBrightness != null),
        assert(canvasColor != null),
        assert(scaffoldBackgroundColor != null),
        assert(bottomAppBarColor != null),
        assert(cardColor != null),
        assert(dividerColor != null),
        assert(focusColor != null),
        assert(hoverColor != null),
        assert(highlightColor != null),
        assert(splashColor != null),
        assert(splashFactory != null),
        assert(selectedRowColor != null),
        assert(unselectedWidgetColor != null),
        assert(disabledColor != null),
        assert(toggleableActiveColor != null),
        assert(buttonTheme != null),
        assert(toggleButtonsTheme != null),
        assert(secondaryHeaderColor != null),
        assert(textSelectionColor != null),
        assert(cursorColor != null),
        assert(textSelectionHandleColor != null),
        assert(backgroundColor != null),
        assert(dialogBackgroundColor != null),
        assert(indicatorColor != null),
        assert(hintColor != null),
        assert(errorColor != null),
        assert(textTheme != null),
        assert(primaryTextTheme != null),
        assert(accentTextTheme != null),
        assert(inputDecorationTheme != null),
        assert(iconTheme != null),
        assert(primaryIconTheme != null),
        assert(accentIconTheme != null),
        assert(sliderTheme != null),
        assert(tabBarTheme != null),
        assert(tooltipTheme != null),
        assert(cardTheme != null),
        assert(chipTheme != null),
        assert(platform != null),
        assert(materialTapTargetSize != null),
        assert(pageTransitionsTheme != null),
        assert(appBarTheme != null),
        assert(bottomAppBarTheme != null),
        assert(colorScheme != null),
        assert(dialogTheme != null),
        assert(floatingActionButtonTheme != null),
        assert(typography != null),
        assert(snackBarTheme != null),
        assert(bottomSheetTheme != null),
        assert(popupMenuTheme != null),
        assert(bannerTheme != null),
        assert(dividerTheme != null);

  /// Create a [ThemeData] based on the colors in the given [colorScheme] and
  /// text styles of the optional [textTheme].
  ///
  /// The [colorScheme] can not be null.
  ///
  /// If [colorScheme.brightness] is [Brightness.dark] then
  /// [ThemeData.applyElevationOverlayColor] will be set to true to support
  /// the Material dark theme method for indicating elevation by overlaying
  /// a semi-transparent white color on top of the surface color.
  ///
  /// This is the recommended method to theme your application. As we move
  /// forward we will be converting all the widget implementations to only use
  /// colors or colors derived from those in [ColorScheme].
  ///
  /// {@tool sample}
  /// This example will set up an application to use the baseline Material
  /// Design light and dark themes.
  ///
  /// ```dart
  /// MaterialApp(
  ///   theme: ThemeData.from(colorScheme: ColorScheme.light()),
  ///   darkTheme: ThemeData.from(colorScheme: ColorScheme.dark()),
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// See <https://material.io/design/color/> for
  /// more discussion on how to pick the right colors.
  factory ThemeData.from({
    @required ColorScheme colorScheme,
    TextTheme textTheme,
  }) {
    assert(colorScheme != null);

    final bool isDark = colorScheme.brightness == Brightness.dark;

    // For surfaces that use primary color in light themes and surface color in dark
    final Color primarySurfaceColor =
        isDark ? colorScheme.surface : colorScheme.primary;
    final Color onPrimarySurfaceColor =
        isDark ? colorScheme.onSurface : colorScheme.onPrimary;

    return ThemeData(
      brightness: colorScheme.brightness,
      primaryColor: primarySurfaceColor,
      primaryColorBrightness:
          ThemeData.estimateBrightnessForColor(primarySurfaceColor),
      canvasColor: colorScheme.background,
      accentColor: colorScheme.secondary,
      accentColorBrightness:
          ThemeData.estimateBrightnessForColor(colorScheme.secondary),
      scaffoldBackgroundColor: colorScheme.background,
      cardColor: colorScheme.surface,
      dividerColor: colorScheme.onSurface.withOpacity(0.12),
      backgroundColor: colorScheme.background,
      dialogBackgroundColor: colorScheme.background,
      errorColor: colorScheme.error,
      textTheme: textTheme,
      indicatorColor: onPrimarySurfaceColor,
      applyElevationOverlayColor: isDark,
      colorScheme: colorScheme,
    );
  }

  /// A default light blue theme.
  ///
  /// This theme does not contain text geometry. Instead, it is expected that
  /// this theme is localized using text geometry using [ThemeData.localize].
  factory ThemeData.light() => ThemeData(brightness: Brightness.light);

  /// A default dark theme with a teal accent color.
  ///
  /// This theme does not contain text geometry. Instead, it is expected that
  /// this theme is localized using text geometry using [ThemeData.localize].
  factory ThemeData.dark() => ThemeData(brightness: Brightness.dark);

  /// The default color theme. Same as [new ThemeData.light].
  ///
  /// This is used by [Theme.of] when no theme has been specified.
  ///
  /// This theme does not contain text geometry. Instead, it is expected that
  /// this theme is localized using text geometry using [ThemeData.localize].
  ///
  /// Most applications would use [Theme.of], which provides correct localized
  /// text geometry.
  factory ThemeData.fallback() => ThemeData.light();

  // Warning: make sure these properties are in the exact same order as in
  // hashValues() and in the raw constructor and in the order of fields in
  // the class and in the lerp() method.

  /// The brightness of the overall theme of the application. Used by widgets
  /// like buttons to determine what color to pick when not using the primary or
  /// accent color.
  ///
  /// When the [Brightness] is dark, the canvas, card, and primary colors are
  /// all dark. When the [Brightness] is light, the canvas and card colors
  /// are bright, and the primary color's darkness varies as described by
  /// primaryColorBrightness. The primaryColor does not contrast well with the
  /// card and canvas colors when the brightness is dark; when the brightness is
  /// dark, use Colors.white or the accentColor for a contrasting color.
  final Brightness brightness;

  /// The background color for major parts of the app (toolbars, tab bars, etc)
  ///
  /// The theme's [colorScheme] property contains [ColorScheme.primary], as
  /// well as a color that contrasts well with the primary color called
  /// [ColorScheme.onPrimary]. It might be simpler to just configure an app's
  /// visuals in terms of the theme's [colorScheme].
  final Color primaryColor;

  /// The brightness of the [primaryColor]. Used to determine the color of text and
  /// icons placed on top of the primary color (e.g. toolbar text).
  final Brightness primaryColorBrightness;

  /// A lighter version of the [primaryColor].
  final Color primaryColorLight;

  /// A darker version of the [primaryColor].
  final Color primaryColorDark;

  /// The default color of [MaterialType.canvas] [Material].
  final Color canvasColor;

  /// The foreground color for widgets (knobs, text, overscroll edge effect, etc).
  ///
  /// Accent color is also known as the secondary color.
  ///
  /// The theme's [colorScheme] property contains [ColorScheme.secondary], as
  /// well as a color that contrasts well with the secondary color called
  /// [ColorScheme.onSecondary]. It might be simpler to just configure an app's
  /// visuals in terms of the theme's [colorScheme].
  final Color accentColor;

  /// The brightness of the [accentColor]. Used to determine the color of text
  /// and icons placed on top of the accent color (e.g. the icons on a floating
  /// action button).
  final Brightness accentColorBrightness;

  /// The default color of the [Material] that underlies the [Scaffold]. The
  /// background color for a typical material app or a page within the app.
  final Color scaffoldBackgroundColor;

  /// The default color of the [BottomAppBar].
  ///
  /// This can be overridden by specifying [BottomAppBar.color].
  final Color bottomAppBarColor;

  /// The color of [Material] when it is used as a [Card].
  final Color cardColor;

  /// The color of [Divider]s and [PopupMenuDivider]s, also used
  /// between [ListTile]s, between rows in [DataTable]s, and so forth.
  ///
  /// To create an appropriate [BorderSide] that uses this color, consider
  /// [Divider.createBorderSide].
  final Color dividerColor;

  /// The focus color used indicate that a component has the input focus.
  final Color focusColor;

  /// The hover color used to indicate when a pointer is hovering over a
  /// component.
  final Color hoverColor;

  /// The highlight color used during ink splash animations or to
  /// indicate an item in a menu is selected.
  final Color highlightColor;

  /// The color of ink splashes. See [InkWell].
  final Color splashColor;

  /// Defines the appearance of ink splashes produces by [InkWell]
  /// and [InkResponse].
  ///
  /// See also:
  ///
  ///  * [InkSplash.splashFactory], which defines the default splash.
  ///  * [InkRipple.splashFactory], which defines a splash that spreads out
  ///    more aggressively than the default.
  final InteractiveInkFeatureFactory splashFactory;

  /// The color used to highlight selected rows.
  final Color selectedRowColor;

  /// The color used for widgets in their inactive (but enabled)
  /// state. For example, an unchecked checkbox. Usually contrasted
  /// with the [accentColor]. See also [disabledColor].
  final Color unselectedWidgetColor;

  /// The color used for widgets that are inoperative, regardless of
  /// their state. For example, a disabled checkbox (which may be
  /// checked or unchecked).
  final Color disabledColor;

  /// Defines the default configuration of button widgets, like [RaisedButton]
  /// and [FlatButton].
  final ButtonThemeData buttonTheme;

  /// Defines the default configuration of [ToggleButtons] widgets.
  final ToggleButtonsThemeData toggleButtonsTheme;

  /// The default fill color of the [Material] used in [RaisedButton]s.
  final Color buttonColor;

  /// The color of the header of a [PaginatedDataTable] when there are selected rows.
  // According to the spec for data tables:
  // https://material.io/archive/guidelines/components/data-tables.html#data-tables-tables-within-cards
  // ...this should be the "50-value of secondary app color".
  final Color secondaryHeaderColor;

  /// The color of text selections in text fields, such as [TextField].
  final Color textSelectionColor;

  /// The color of cursors in Material-style text fields, such as [TextField].
  final Color cursorColor;

  /// The color of the handles used to adjust what part of the text is currently selected.
  final Color textSelectionHandleColor;

  /// A color that contrasts with the [primaryColor], e.g. used as the
  /// remaining part of a progress bar.
  final Color backgroundColor;

  /// The background color of [Dialog] elements.
  final Color dialogBackgroundColor;

  /// The color of the selected tab indicator in a tab bar.
  final Color indicatorColor;

  /// The color to use for hint text or placeholder text, e.g. in
  /// [TextField] fields.
  final Color hintColor;

  /// The color to use for input validation errors, e.g. in [TextField] fields.
  final Color errorColor;

  /// The color used to highlight the active states of toggleable widgets like
  /// [Switch], [Radio], and [Checkbox].
  final Color toggleableActiveColor;

  /// Text with a color that contrasts with the card and canvas colors.
  final TextTheme textTheme;

  /// A text theme that contrasts with the primary color.
  final TextTheme primaryTextTheme;

  /// A text theme that contrasts with the accent color.
  final TextTheme accentTextTheme;

  /// The default [InputDecoration] values for [InputDecorator], [TextField],
  /// and [TextFormField] are based on this theme.
  ///
  /// See [InputDecoration.applyDefaults].
  final InputDecorationTheme inputDecorationTheme;

  /// An icon theme that contrasts with the card and canvas colors.
  final IconThemeData iconTheme;

  /// An icon theme that contrasts with the primary color.
  final IconThemeData primaryIconTheme;

  /// An icon theme that contrasts with the accent color.
  final IconThemeData accentIconTheme;

  /// The colors and shapes used to render [Slider].
  ///
  /// This is the value returned from [SliderTheme.of].
  final SliderThemeData sliderTheme;

  /// A theme for customizing the size, shape, and color of the tab bar indicator.
  final TabBarTheme tabBarTheme;

  /// A theme for customizing the visual properties of [Tooltip]s.
  ///
  /// This is the value returned from [TooltipTheme.of].
  final TooltipThemeData tooltipTheme;

  /// The colors and styles used to render [Card].
  ///
  /// This is the value returned from [CardTheme.of].
  final CardTheme cardTheme;

  /// The colors and styles used to render [Chip]s.
  ///
  /// This is the value returned from [ChipTheme.of].
  final ChipThemeData chipTheme;

  /// The platform the material widgets should adapt to target.
  ///
  /// Defaults to the current platform. This should be used in order to style UI
  /// elements according to platform conventions.
  ///
  /// [Platform.defaultTargetPlatform] should be used directly instead only in
  /// rare cases where it's necessary to determine behavior based on the
  /// platform. [dart.io.Platform.environment] should be used when it's critical
  /// to actually know the current platform, without any overrides possible (for
  /// example, when a system API is about to be called).
  final TargetPlatform platform;

  /// Configures the hit test size of certain Material widgets.
  final MaterialTapTargetSize materialTapTargetSize;

  /// Apply a semi-transparent white overlay on Material surfaces to indicate
  /// elevation for dark themes.
  ///
  /// Material drop shadows can be difficult to see in a dark theme, so the
  /// elevation of a surface should be portrayed with an "overlay" in addition
  /// to the shadow. As the elevation of the component increases, the white
  /// overlay increases in opacity. [applyElevationOverlayColor] turns the
  /// application of this overlay on or off.
  ///
  /// If [true] a semi-transparent white overlay will be applied to the color
  /// of [Material] widgets when their [Material.color] is [colorScheme.surface].
  /// The level of transparency is based on [Material.elevation] as per the
  /// Material Dark theme specification.
  ///
  /// If [false] the surface color will be used unmodified.
  ///
  /// Defaults to [false].
  ///
  /// Note: this setting is here to maintain backwards compatibility with
  /// apps that were built before the Material Dark theme specification
  /// was published. New apps should set this to [true] for any themes
  /// where [brightness] is [Brightness.dark].
  ///
  /// See also:
  ///
  ///  * [Material.elevation], which effects how transparent the white overlay is.
  ///  * [Material.color], the white color overlay will only be applied of the
  ///    material's color is [colorScheme.surface].
  ///  * <https://material.io/design/color/dark-theme.html>, which specifies how
  ///    the overlay should be applied.
  final bool applyElevationOverlayColor;

  /// Default [MaterialPageRoute] transitions per [TargetPlatform].
  ///
  /// [MaterialPageRoute.buildTransitions] delegates to a [PageTransitionsBuilder]
  /// whose [PageTransitionsBuilder.platform] matches [platform]. If a matching
  /// builder is not found, a builder whose platform is null is used.
  final PageTransitionsTheme pageTransitionsTheme;

  /// A theme for customizing the color, elevation, brightness, iconTheme and
  /// textTheme of [AppBar]s.
  final AppBarTheme appBarTheme;

  /// A theme for customizing the shape, elevation, and color of a [BottomAppBar].
  final BottomAppBarTheme bottomAppBarTheme;

  /// A set of thirteen colors that can be used to configure the
  /// color properties of most components.
  ///
  /// This property was added much later than the theme's set of highly
  /// specific colors, like [cardColor], [buttonColor], [canvasColor] etc.
  /// New components can be defined exclusively in terms of [colorScheme].
  /// Existing components will gradually migrate to it, to the extent
  /// that is possible without significant backwards compatibility breaks.
  final ColorScheme colorScheme;

  /// A theme for customizing colors, shape, elevation, and behavior of a [SnackBar].
  final SnackBarThemeData snackBarTheme;

  /// A theme for customizing the shape of a dialog.
  final DialogTheme dialogTheme;

  /// A theme for customizing the shape, elevation, and color of a
  /// [FloatingActionButton].
  final FloatingActionButtonThemeData floatingActionButtonTheme;

  /// The color and geometry [TextTheme] values used to configure [textTheme],
  /// [primaryTextTheme], and [accentTextTheme].
  final Typography typography;

  /// Components of the [CupertinoThemeData] to override from the Material
  /// [ThemeData] adaptation.
  ///
  /// By default, [cupertinoOverrideTheme] is null and Cupertino widgets
  /// descendant to the Material [Theme] will adhere to a [CupertinoTheme]
  /// derived from the Material [ThemeData]. e.g. [ThemeData]'s [ColorTheme]
  /// will also inform the [CupertinoThemeData]'s `primaryColor` etc.
  ///
  /// This cascading effect for individual attributes of the [CupertinoThemeData]
  /// can be overridden using attributes of this [cupertinoOverrideTheme].
  final CupertinoThemeData cupertinoOverrideTheme;

  /// A theme for customizing the color, elevation, and shape of a bottom sheet.
  final BottomSheetThemeData bottomSheetTheme;

  /// A theme for customizing the color, shape, elevation, and text style of
  /// popup menus.
  final PopupMenuThemeData popupMenuTheme;

  /// A theme for customizing the color and text style of a [MaterialBanner].
  final MaterialBannerThemeData bannerTheme;

  /// A theme for customizing the color, thickness, and indents of [Divider]s,
  /// [VerticalDivider]s, etc.
  final DividerThemeData dividerTheme;

  /// Creates a copy of this theme but with the given fields replaced with the new values.
  ThemeData copyWith({
    Brightness brightness,
    Color primaryColor,
    Brightness primaryColorBrightness,
    Color primaryColorLight,
    Color primaryColorDark,
    Color accentColor,
    Brightness accentColorBrightness,
    Color canvasColor,
    Color scaffoldBackgroundColor,
    Color bottomAppBarColor,
    Color cardColor,
    Color dividerColor,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    InteractiveInkFeatureFactory splashFactory,
    Color selectedRowColor,
    Color unselectedWidgetColor,
    Color disabledColor,
    ButtonThemeData buttonTheme,
    ToggleButtonsTheme toggleButtonsTheme,
    Color buttonColor,
    Color secondaryHeaderColor,
    Color textSelectionColor,
    Color cursorColor,
    Color textSelectionHandleColor,
    Color backgroundColor,
    Color dialogBackgroundColor,
    Color indicatorColor,
    Color hintColor,
    Color errorColor,
    Color toggleableActiveColor,
    TextTheme textTheme,
    TextTheme primaryTextTheme,
    TextTheme accentTextTheme,
    InputDecorationTheme inputDecorationTheme,
    IconThemeData iconTheme,
    IconThemeData primaryIconTheme,
    IconThemeData accentIconTheme,
    SliderThemeData sliderTheme,
    TabBarTheme tabBarTheme,
    TooltipThemeData tooltipTheme,
    CardTheme cardTheme,
    ChipThemeData chipTheme,
    TargetPlatform platform,
    MaterialTapTargetSize materialTapTargetSize,
    bool applyElevationOverlayColor,
    PageTransitionsTheme pageTransitionsTheme,
    AppBarTheme appBarTheme,
    BottomAppBarTheme bottomAppBarTheme,
    ColorScheme colorScheme,
    DialogTheme dialogTheme,
    FloatingActionButtonThemeData floatingActionButtonTheme,
    Typography typography,
    CupertinoThemeData cupertinoOverrideTheme,
    SnackBarThemeData snackBarTheme,
    BottomSheetThemeData bottomSheetTheme,
    PopupMenuThemeData popupMenuTheme,
    MaterialBannerThemeData bannerTheme,
    DividerThemeData dividerTheme,
  }) {
    cupertinoOverrideTheme = cupertinoOverrideTheme?.noDefault();
    return ThemeData.raw(
      brightness: brightness ?? this.brightness,
      primaryColor: primaryColor ?? this.primaryColor,
      primaryColorBrightness:
          primaryColorBrightness ?? this.primaryColorBrightness,
      primaryColorLight: primaryColorLight ?? this.primaryColorLight,
      primaryColorDark: primaryColorDark ?? this.primaryColorDark,
      accentColor: accentColor ?? this.accentColor,
      accentColorBrightness:
          accentColorBrightness ?? this.accentColorBrightness,
      canvasColor: canvasColor ?? this.canvasColor,
      scaffoldBackgroundColor:
          scaffoldBackgroundColor ?? this.scaffoldBackgroundColor,
      bottomAppBarColor: bottomAppBarColor ?? this.bottomAppBarColor,
      cardColor: cardColor ?? this.cardColor,
      dividerColor: dividerColor ?? this.dividerColor,
      focusColor: focusColor ?? this.focusColor,
      hoverColor: hoverColor ?? this.hoverColor,
      highlightColor: highlightColor ?? this.highlightColor,
      splashColor: splashColor ?? this.splashColor,
      splashFactory: splashFactory ?? this.splashFactory,
      selectedRowColor: selectedRowColor ?? this.selectedRowColor,
      unselectedWidgetColor:
          unselectedWidgetColor ?? this.unselectedWidgetColor,
      disabledColor: disabledColor ?? this.disabledColor,
      buttonColor: buttonColor ?? this.buttonColor,
      buttonTheme: buttonTheme ?? this.buttonTheme,
      toggleButtonsTheme: toggleButtonsTheme ?? this.toggleButtonsTheme,
      secondaryHeaderColor: secondaryHeaderColor ?? this.secondaryHeaderColor,
      textSelectionColor: textSelectionColor ?? this.textSelectionColor,
      cursorColor: cursorColor ?? this.cursorColor,
      textSelectionHandleColor:
          textSelectionHandleColor ?? this.textSelectionHandleColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      dialogBackgroundColor:
          dialogBackgroundColor ?? this.dialogBackgroundColor,
      indicatorColor: indicatorColor ?? this.indicatorColor,
      hintColor: hintColor ?? this.hintColor,
      errorColor: errorColor ?? this.errorColor,
      toggleableActiveColor:
          toggleableActiveColor ?? this.toggleableActiveColor,
      textTheme: textTheme ?? this.textTheme,
      primaryTextTheme: primaryTextTheme ?? this.primaryTextTheme,
      accentTextTheme: accentTextTheme ?? this.accentTextTheme,
      inputDecorationTheme: inputDecorationTheme ?? this.inputDecorationTheme,
      iconTheme: iconTheme ?? this.iconTheme,
      primaryIconTheme: primaryIconTheme ?? this.primaryIconTheme,
      accentIconTheme: accentIconTheme ?? this.accentIconTheme,
      sliderTheme: sliderTheme ?? this.sliderTheme,
      tabBarTheme: tabBarTheme ?? this.tabBarTheme,
      tooltipTheme: tooltipTheme ?? this.tooltipTheme,
      cardTheme: cardTheme ?? this.cardTheme,
      chipTheme: chipTheme ?? this.chipTheme,
      platform: platform ?? this.platform,
      materialTapTargetSize:
          materialTapTargetSize ?? this.materialTapTargetSize,
      applyElevationOverlayColor:
          applyElevationOverlayColor ?? this.applyElevationOverlayColor,
      pageTransitionsTheme: pageTransitionsTheme ?? this.pageTransitionsTheme,
      appBarTheme: appBarTheme ?? this.appBarTheme,
      bottomAppBarTheme: bottomAppBarTheme ?? this.bottomAppBarTheme,
      colorScheme: colorScheme ?? this.colorScheme,
      dialogTheme: dialogTheme ?? this.dialogTheme,
      floatingActionButtonTheme:
          floatingActionButtonTheme ?? this.floatingActionButtonTheme,
      typography: typography ?? this.typography,
      cupertinoOverrideTheme:
          cupertinoOverrideTheme ?? this.cupertinoOverrideTheme,
      snackBarTheme: snackBarTheme ?? this.snackBarTheme,
      bottomSheetTheme: bottomSheetTheme ?? this.bottomSheetTheme,
      popupMenuTheme: popupMenuTheme ?? this.popupMenuTheme,
      bannerTheme: bannerTheme ?? this.bannerTheme,
      dividerTheme: dividerTheme ?? this.dividerTheme,
    );
  }

  // The number 5 was chosen without any real science or research behind it. It
  // just seemed like a number that's not too big (we should be able to fit 5
  // copies of ThemeData in memory comfortably) and not too small (most apps
  // shouldn't have more than 5 theme/localization pairs).
  static const int _localizedThemeDataCacheSize = 5;

  /// Caches localized themes to speed up the [localize] method.
  static final _FifoCache<_IdentityThemeDataCacheKey, ThemeData>
      _localizedThemeDataCache =
      _FifoCache<_IdentityThemeDataCacheKey, ThemeData>(
          _localizedThemeDataCacheSize);

  /// Returns a new theme built by merging the text geometry provided by the
  /// [localTextGeometry] theme with the [baseTheme].
  ///
  /// For those text styles in the [baseTheme] whose [TextStyle.inherit] is set
  /// to true, the returned theme's text styles inherit the geometric properties
  /// of [localTextGeometry]. The resulting text styles' [TextStyle.inherit] is
  /// set to those provided by [localTextGeometry].
  static ThemeData localize(ThemeData baseTheme, TextTheme localTextGeometry) {
    // WARNING: this method memoizes the result in a cache based on the
    // previously seen baseTheme and localTextGeometry. Memoization is safe
    // because all inputs and outputs of this function are deeply immutable, and
    // the computations are referentially transparent. It only short-circuits
    // the computation if the new inputs are identical() to the previous ones.
    // It does not use the == operator, which performs a costly deep comparison.
    //
    // When changing this method, make sure the memoization logic is correct.
    // Remember:
    //
    // There are only two hard things in Computer Science: cache invalidation
    // and naming things. -- Phil Karlton
    assert(baseTheme != null);
    assert(localTextGeometry != null);

    return _localizedThemeDataCache.putIfAbsent(
      _IdentityThemeDataCacheKey(baseTheme, localTextGeometry),
      () {
        return baseTheme.copyWith(
          primaryTextTheme: localTextGeometry.merge(baseTheme.primaryTextTheme),
          accentTextTheme: localTextGeometry.merge(baseTheme.accentTextTheme),
          textTheme: localTextGeometry.merge(baseTheme.textTheme),
        );
      },
    );
  }

  /// Determines whether the given [Color] is [Brightness.light] or
  /// [Brightness.dark].
  ///
  /// This compares the luminosity of the given color to a threshold value that
  /// matches the material design specification.
  static Brightness estimateBrightnessForColor(Color color) {
    final double relativeLuminance = color.computeLuminance();

    // See <https://www.w3.org/TR/WCAG20/#contrast-ratiodef>
    // The spec says to use kThreshold=0.0525, but Material Design appears to bias
    // more towards using light text than WCAG20 recommends. Material Design spec
    // doesn't say what value to use, but 0.15 seemed close to what the Material
    // Design spec shows for its color palette on
    // <https://material.io/go/design-theming#color-color-palette>.
    const double kThreshold = 0.15;
    if ((relativeLuminance + 0.05) * (relativeLuminance + 0.05) > kThreshold)
      return Brightness.light;
    return Brightness.dark;
  }

  /// Linearly interpolate between two themes.
  ///
  /// The arguments must not be null.
  ///
  /// {@macro dart.ui.shadow.lerp}
  static ThemeData lerp(ThemeData a, ThemeData b, double t) {
    assert(a != null);
    assert(b != null);
    assert(t != null);
    // Warning: make sure these properties are in the exact same order as in
    // hashValues() and in the raw constructor and in the order of fields in
    // the class and in the lerp() method.
    return ThemeData.raw(
      brightness: t < 0.5 ? a.brightness : b.brightness,
      primaryColor: Color.lerp(a.primaryColor, b.primaryColor, t),
      primaryColorBrightness:
          t < 0.5 ? a.primaryColorBrightness : b.primaryColorBrightness,
      primaryColorLight:
          Color.lerp(a.primaryColorLight, b.primaryColorLight, t),
      primaryColorDark: Color.lerp(a.primaryColorDark, b.primaryColorDark, t),
      canvasColor: Color.lerp(a.canvasColor, b.canvasColor, t),
      accentColor: Color.lerp(a.accentColor, b.accentColor, t),
      accentColorBrightness:
          t < 0.5 ? a.accentColorBrightness : b.accentColorBrightness,
      scaffoldBackgroundColor:
          Color.lerp(a.scaffoldBackgroundColor, b.scaffoldBackgroundColor, t),
      bottomAppBarColor:
          Color.lerp(a.bottomAppBarColor, b.bottomAppBarColor, t),
      cardColor: Color.lerp(a.cardColor, b.cardColor, t),
      dividerColor: Color.lerp(a.dividerColor, b.dividerColor, t),
      focusColor: Color.lerp(a.focusColor, b.focusColor, t),
      hoverColor: Color.lerp(a.hoverColor, b.hoverColor, t),
      highlightColor: Color.lerp(a.highlightColor, b.highlightColor, t),
      splashColor: Color.lerp(a.splashColor, b.splashColor, t),
      splashFactory: t < 0.5 ? a.splashFactory : b.splashFactory,
      selectedRowColor: Color.lerp(a.selectedRowColor, b.selectedRowColor, t),
      unselectedWidgetColor:
          Color.lerp(a.unselectedWidgetColor, b.unselectedWidgetColor, t),
      disabledColor: Color.lerp(a.disabledColor, b.disabledColor, t),
      buttonTheme: t < 0.5 ? a.buttonTheme : b.buttonTheme,
      toggleButtonsTheme: ToggleButtonsThemeData.lerp(
          a.toggleButtonsTheme, b.toggleButtonsTheme, t),
      buttonColor: Color.lerp(a.buttonColor, b.buttonColor, t),
      secondaryHeaderColor:
          Color.lerp(a.secondaryHeaderColor, b.secondaryHeaderColor, t),
      textSelectionColor:
          Color.lerp(a.textSelectionColor, b.textSelectionColor, t),
      cursorColor: Color.lerp(a.cursorColor, b.cursorColor, t),
      textSelectionHandleColor:
          Color.lerp(a.textSelectionHandleColor, b.textSelectionHandleColor, t),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      dialogBackgroundColor:
          Color.lerp(a.dialogBackgroundColor, b.dialogBackgroundColor, t),
      indicatorColor: Color.lerp(a.indicatorColor, b.indicatorColor, t),
      hintColor: Color.lerp(a.hintColor, b.hintColor, t),
      errorColor: Color.lerp(a.errorColor, b.errorColor, t),
      toggleableActiveColor:
          Color.lerp(a.toggleableActiveColor, b.toggleableActiveColor, t),
      textTheme: TextTheme.lerp(a.textTheme, b.textTheme, t),
      primaryTextTheme:
          TextTheme.lerp(a.primaryTextTheme, b.primaryTextTheme, t),
      accentTextTheme: TextTheme.lerp(a.accentTextTheme, b.accentTextTheme, t),
      inputDecorationTheme:
          t < 0.5 ? a.inputDecorationTheme : b.inputDecorationTheme,
      iconTheme: IconThemeData.lerp(a.iconTheme, b.iconTheme, t),
      primaryIconTheme:
          IconThemeData.lerp(a.primaryIconTheme, b.primaryIconTheme, t),
      accentIconTheme:
          IconThemeData.lerp(a.accentIconTheme, b.accentIconTheme, t),
      sliderTheme: SliderThemeData.lerp(a.sliderTheme, b.sliderTheme, t),
      tabBarTheme: TabBarTheme.lerp(a.tabBarTheme, b.tabBarTheme, t),
      tooltipTheme: TooltipThemeData.lerp(a.tooltipTheme, b.tooltipTheme, t),
      cardTheme: CardTheme.lerp(a.cardTheme, b.cardTheme, t),
      chipTheme: ChipThemeData.lerp(a.chipTheme, b.chipTheme, t),
      platform: t < 0.5 ? a.platform : b.platform,
      materialTapTargetSize:
          t < 0.5 ? a.materialTapTargetSize : b.materialTapTargetSize,
      applyElevationOverlayColor:
          t < 0.5 ? a.applyElevationOverlayColor : b.applyElevationOverlayColor,
      pageTransitionsTheme:
          t < 0.5 ? a.pageTransitionsTheme : b.pageTransitionsTheme,
      appBarTheme: AppBarTheme.lerp(a.appBarTheme, b.appBarTheme, t),
      bottomAppBarTheme:
          BottomAppBarTheme.lerp(a.bottomAppBarTheme, b.bottomAppBarTheme, t),
      colorScheme: ColorScheme.lerp(a.colorScheme, b.colorScheme, t),
      dialogTheme: DialogTheme.lerp(a.dialogTheme, b.dialogTheme, t),
      floatingActionButtonTheme: FloatingActionButtonThemeData.lerp(
          a.floatingActionButtonTheme, b.floatingActionButtonTheme, t),
      typography: Typography.lerp(a.typography, b.typography, t),
      cupertinoOverrideTheme:
          t < 0.5 ? a.cupertinoOverrideTheme : b.cupertinoOverrideTheme,
      snackBarTheme:
          SnackBarThemeData.lerp(a.snackBarTheme, b.snackBarTheme, t),
      bottomSheetTheme:
          BottomSheetThemeData.lerp(a.bottomSheetTheme, b.bottomSheetTheme, t),
      popupMenuTheme:
          PopupMenuThemeData.lerp(a.popupMenuTheme, b.popupMenuTheme, t),
      bannerTheme:
          MaterialBannerThemeData.lerp(a.bannerTheme, b.bannerTheme, t),
      dividerTheme: DividerThemeData.lerp(a.dividerTheme, b.dividerTheme, t),
    );
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    final ThemeData otherData = other;
    // Warning: make sure these properties are in the exact same order as in
    // hashValues() and in the raw constructor and in the order of fields in
    // the class and in the lerp() method.
    return (otherData.brightness == brightness) &&
        (otherData.primaryColor == primaryColor) &&
        (otherData.primaryColorBrightness == primaryColorBrightness) &&
        (otherData.primaryColorLight == primaryColorLight) &&
        (otherData.primaryColorDark == primaryColorDark) &&
        (otherData.accentColor == accentColor) &&
        (otherData.accentColorBrightness == accentColorBrightness) &&
        (otherData.canvasColor == canvasColor) &&
        (otherData.scaffoldBackgroundColor == scaffoldBackgroundColor) &&
        (otherData.bottomAppBarColor == bottomAppBarColor) &&
        (otherData.cardColor == cardColor) &&
        (otherData.dividerColor == dividerColor) &&
        (otherData.highlightColor == highlightColor) &&
        (otherData.splashColor == splashColor) &&
        (otherData.splashFactory == splashFactory) &&
        (otherData.selectedRowColor == selectedRowColor) &&
        (otherData.unselectedWidgetColor == unselectedWidgetColor) &&
        (otherData.disabledColor == disabledColor) &&
        (otherData.buttonTheme == buttonTheme) &&
        (otherData.buttonColor == buttonColor) &&
        (otherData.toggleButtonsTheme == toggleButtonsTheme) &&
        (otherData.secondaryHeaderColor == secondaryHeaderColor) &&
        (otherData.textSelectionColor == textSelectionColor) &&
        (otherData.cursorColor == cursorColor) &&
        (otherData.textSelectionHandleColor == textSelectionHandleColor) &&
        (otherData.backgroundColor == backgroundColor) &&
        (otherData.dialogBackgroundColor == dialogBackgroundColor) &&
        (otherData.indicatorColor == indicatorColor) &&
        (otherData.hintColor == hintColor) &&
        (otherData.errorColor == errorColor) &&
        (otherData.toggleableActiveColor == toggleableActiveColor) &&
        (otherData.textTheme == textTheme) &&
        (otherData.primaryTextTheme == primaryTextTheme) &&
        (otherData.accentTextTheme == accentTextTheme) &&
        (otherData.inputDecorationTheme == inputDecorationTheme) &&
        (otherData.iconTheme == iconTheme) &&
        (otherData.primaryIconTheme == primaryIconTheme) &&
        (otherData.accentIconTheme == accentIconTheme) &&
        (otherData.sliderTheme == sliderTheme) &&
        (otherData.tabBarTheme == tabBarTheme) &&
        (otherData.tooltipTheme == tooltipTheme) &&
        (otherData.cardTheme == cardTheme) &&
        (otherData.chipTheme == chipTheme) &&
        (otherData.platform == platform) &&
        (otherData.materialTapTargetSize == materialTapTargetSize) &&
        (otherData.applyElevationOverlayColor == applyElevationOverlayColor) &&
        (otherData.pageTransitionsTheme == pageTransitionsTheme) &&
        (otherData.appBarTheme == appBarTheme) &&
        (otherData.bottomAppBarTheme == bottomAppBarTheme) &&
        (otherData.colorScheme == colorScheme) &&
        (otherData.dialogTheme == dialogTheme) &&
        (otherData.floatingActionButtonTheme == floatingActionButtonTheme) &&
        (otherData.typography == typography) &&
        (otherData.cupertinoOverrideTheme == cupertinoOverrideTheme) &&
        (otherData.snackBarTheme == snackBarTheme) &&
        (otherData.bottomSheetTheme == bottomSheetTheme) &&
        (otherData.popupMenuTheme == popupMenuTheme) &&
        (otherData.bannerTheme == bannerTheme) &&
        (otherData.dividerTheme == dividerTheme);
  }

  @override
  int get hashCode {
    // Warning: For the sanity of the reader, please make sure these properties
    // are in the exact same order as in operator == and in the raw constructor
    // and in the order of fields in the class and in the lerp() method.
    final List<Object> values = <Object>[
      brightness,
      primaryColor,
      primaryColorBrightness,
      primaryColorLight,
      primaryColorDark,
      accentColor,
      accentColorBrightness,
      canvasColor,
      scaffoldBackgroundColor,
      bottomAppBarColor,
      cardColor,
      dividerColor,
      focusColor,
      hoverColor,
      highlightColor,
      splashColor,
      splashFactory,
      selectedRowColor,
      unselectedWidgetColor,
      disabledColor,
      buttonTheme,
      buttonColor,
      toggleButtonsTheme,
      toggleableActiveColor,
      secondaryHeaderColor,
      textSelectionColor,
      cursorColor,
      textSelectionHandleColor,
      backgroundColor,
      dialogBackgroundColor,
      indicatorColor,
      hintColor,
      errorColor,
      textTheme,
      primaryTextTheme,
      accentTextTheme,
      inputDecorationTheme,
      iconTheme,
      primaryIconTheme,
      accentIconTheme,
      sliderTheme,
      tabBarTheme,
      tooltipTheme,
      cardTheme,
      chipTheme,
      platform,
      materialTapTargetSize,
      applyElevationOverlayColor,
      pageTransitionsTheme,
      appBarTheme,
      bottomAppBarTheme,
      colorScheme,
      dialogTheme,
      floatingActionButtonTheme,
      typography,
      cupertinoOverrideTheme,
      snackBarTheme,
      bottomSheetTheme,
      popupMenuTheme,
      bannerTheme,
      dividerTheme,
    ];
    return hashList(values);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    final ThemeData defaultData = ThemeData.fallback();
    properties.add(EnumProperty<TargetPlatform>('platform', platform,
        defaultValue: defaultTargetPlatform));
    properties.add(EnumProperty<Brightness>('brightness', brightness,
        defaultValue: defaultData.brightness));
    properties.add(ColorProperty('primaryColor', primaryColor,
        defaultValue: defaultData.primaryColor));
    properties.add(EnumProperty<Brightness>(
        'primaryColorBrightness', primaryColorBrightness,
        defaultValue: defaultData.primaryColorBrightness));
    properties.add(ColorProperty('accentColor', accentColor,
        defaultValue: defaultData.accentColor));
    properties.add(EnumProperty<Brightness>(
        'accentColorBrightness', accentColorBrightness,
        defaultValue: defaultData.accentColorBrightness));
    properties.add(ColorProperty('canvasColor', canvasColor,
        defaultValue: defaultData.canvasColor));
    properties.add(ColorProperty(
        'scaffoldBackgroundColor', scaffoldBackgroundColor,
        defaultValue: defaultData.scaffoldBackgroundColor));
    properties.add(ColorProperty('bottomAppBarColor', bottomAppBarColor,
        defaultValue: defaultData.bottomAppBarColor));
    properties.add(ColorProperty('cardColor', cardColor,
        defaultValue: defaultData.cardColor));
    properties.add(ColorProperty('dividerColor', dividerColor,
        defaultValue: defaultData.dividerColor));
    properties.add(ColorProperty('focusColor', focusColor,
        defaultValue: defaultData.focusColor));
    properties.add(ColorProperty('hoverColor', hoverColor,
        defaultValue: defaultData.hoverColor));
    properties.add(ColorProperty('highlightColor', highlightColor,
        defaultValue: defaultData.highlightColor));
    properties.add(ColorProperty('splashColor', splashColor,
        defaultValue: defaultData.splashColor));
    properties.add(ColorProperty('selectedRowColor', selectedRowColor,
        defaultValue: defaultData.selectedRowColor));
    properties.add(ColorProperty('unselectedWidgetColor', unselectedWidgetColor,
        defaultValue: defaultData.unselectedWidgetColor));
    properties.add(ColorProperty('disabledColor', disabledColor,
        defaultValue: defaultData.disabledColor));
    properties.add(ColorProperty('buttonColor', buttonColor,
        defaultValue: defaultData.buttonColor));
    properties.add(ColorProperty('secondaryHeaderColor', secondaryHeaderColor,
        defaultValue: defaultData.secondaryHeaderColor));
    properties.add(ColorProperty('textSelectionColor', textSelectionColor,
        defaultValue: defaultData.textSelectionColor));
    properties.add(ColorProperty('cursorColor', cursorColor,
        defaultValue: defaultData.cursorColor));
    properties.add(ColorProperty(
        'textSelectionHandleColor', textSelectionHandleColor,
        defaultValue: defaultData.textSelectionHandleColor));
    properties.add(ColorProperty('backgroundColor', backgroundColor,
        defaultValue: defaultData.backgroundColor));
    properties.add(ColorProperty('dialogBackgroundColor', dialogBackgroundColor,
        defaultValue: defaultData.dialogBackgroundColor));
    properties.add(ColorProperty('indicatorColor', indicatorColor,
        defaultValue: defaultData.indicatorColor));
    properties.add(ColorProperty('hintColor', hintColor,
        defaultValue: defaultData.hintColor));
    properties.add(ColorProperty('errorColor', errorColor,
        defaultValue: defaultData.errorColor));
    properties.add(ColorProperty('toggleableActiveColor', toggleableActiveColor,
        defaultValue: defaultData.toggleableActiveColor));
    properties
        .add(DiagnosticsProperty<ButtonThemeData>('buttonTheme', buttonTheme));
    properties.add(DiagnosticsProperty<ToggleButtonsThemeData>(
        'toggleButtonsTheme', toggleButtonsTheme));
    properties.add(DiagnosticsProperty<TextTheme>('textTheme', textTheme));
    properties.add(
        DiagnosticsProperty<TextTheme>('primaryTextTheme', primaryTextTheme));
    properties.add(
        DiagnosticsProperty<TextTheme>('accentTextTheme', accentTextTheme));
    properties.add(DiagnosticsProperty<InputDecorationTheme>(
        'inputDecorationTheme', inputDecorationTheme));
    properties.add(DiagnosticsProperty<IconThemeData>('iconTheme', iconTheme));
    properties.add(DiagnosticsProperty<IconThemeData>(
        'primaryIconTheme', primaryIconTheme));
    properties.add(
        DiagnosticsProperty<IconThemeData>('accentIconTheme', accentIconTheme));
    properties
        .add(DiagnosticsProperty<SliderThemeData>('sliderTheme', sliderTheme));
    properties
        .add(DiagnosticsProperty<TabBarTheme>('tabBarTheme', tabBarTheme));
    properties.add(
        DiagnosticsProperty<TooltipThemeData>('tooltipTheme', tooltipTheme));
    properties.add(DiagnosticsProperty<CardTheme>('cardTheme', cardTheme));
    properties.add(DiagnosticsProperty<ChipThemeData>('chipTheme', chipTheme));
    properties.add(DiagnosticsProperty<MaterialTapTargetSize>(
        'materialTapTargetSize', materialTapTargetSize));
    properties.add(DiagnosticsProperty<bool>(
        'applyElevationOverlayColor', applyElevationOverlayColor));
    properties.add(DiagnosticsProperty<PageTransitionsTheme>(
        'pageTransitionsTheme', pageTransitionsTheme));
    properties.add(DiagnosticsProperty<AppBarTheme>('appBarTheme', appBarTheme,
        defaultValue: defaultData.appBarTheme));
    properties.add(DiagnosticsProperty<BottomAppBarTheme>(
        'bottomAppBarTheme', bottomAppBarTheme,
        defaultValue: defaultData.bottomAppBarTheme));
    properties.add(DiagnosticsProperty<ColorScheme>('colorScheme', colorScheme,
        defaultValue: defaultData.colorScheme));
    properties.add(DiagnosticsProperty<DialogTheme>('dialogTheme', dialogTheme,
        defaultValue: defaultData.dialogTheme));
    properties.add(DiagnosticsProperty<FloatingActionButtonThemeData>(
        'floatingActionButtonThemeData', floatingActionButtonTheme,
        defaultValue: defaultData.floatingActionButtonTheme));
    properties.add(DiagnosticsProperty<Typography>('typography', typography,
        defaultValue: defaultData.typography));
    properties.add(DiagnosticsProperty<CupertinoThemeData>(
        'cupertinoOverrideTheme', cupertinoOverrideTheme,
        defaultValue: defaultData.cupertinoOverrideTheme));
    properties.add(DiagnosticsProperty<SnackBarThemeData>(
        'snackBarTheme', snackBarTheme,
        defaultValue: defaultData.snackBarTheme));
    properties.add(DiagnosticsProperty<BottomSheetThemeData>(
        'bottomSheetTheme', bottomSheetTheme,
        defaultValue: defaultData.bottomSheetTheme));
    properties.add(DiagnosticsProperty<PopupMenuThemeData>(
        'popupMenuTheme', popupMenuTheme,
        defaultValue: defaultData.popupMenuTheme));
    properties.add(DiagnosticsProperty<MaterialBannerThemeData>(
        'bannerTheme', bannerTheme,
        defaultValue: defaultData.bannerTheme));
    properties.add(DiagnosticsProperty<DividerThemeData>(
        'dividerTheme', dividerTheme,
        defaultValue: defaultData.dividerTheme));
  }
}

class MaterialButton extends StatelessWidget {
  /// Creates a material button.
  ///
  /// Rather than creating a material button directly, consider using
  /// [FlatButton] or [RaisedButton]. To create a custom Material button
  /// consider using [RawMaterialButton].
  ///
  /// The [autofocus] and [clipBehavior] arguments must not be null.
  /// Additionally,  [elevation], [hoverElevation], [focusElevation],
  /// [highlightElevation], and [disabledElevation] must be non-negative, if
  /// specified.
  const MaterialButton({
    Key key,
    @required this.onPressed,
    this.onHighlightChanged,
    this.textTheme,
    this.textColor,
    this.disabledTextColor,
    this.color,
    this.disabledColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.colorBrightness,
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.highlightElevation,
    this.disabledElevation,
    this.padding,
    this.shape,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.materialTapTargetSize,
    this.animationDuration,
    this.minWidth,
    this.height,
    this.child,
  })  : assert(autofocus != null),
        assert(elevation == null || elevation >= 0.0),
        assert(focusElevation == null || focusElevation >= 0.0),
        assert(hoverElevation == null || hoverElevation >= 0.0),
        assert(highlightElevation == null || highlightElevation >= 0.0),
        assert(disabledElevation == null || disabledElevation >= 0.0),
        super(key: key);

  /// The callback that is called when the button is tapped or otherwise activated.
  ///
  /// If this is set to null, the button will be disabled.
  final VoidCallback onPressed;

  /// Called by the underlying [InkWell] widget's [InkWell.onHighlightChanged]
  /// callback.
  ///
  /// If [onPressed] changes from null to non-null while a gesture is ongoing,
  /// this can fire during the build phase (in which case calling
  /// [State.setState] is not allowed).
  final ValueChanged<bool> onHighlightChanged;

  /// Defines the button's base colors, and the defaults for the button's minimum
  /// size, internal padding, and shape.
  ///
  /// Defaults to `ButtonTheme.of(context).textTheme`.
  final ButtonTextTheme textTheme;

  /// The color to use for this button's text.
  ///
  /// The button's [Material.textStyle] will be the current theme's button
  /// text style, [ThemeData.textTheme.button], configured with this color.
  ///
  /// The default text color depends on the button theme's text theme,
  /// [ButtonThemeData.textTheme].
  ///
  /// If [textColor] is a [MaterialStateProperty<Color>], [disabledTextColor]
  /// will be ignored.
  ///
  /// See also:
  ///
  ///  * [disabledTextColor], the text color to use when the button has been
  ///    disabled.
  final Color textColor;

  /// The color to use for this button's text when the button is disabled.
  ///
  /// The button's [Material.textStyle] will be the current theme's button
  /// text style, [ThemeData.textTheme.button], configured with this color.
  ///
  /// The default value is the theme's disabled color,
  /// [ThemeData.disabledColor].
  ///
  /// If [textColor] is a [MaterialStateProperty<Color>], [disabledTextColor]
  /// will be ignored.
  ///
  /// See also:
  ///
  ///  * [textColor] - The color to use for this button's text when the button is [enabled].
  final Color disabledTextColor;

  /// The button's fill color, displayed by its [Material], while it
  /// is in its default (unpressed, [enabled]) state.
  ///
  /// The default fill color is the theme's button color, [ThemeData.buttonColor].
  ///
  /// See also:
  ///
  ///  * [disabledColor] - the fill color of the button when the button is disabled.
  final Color color;

  /// The fill color of the button when the button is disabled.
  ///
  /// The default value of this color is the theme's disabled color,
  /// [ThemeData.disabledColor].
  ///
  /// See also:
  ///
  ///  * [color] - the fill color of the button when the button is [enabled].
  final Color disabledColor;

  /// The splash color of the button's [InkWell].
  ///
  /// The ink splash indicates that the button has been touched. It
  /// appears on top of the button's child and spreads in an expanding
  /// circle beginning where the touch occurred.
  ///
  /// The default splash color is the current theme's splash color,
  /// [ThemeData.splashColor].
  ///
  /// The appearance of the splash can be configured with the theme's splash
  /// factory, [ThemeData.splashFactory].
  final Color splashColor;

  /// The fill color of the button's [Material] when it has the input focus.
  ///
  /// The button changed focus color when the button has the input focus. It
  /// appears behind the button's child.
  final Color focusColor;

  /// The fill color of the button's [Material] when a pointer is hovering over
  /// it.
  ///
  /// The button changes fill color when a pointer is hovering over the button.
  /// It appears behind the button's child.
  final Color hoverColor;

  /// The highlight color of the button's [InkWell].
  ///
  /// The highlight indicates that the button is actively being pressed. It
  /// appears on top of the button's child and quickly spreads to fill
  /// the button, and then fades out.
  ///
  /// If [textTheme] is [ButtonTextTheme.primary], the default highlight color is
  /// transparent (in other words the highlight doesn't appear). Otherwise it's
  /// the current theme's highlight color, [ThemeData.highlightColor].
  final Color highlightColor;

  /// The z-coordinate at which to place this button relative to its parent.
  ///
  /// This controls the size of the shadow below the raised button.
  ///
  /// Defaults to 2, the appropriate elevation for raised buttons. The value
  /// is always non-negative.
  ///
  /// See also:
  ///
  ///  * [FlatButton], a button with no elevation or fill color.
  ///  * [focusElevation], the elevation when the button is focused.
  ///  * [hoverElevation], the elevation when a pointer is hovering over the
  ///    button.
  ///  * [disabledElevation], the elevation when the button is disabled.
  ///  * [highlightElevation], the elevation when the button is pressed.
  final double elevation;

  /// The elevation for the button's [Material] when the button
  /// is [enabled] and a pointer is hovering over it.
  ///
  /// Defaults to 4.0. The value is always non-negative.
  ///
  /// See also:
  ///
  ///  * [elevation], the default elevation.
  ///  * [focusElevation], the elevation when the button is focused.
  ///  * [disabledElevation], the elevation when the button is disabled.
  ///  * [highlightElevation], the elevation when the button is pressed.
  final double hoverElevation;

  /// The elevation for the button's [Material] when the button
  /// is [enabled] and has the input focus.
  ///
  /// Defaults to 4.0. The value is always non-negative.
  ///
  /// See also:
  ///
  ///  * [elevation], the default elevation.
  ///  * [hoverElevation], the elevation when a pointer is hovering over the
  ///    button.
  ///  * [disabledElevation], the elevation when the button is disabled.
  ///  * [highlightElevation], the elevation when the button is pressed.
  final double focusElevation;

  /// The elevation for the button's [Material] relative to its parent when the
  /// button is [enabled] and pressed.
  ///
  /// This controls the size of the shadow below the button. When a tap
  /// down gesture occurs within the button, its [InkWell] displays a
  /// [highlightColor] "highlight".
  ///
  /// Defaults to 8.0. The value is always non-negative.
  ///
  /// See also:
  ///
  ///  * [elevation], the default elevation.
  ///  * [focusElevation], the elevation when the button is focused.
  ///  * [hoverElevation], the elevation when a pointer is hovering over the
  ///    button.
  ///  * [disabledElevation], the elevation when the button is disabled.
  final double highlightElevation;

  /// The elevation for the button's [Material] relative to its parent when the
  /// button is not [enabled].
  ///
  /// Defaults to 0.0. The value is always non-negative.
  ///
  /// See also:
  ///
  ///  * [elevation], the default elevation.
  ///  * [highlightElevation], the elevation when the button is pressed.
  final double disabledElevation;

  /// The theme brightness to use for this button.
  ///
  /// Defaults to the theme's brightness in [ThemeData.brightness]. Setting
  /// this value determines the button text's colors based on
  /// [ButtonThemeData.getTextColor].
  ///
  /// See also:
  ///
  ///  * [ButtonTextTheme], uses [Brightness] to determine text color.
  final Brightness colorBrightness;

  /// The button's label.
  ///
  /// Often a [Text] widget in all caps.
  final Widget child;

  /// Whether the button is enabled or disabled.
  ///
  /// Buttons are disabled by default. To enable a button, set its [onPressed]
  /// property to a non-null value.
  bool get enabled => onPressed != null;

  /// The internal padding for the button's [child].
  ///
  /// Defaults to the value from the current [ButtonTheme],
  /// [ButtonThemeData.padding].
  final EdgeInsetsGeometry padding;

  /// The shape of the button's [Material].
  ///
  /// The button's highlight and splash are clipped to this shape. If the
  /// button has an elevation, then its drop shadow is defined by this
  /// shape as well.
  ///
  /// Defaults to the value from the current [ButtonTheme],
  /// [ButtonThemeData.shape].
  final ShapeBorder shape;

  /// {@macro flutter.widgets.Clip}
  final Clip clipBehavior;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// Defines the duration of animated changes for [shape] and [elevation].
  ///
  /// The default value is [kThemeChangeDuration].
  final Duration animationDuration;

  /// Configures the minimum size of the tap target.
  ///
  /// Defaults to [ThemeData.materialTapTargetSize].
  ///
  /// See also:
  ///
  ///  * [MaterialTapTargetSize], for a description of how this affects tap targets.
  final MaterialTapTargetSize materialTapTargetSize;

  /// The smallest horizontal extent that the button will occupy.
  ///
  /// Defaults to the value from the current [ButtonTheme].
  final double minWidth;

  /// The vertical extent of the button.
  ///
  /// Defaults to the value from the current [ButtonTheme].
  final double height;

  @override
  Widget build(BuildContext context) {
    print('xie MaterialButton: build');
    final ThemeData theme = Theme.of(context);
    final ButtonThemeData buttonTheme = ButtonTheme.of(context);

    return RawMaterialButton(
      key: key,
      onPressed: onPressed,
      onHighlightChanged: onHighlightChanged,
      fillColor: buttonTheme.getFillColor(this),
      textStyle: theme.textTheme.button
          .copyWith(color: buttonTheme.getTextColor(this)),
      focusColor:
          focusColor ?? buttonTheme.getFocusColor(this) ?? theme.focusColor,
      hoverColor:
          hoverColor ?? buttonTheme.getHoverColor(this) ?? theme.hoverColor,
      highlightColor: highlightColor ?? theme.highlightColor,
      splashColor: splashColor ?? theme.splashColor,
      elevation: buttonTheme.getElevation(this),
      focusElevation: buttonTheme.getFocusElevation(this),
      hoverElevation: buttonTheme.getHoverElevation(this),
      highlightElevation: buttonTheme.getHighlightElevation(this),
      padding: buttonTheme.getPadding(this),
      constraints: buttonTheme.getConstraints(this).copyWith(
            minWidth: minWidth,
            minHeight: height,
          ),
      shape: buttonTheme.getShape(this),
      clipBehavior: clipBehavior ?? Clip.none,
      focusNode: focusNode,
      animationDuration: buttonTheme.getAnimationDuration(this),
      child: child,
      materialTapTargetSize:
          materialTapTargetSize ?? theme.materialTapTargetSize,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<VoidCallback>('onPressed', onPressed,
        ifNull: 'disabled'));
    properties.add(DiagnosticsProperty<ButtonTextTheme>('textTheme', textTheme,
        defaultValue: null));
    properties.add(ColorProperty('textColor', textColor, defaultValue: null));
    properties.add(ColorProperty('disabledTextColor', disabledTextColor,
        defaultValue: null));
    properties.add(ColorProperty('color', color, defaultValue: null));
    properties
        .add(ColorProperty('disabledColor', disabledColor, defaultValue: null));
    properties.add(ColorProperty('focusColor', focusColor, defaultValue: null));
    properties.add(ColorProperty('hoverColor', hoverColor, defaultValue: null));
    properties.add(
        ColorProperty('highlightColor', highlightColor, defaultValue: null));
    properties
        .add(ColorProperty('splashColor', splashColor, defaultValue: null));
    properties.add(DiagnosticsProperty<Brightness>(
        'colorBrightness', colorBrightness,
        defaultValue: null));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('padding', padding,
        defaultValue: null));
    properties.add(
        DiagnosticsProperty<ShapeBorder>('shape', shape, defaultValue: null));
    properties.add(DiagnosticsProperty<FocusNode>('focusNode', focusNode,
        defaultValue: null));
    properties.add(DiagnosticsProperty<MaterialTapTargetSize>(
        'materialTapTargetSize', materialTapTargetSize,
        defaultValue: null));
  }
}

class Material extends StatefulWidget {
  /// Creates a piece of material.
  ///
  /// The [type], [elevation], [shadowColor], [borderOnForeground] and
  /// [animationDuration] arguments must not be null. Additionally, [elevation]
  /// must be non-negative.
  ///
  /// If a [shape] is specified, then the [borderRadius] property must be
  /// null and the [type] property must not be [MaterialType.circle]. If the
  /// [borderRadius] is specified, then the [type] property must not be
  /// [MaterialType.circle]. In both cases, these restrictions are intended to
  /// catch likely errors.
  const Material({
    Key key,
    this.type = MaterialType.canvas,
    this.elevation = 0.0,
    this.color,
    this.shadowColor = const Color(0xFF000000),
    this.textStyle,
    this.borderRadius,
    this.shape,
    this.borderOnForeground = true,
    this.clipBehavior = Clip.none,
    this.animationDuration = kThemeChangeDuration,
    this.child,
  })  : assert(type != null),
        assert(elevation != null && elevation >= 0.0),
        assert(shadowColor != null),
        assert(!(shape != null && borderRadius != null)),
        assert(animationDuration != null),
        assert(!(identical(type, MaterialType.circle) &&
            (borderRadius != null || shape != null))),
        assert(clipBehavior != null),
        assert(borderOnForeground != null),
        super(key: key);

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  /// The kind of material to show (e.g., card or canvas). This
  /// affects the shape of the widget, the roundness of its corners if
  /// the shape is rectangular, and the default color.
  final MaterialType type;

  /// {@template flutter.material.material.elevation}
  /// The z-coordinate at which to place this material relative to its parent.
  ///
  /// This controls the size of the shadow below the material and the opacity
  /// of the elevation overlay color if it is applied.
  ///
  /// If this is non-zero, the contents of the material are clipped, because the
  /// widget conceptually defines an independent printed piece of material.
  ///
  /// Defaults to 0. Changing this value will cause the shadow and the elevation
  /// overlay to animate over [animationDuration].
  ///
  /// The value is non-negative.
  ///
  /// See also:
  ///
  ///   * [ThemeData.applyElevationOverlayColor] which controls the whether
  ///     an overlay color will be applied to indicate elevation.
  ///   * [color] which may have an elevation overlay applied.
  ///
  /// {@endtemplate}
  final double elevation;

  /// The color to paint the material.
  ///
  /// Must be opaque. To create a transparent piece of material, use
  /// [MaterialType.transparency].
  ///
  /// To support dark themes, if the surrounding
  /// [ThemeData.applyElevationOverlayColor] is [true] and
  /// this color is [ThemeData.colorScheme.surface] then a semi-transparent
  /// white will be composited on top this color to indicate the elevation.
  ///
  /// By default, the color is derived from the [type] of material.
  final Color color;

  /// The color to paint the shadow below the material.
  ///
  /// Defaults to fully opaque black.
  final Color shadowColor;

  /// The typographical style to use for text within this material.
  final TextStyle textStyle;

  /// Defines the material's shape as well its shadow.
  ///
  /// If shape is non null, the [borderRadius] is ignored and the material's
  /// clip boundary and shadow are defined by the shape.
  ///
  /// A shadow is only displayed if the [elevation] is greater than
  /// zero.
  final ShapeBorder shape;

  /// Whether to paint the [shape] border in front of the [child].
  ///
  /// The default value is true.
  /// If false, the border will be painted behind the [child].
  final bool borderOnForeground;

  /// {@template flutter.widgets.Clip}
  /// The content will be clipped (or not) according to this option.
  ///
  /// See the enum [Clip] for details of all possible options and their common
  /// use cases.
  /// {@endtemplate}
  final Clip clipBehavior;

  /// Defines the duration of animated changes for [shape], [elevation],
  /// [shadowColor] and the elevation overlay if it is applied.
  ///
  /// The default value is [kThemeChangeDuration].
  final Duration animationDuration;

  /// If non-null, the corners of this box are rounded by this
  /// [BorderRadiusGeometry] value.
  ///
  /// Otherwise, the corners specified for the current [type] of material are
  /// used.
  ///
  /// If [shape] is non null then the border radius is ignored.
  ///
  /// Must be null if [type] is [MaterialType.circle].
  final BorderRadiusGeometry borderRadius;

  /// The ink controller from the closest instance of this class that
  /// encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// MaterialInkController inkController = Material.of(context);
  /// ```
  static MaterialInkController of(BuildContext context) {
    final _RenderInkFeatures result = context
        .ancestorRenderObjectOfType(const TypeMatcher<_RenderInkFeatures>());
    return result;
  }

  @override
  _MaterialState createState() => _MaterialState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<MaterialType>('type', type));
    properties.add(DoubleProperty('elevation', elevation, defaultValue: 0.0));
    properties.add(ColorProperty('color', color, defaultValue: null));
    properties.add(ColorProperty('shadowColor', shadowColor,
        defaultValue: const Color(0xFF000000)));
    textStyle?.debugFillProperties(properties, prefix: 'textStyle.');
    properties.add(
        DiagnosticsProperty<ShapeBorder>('shape', shape, defaultValue: null));
    properties.add(DiagnosticsProperty<bool>(
        'borderOnForeground', borderOnForeground,
        defaultValue: true));
    properties.add(DiagnosticsProperty<BorderRadiusGeometry>(
        'borderRadius', borderRadius,
        defaultValue: null));
  }

  /// The default radius of an ink splash in logical pixels.
  static const double defaultSplashRadius = 35.0;
}

class RenderProxyBox extends RenderBox
    with RenderObjectWithChildMixin<RenderBox>, RenderProxyBoxMixin<RenderBox> {
  /// Creates a proxy render box.
  ///
  /// Proxy render boxes are rarely created directly because they simply proxy
  /// the render box protocol to [child]. Instead, consider using one of the
  /// subclasses.
  RenderProxyBox([RenderBox child]) {
    this.child = child;
  }
}

abstract class MaterialInkController {
  /// The color of the material.
  Color get color;

  /// The ticker provider used by the controller.
  ///
  /// Ink features that are added to this controller with [addInkFeature] should
  /// use this vsync to drive their animations.
  TickerProvider get vsync;

  /// Add an [InkFeature], such as an [InkSplash] or an [InkHighlight].
  ///
  /// The ink feature will paint as part of this controller.
  void addInkFeature(InkFeature feature);

  /// Notifies the controller that one of its ink features needs to repaint.
  void markNeedsPaint();
}

class _RenderInkFeatures extends RenderProxyBox
    implements MaterialInkController {
  _RenderInkFeatures({
    RenderBox child,
    @required this.vsync,
    this.color,
  })  : assert(vsync != null),
        super(child);

  // This class should exist in a 1:1 relationship with a MaterialState object,
  // since there's no current support for dynamically changing the ticker
  // provider.
  @override
  final TickerProvider vsync;

  // This is here to satisfy the MaterialInkController contract.
  // The actual painting of this color is done by a Container in the
  // MaterialState build method.
  @override
  Color color;

  List<InkFeature> _inkFeatures;

  @override
  void addInkFeature(InkFeature feature) {
//    assert(!feature._debugDisposed);
//    assert(feature._controller == this);
    _inkFeatures ??= <InkFeature>[];
    assert(!_inkFeatures.contains(feature));
    _inkFeatures.add(feature);
    markNeedsPaint();
  }

  void _removeFeature(InkFeature feature) {
    assert(_inkFeatures != null);
    _inkFeatures.remove(feature);
    markNeedsPaint();
  }

  void _didChangeLayout() {
    if (_inkFeatures != null && _inkFeatures.isNotEmpty) markNeedsPaint();
  }

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (_inkFeatures != null && _inkFeatures.isNotEmpty) {
      final Canvas canvas = context.canvas;
      canvas.save();
      canvas.translate(offset.dx, offset.dy);
      canvas.clipRect(Offset.zero & size);
      for (InkFeature inkFeature in _inkFeatures) inkFeature._paint(canvas);
      canvas.restore();
    }
    super.paint(context, offset);
  }
}

abstract class InkFeature {
  /// Initializes fields for subclasses.
  InkFeature({
    @required MaterialInkController controller,
    @required this.referenceBox,
    this.onRemoved,
  })  : assert(controller != null),
        assert(referenceBox != null),
        _controller = controller;

  /// The [MaterialInkController] associated with this [InkFeature].
  ///
  /// Typically used by subclasses to call
  /// [MaterialInkController.markNeedsPaint] when they need to repaint.
  MaterialInkController get controller => _controller;
  final _RenderInkFeatures _controller;

  /// The render box whose visual position defines the frame of reference for this ink feature.
  final RenderBox referenceBox;

  /// Called when the ink feature is no longer visible on the material.
  final VoidCallback onRemoved;

  bool _debugDisposed = false;

  /// Free up the resources associated with this ink feature.
  @mustCallSuper
  void dispose() {
    assert(!_debugDisposed);
    assert(() {
      _debugDisposed = true;
      return true;
    }());
    _controller._removeFeature(this);
    if (onRemoved != null) onRemoved();
  }

  void _paint(Canvas canvas) {
    assert(referenceBox.attached);
    assert(!_debugDisposed);
    // find the chain of renderers from us to the feature's referenceBox
    final List<RenderObject> descendants = <RenderObject>[referenceBox];
    RenderObject node = referenceBox;
    while (node != _controller) {
      node = node.parent;
      assert(node != null);
      descendants.add(node);
    }
    // determine the transform that gets our coordinate system to be like theirs
    final Matrix4 transform = Matrix4.identity();
    assert(descendants.length >= 2);
    for (int index = descendants.length - 1; index > 0; index -= 1)
      descendants[index].applyPaintTransform(descendants[index - 1], transform);
    paintFeature(canvas, transform);
  }

  /// Override this method to paint the ink feature.
  ///
  /// The transform argument gives the coordinate conversion from the coordinate
  /// system of the canvas to the coordinate system of the [referenceBox].
  @protected
  void paintFeature(Canvas canvas, Matrix4 transform);

  @override
  String toString() => describeIdentity(this);
}

class _InkFeatures extends SingleChildRenderObjectWidget {
  const _InkFeatures({
    Key key,
    this.color,
    @required this.vsync,
    Widget child,
  }) : super(key: key, child: child);

  // This widget must be owned by a MaterialState, which must be provided as the vsync.
  // This relationship must be 1:1 and cannot change for the lifetime of the MaterialState.

  final Color color;

  final TickerProvider vsync;

  @override
  _RenderInkFeatures createRenderObject(BuildContext context) {
    return _RenderInkFeatures(
      color: color,
      vsync: vsync,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, _RenderInkFeatures renderObject) {
    renderObject.color = color;
    assert(vsync == renderObject.vsync);
  }
}

class _MaterialState extends State<Material> with TickerProviderStateMixin {
  final GlobalKey _inkFeatureRenderer = GlobalKey(debugLabel: 'ink renderer');

  Color _getBackgroundColor(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    Color color = widget.color;
    if (color == null) {
      switch (widget.type) {
        case MaterialType.canvas:
          color = theme.canvasColor;
          break;
        case MaterialType.card:
          color = theme.cardColor;
          break;
        default:
          break;
      }
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    print('xie _MaterialState: build widget.color:' + widget.color.toString());
    final Color backgroundColor = _getBackgroundColor(context);
    assert(
        backgroundColor != null || widget.type == MaterialType.transparency,
        'If Material type is not MaterialType.transparency, a color must '
        'either be passed in through the `color` property, or be defined '
        'in the theme (ex. canvasColor != null if type is set to '
        'MaterialType.canvas)');
    Widget contents = widget.child;
    if (contents != null) {
      contents = AnimatedDefaultTextStyle(
        style: widget.textStyle ?? Theme.of(context).textTheme.body1,
        duration: widget.animationDuration,
        child: contents,
      );
    }
    contents = NotificationListener<LayoutChangedNotification>(
      onNotification: (LayoutChangedNotification notification) {
        final _RenderInkFeatures renderer =
            _inkFeatureRenderer.currentContext.findRenderObject();
        renderer._didChangeLayout();
        return false;
      },
      child: _InkFeatures(
        key: _inkFeatureRenderer,
        color: backgroundColor,
        child: contents,
        vsync: this,
      ),
    );

    // PhysicalModel has a temporary workaround for a performance issue that
    // speeds up rectangular non transparent material (the workaround is to
    // skip the call to ui.Canvas.saveLayer if the border radius is 0).
    // Until the saveLayer performance issue is resolved, we're keeping this
    // special case here for canvas material type that is using the default
    // shape (rectangle). We could go down this fast path for explicitly
    // specified rectangles (e.g shape RoundedRectangleBorder with radius 0, but
    // we choose not to as we want the change from the fast-path to the
    // slow-path to be noticeable in the construction site of Material.
    if (widget.type == MaterialType.canvas &&
        widget.shape == null &&
        widget.borderRadius == null) {
      print('xie AnimatedPhysicalModel');
      return AnimatedPhysicalModel(
        curve: Curves.fastOutSlowIn,
        duration: widget.animationDuration,
        shape: BoxShape.rectangle,
        clipBehavior: widget.clipBehavior,
        borderRadius: BorderRadius.zero,
        elevation: widget.elevation,
        color: _elevationOverlayColor(
            context, backgroundColor, widget.elevation, 0),
        shadowColor: widget.shadowColor,
        animateColor: false,
        child: contents,
      );
    }

    final ShapeBorder shape = _getShape();

    if (widget.type == MaterialType.transparency) {
      return _transparentInterior(
        context: context,
        shape: shape,
        clipBehavior: widget.clipBehavior,
        contents: contents,
      );
    }

    return _MaterialInterior(
      key: widget.key,
      curve: Curves.fastOutSlowIn,
      duration: widget.animationDuration,
      shape: shape,
      borderOnForeground: widget.borderOnForeground,
      clipBehavior: widget.clipBehavior,
      elevation: widget.elevation,
      color: backgroundColor,
      shadowColor: widget.shadowColor,
      child: contents,
    );
  }

  static Widget _transparentInterior({
    @required BuildContext context,
    @required ShapeBorder shape,
    @required Clip clipBehavior,
    @required Widget contents,
  }) {
    final _ShapeBorderPaint child = _ShapeBorderPaint(
      child: contents,
      shape: shape,
    );
    if (clipBehavior == Clip.none) {
      return child;
    }
    return ClipPath(
      child: child,
      clipper: ShapeBorderClipper(
        shape: shape,
        textDirection: Directionality.of(context),
      ),
      clipBehavior: clipBehavior,
    );
  }

  // Determines the shape for this Material.
  //
  // If a shape was specified, it will determine the shape.
  // If a borderRadius was specified, the shape is a rounded
  // rectangle.
  // Otherwise, the shape is determined by the widget type as described in the
  // Material class documentation.
  ShapeBorder _getShape() {
    if (widget.shape != null) return widget.shape;
    if (widget.borderRadius != null)
      return RoundedRectangleBorder(borderRadius: widget.borderRadius);
    switch (widget.type) {
      case MaterialType.canvas:
      case MaterialType.transparency:
        return const RoundedRectangleBorder();

      case MaterialType.card:
      case MaterialType.button:
        return RoundedRectangleBorder(
          borderRadius: widget.borderRadius ?? kMaterialEdges[widget.type],
        );

      case MaterialType.circle:
        return const CircleBorder();
    }
    return const RoundedRectangleBorder();
  }
}

class _MaterialInterior extends ImplicitlyAnimatedWidget {
  const _MaterialInterior({
    Key key,
    @required this.child,
    @required this.shape,
    this.borderOnForeground = true,
    this.clipBehavior = Clip.none,
    @required this.elevation,
    @required this.color,
    @required this.shadowColor,
    Curve curve = Curves.linear,
    @required Duration duration,
  })  : assert(child != null),
        assert(shape != null),
        assert(clipBehavior != null),
        assert(elevation != null && elevation >= 0.0),
        assert(color != null),
        assert(shadowColor != null),
        super(key: key, curve: curve, duration: duration);

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  /// The border of the widget.
  ///
  /// This border will be painted, and in addition the outer path of the border
  /// determines the physical shape.
  final ShapeBorder shape;

  /// Whether to paint the border in front of the child.
  ///
  /// The default value is true.
  /// If false, the border will be painted behind the child.
  final bool borderOnForeground;

  /// {@macro flutter.widgets.Clip}
  final Clip clipBehavior;

  /// The target z-coordinate at which to place this physical object relative
  /// to its parent.
  ///
  /// The value is non-negative.
  final double elevation;

  /// The target background color. TODO bug
  final Color color;

  /// The target shadow color.
  final Color shadowColor;

  @override
  _MaterialInteriorState createState() {
    print('xie _MaterialInterior createState color:' + color.toString());
    return _MaterialInteriorState();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<ShapeBorder>('shape', shape));
    description.add(DoubleProperty('elevation', elevation));
    description.add(ColorProperty('color', color));
    description.add(ColorProperty('shadowColor', shadowColor));
  }
}

abstract class AnimatedWidgetBaseState<T extends ImplicitlyAnimatedWidget>
    extends ImplicitlyAnimatedWidgetState<T> {
  @override
  void initState() {
    super.initState();
    controller.addListener(_handleAnimationChanged);
  }

  void _handleAnimationChanged() {
    setState(() {/* The animation ticked. Rebuild with new animation value */});
  }
}

// change AnimatedWidgetBaseState -> ImplicitlyAnimatedWidgetState
class _MaterialInteriorState
    extends ImplicitlyAnimatedWidgetState<_MaterialInterior> {
  Tween<double> _elevation;
  ColorTween _shadowColor;
  ShapeBorderTween _border;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _elevation = visitor(_elevation, widget.elevation,
        (dynamic value) => Tween<double>(begin: value));
    _shadowColor = visitor(_shadowColor, widget.shadowColor,
        (dynamic value) => ColorTween(begin: value));
    _border = visitor(_border, widget.shape,
        (dynamic value) => ShapeBorderTween(begin: value));
  }

  var oldWidget;
  var oldColor;
  myColor oldColor2;

  @override
  Widget build(BuildContext context) {
//    if (oldColor2 != null) {
//      print('xie old color :' + oldColor2.color.toString());
//      print('xie old color :' + oldColor2.tag);
//    }
    print('xie new color :' + widget.color.toString());
    print('xie widget.key :' + widget.key.toString());
//    var f = oldColor2;
//
//    oldColor2 = new myColor();
//    print('xie compare' + identical(f, oldColor2).toString());
//    oldColor2.color = widget.color;
//    oldColor2.tag = DateTime.now().toString();
    final ShapeBorder shape = _border.evaluate(animation);
    final double elevation = _elevation.evaluate(animation);
    return PhysicalShape(
      child: _ShapeBorderPaint(
        child: widget.child,
        shape: shape,
        borderOnForeground: widget.borderOnForeground,
      ),
      clipper: ShapeBorderClipper(
        shape: shape,
        textDirection: Directionality.of(context),
      ),
      clipBehavior: widget.clipBehavior,
      elevation: elevation,
      color: _elevationOverlayColor(context, widget.color, elevation, 1),
      shadowColor: _shadowColor.evaluate(animation),
    );
  }
}

class myColor {
  Color color;
  String tag;
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

class _FifoCache<K, V> {
  _FifoCache(this._maximumSize)
      : assert(_maximumSize != null && _maximumSize > 0);

  /// In Dart the map literal uses a linked hash-map implementation, whose keys
  /// are stored such that [Map.keys] returns them in the order they were
  /// inserted.
  final Map<K, V> _cache = <K, V>{};

  /// Maximum number of entries to store in the cache.
  ///
  /// Once this many entries have been cached, the entry inserted least recently
  /// is evicted when adding a new entry.
  final int _maximumSize;

  /// Returns the previously cached value for the given key, if available;
  /// if not, calls the given callback to obtain it first.
  ///
  /// The arguments must not be null.
  V putIfAbsent(K key, V loader()) {
    assert(key != null);
    assert(loader != null);
    final V result = _cache[key];
    if (result != null) return result;
    if (_cache.length == _maximumSize) _cache.remove(_cache.keys.first);
    return _cache[key] = loader();
  }
}

class _IdentityThemeDataCacheKey {
  _IdentityThemeDataCacheKey(this.baseTheme, this.localTextGeometry);

  final ThemeData baseTheme;
  final TextTheme localTextGeometry;

  // Using XOR to make the hash function as fast as possible (e.g. Jenkins is
  // noticeably slower).
  @override
  int get hashCode =>
      identityHashCode(baseTheme) ^ identityHashCode(localTextGeometry);

  @override
  bool operator ==(Object other) {
    // We are explicitly ignoring the possibility that the types might not
    // match in the interests of speed.
    final _IdentityThemeDataCacheKey otherKey = other;
    return identical(baseTheme, otherKey.baseTheme) &&
        identical(localTextGeometry, otherKey.localTextGeometry);
  }
}
