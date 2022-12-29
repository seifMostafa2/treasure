// ignore_for_file: prefer_if_null_operators, overridden_fields, prefer_const_constructors_in_immutables, deprecated_member_use, use_key_in_widget_constructors, unnecessary_new, unnecessary_this, prefer_const_constructors

import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class CircularMenu extends StatefulWidget {
  /// use global key to control animation anywhere in the code
  @override
  final GlobalKey<CircularMenuState>? key;

  /// list of CircularMenuItem contains at least two items.
  final List<CircularMenuItem> items;

  /// menu alignment
  final AlignmentGeometry alignment;

  /// menu radius
  final double radius;

  /// widget holds actual page content
  final Widget? backgroundWidget;

  /// animation duration
  final Duration animationDuration;

  /// animation curve in forward
  final Curve curve;

  /// animation curve in rverse
  final Curve reverseCurve;

  /// animation curve in rverse
  final double blurOpacity;

  final Color? blurColor;

  final Widget? toggleButtonStartIcon, toggleButtonEndIcon;

  /// callback
  final VoidCallback? toggleButtonOnPressed;
  final Color? toggleButtonStartColor;
  final Color? toggleButtonEndColor;
  final double toggleAnimatedIconSize;
  final double? toggleButtonSize;

  final List<BoxShadow>? toggleButtonBoxShadow;
  final double toggleButtonPadding;
  final double toggleButtonMargin;
  final Color? toggleButtonIconColor;
  final AnimatedIconData toggleButtonAnimatedIconData;

  /// staring angle in clockwise radian
  final double? startingAngleInRadian;

  /// ending angle in clockwise radian
  final double? endingAngleInRadian;

  /// creates a circular menu with specific [radius] and [alignment] .
  /// [toggleButtonElevation] ,[toggleButtonPadding] and [toggleButtonMargin] must be
  /// equal or greater than zero.
  /// [items] must not be null and it must contains two elements at least.
  CircularMenu({
    required this.items,
    this.alignment = Alignment.bottomCenter,
    this.radius = 100,
    this.backgroundWidget,
    this.animationDuration = const Duration(milliseconds: 500),
    this.curve = Curves.bounceOut,
    this.reverseCurve = Curves.fastOutSlowIn,
    this.toggleButtonStartIcon,
    this.toggleButtonEndIcon,
    this.toggleButtonOnPressed,
    this.toggleButtonStartColor,
    this.toggleButtonEndColor,
    this.toggleButtonBoxShadow,
    this.toggleButtonSize = 17,
    this.toggleButtonMargin = 10,
    this.toggleButtonPadding = 10,
    this.toggleAnimatedIconSize = 25,
    this.blurOpacity = 3,
    this.toggleButtonIconColor,
    this.toggleButtonAnimatedIconData = AnimatedIcons.menu_close,
    this.key,
    this.endingAngleInRadian,
    this.blurColor,
    this.startingAngleInRadian,
  })  : assert(items.isNotEmpty, 'items can not be empty list'),
        assert(items.length > 1, 'if you have one item no need to use a Menu'),
        super(key: key);

  @override
  CircularMenuState createState() => CircularMenuState();
}

class CircularMenuState extends State<CircularMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  double? _completeAngle;
  late double _initialAngle;
  double? _endAngle;
  double? _startAngle;
  late int _itemsCount;
  late Animation<double> _animation;

  /// forward animation
  void forwardAnimation() {
    _animationController.forward();
  }

  /// reverse animation
  void reverseAnimation() {
    _animationController.reverse();
  }

  @override
  void initState() {
    _configure();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    )..addListener(() {
        setState(() {});
      });
    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _animationController,
          curve: widget.curve,
          reverseCurve: widget.reverseCurve),
    );
    _itemsCount = widget.items.length;
    super.initState();
  }

  void _configure() {
    if (widget.startingAngleInRadian != null ||
        widget.endingAngleInRadian != null) {
      if (widget.startingAngleInRadian == null) {
        throw ('startingAngleInRadian can not be null');
      }
      if (widget.endingAngleInRadian == null) {
        throw ('endingAngleInRadian can not be null');
      }

      if (widget.startingAngleInRadian! < 0) {
        throw 'startingAngleInRadian has to be in clockwise radian';
      }
      if (widget.endingAngleInRadian! < 0) {
        throw 'endingAngleInRadian has to be in clockwise radian';
      }
      _startAngle = (widget.startingAngleInRadian! / math.pi) % 2;
      _endAngle = (widget.endingAngleInRadian! / math.pi) % 2;
      if (_endAngle! < _startAngle!) {
        throw 'startingAngleInRadian can not be greater than endingAngleInRadian';
      }
      _completeAngle = _startAngle == _endAngle
          ? 2 * math.pi
          : (_endAngle! - _startAngle!) * math.pi;
      _initialAngle = _startAngle! * math.pi;
    } else {
      switch (widget.alignment.toString()) {
        case 'Alignment.bottomCenter':
          _completeAngle = 1 * math.pi;
          _initialAngle = 1 * math.pi;
          break;
        case 'Alignment.topCenter':
          _completeAngle = 1 * math.pi;
          _initialAngle = 0 * math.pi;
          break;
        case 'Alignment.centerLeft':
          _completeAngle = 1 * math.pi;
          _initialAngle = 1.5 * math.pi;
          break;
        case 'Alignment.centerRight':
          _completeAngle = 1 * math.pi;
          _initialAngle = 0.5 * math.pi;
          break;
        case 'Alignment.center':
          _completeAngle = 2 * math.pi;
          _initialAngle = 0 * math.pi;
          break;
        case 'Alignment.bottomRight':
          _completeAngle = 0.5 * math.pi;
          _initialAngle = 1 * math.pi;
          break;
        case 'Alignment.bottomLeft':
          _completeAngle = 0.5 * math.pi;
          _initialAngle = 1.5 * math.pi;
          break;
        case 'Alignment.topLeft':
          _completeAngle = 0.5 * math.pi;
          _initialAngle = 0 * math.pi;
          break;
        case 'Alignment.topRight':
          _completeAngle = 0.5 * math.pi;
          _initialAngle = 0.5 * math.pi;
          break;
        default:
          throw 'startingAngleInRadian and endingAngleInRadian can not be null';
      }
    }
  }

  @override
  void didUpdateWidget(oldWidget) {
    _configure();
    super.didUpdateWidget(oldWidget);
  }

  List<Widget> _buildMenuItems() {
    List<Widget> items = [];
    widget.items.asMap().forEach((index, item) {
      items.add(
        Positioned.fill(
          child: Align(
            alignment: widget.alignment,
            child: Transform.translate(
              offset: Offset.fromDirection(
                  _completeAngle == (2 * math.pi)
                      ? (_initialAngle +
                          (_completeAngle! / (_itemsCount)) * index)
                      : (_initialAngle +
                          (_completeAngle! / (_itemsCount - 1)) * index),
                  _animation.value * widget.radius),
              child: Transform.scale(
                scale: _animation.value,
                child: Transform.rotate(
                  angle: _animation.value * (math.pi * 2),
                  child: item,
                ),
              ),
            ),
          ),
        ),
      );
    });
    return items;
  }

  Widget _buildMenuButton(BuildContext context) {
    return Positioned.fill(
      child: Align(
          alignment: widget.alignment,
          child: CircularMenuItem(
              buttonSize: widget.toggleButtonSize,
              icon: _animationController.status == AnimationStatus.dismissed
                  ? widget.toggleButtonStartIcon
                  : widget.toggleButtonEndIcon,
              margin: widget.toggleButtonMargin,
              color: _animationController.status == AnimationStatus.dismissed
                  ? widget.toggleButtonEndColor == null
                      ? widget.toggleButtonStartColor ??
                          Theme.of(context).primaryColor
                      : widget.toggleButtonStartColor
                  : widget.toggleButtonStartColor == null
                      ? widget.toggleButtonEndColor ??
                          widget.toggleButtonStartColor
                      : widget.toggleButtonEndColor,
              padding: (-_animation.value * widget.toggleButtonPadding * 0.3) +
                  widget.toggleButtonPadding,
              onTap: () {
                _animationController.status == AnimationStatus.dismissed
                    ? (_animationController).forward()
                    : (_animationController).reverse();
                if (widget.toggleButtonOnPressed != null) {
                  widget.toggleButtonOnPressed!();
                }
              },
              boxShadow: widget.toggleButtonBoxShadow,
              animatedIcon: widget.toggleButtonEndIcon == null &&
                      widget.toggleButtonStartIcon == null
                  ? AnimatedIcon(
                      icon: widget
                          .toggleButtonAnimatedIconData, //AnimatedIcons.menu_close,
                      size: widget.toggleAnimatedIconSize,
                      color: widget.toggleButtonIconColor ?? Colors.white,
                      progress: _animation,
                    )
                  : null)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          (_animationController).reverse();
        });
        return false;
      },
      child: GestureDetector(
          onTap: () {
            setState(() {
              (_animationController).reverse();
            });
          },
          child: Stack(
            children: [
              _animationController.status == AnimationStatus.dismissed
                  ? Stack(
                      children: <Widget>[
                        widget.backgroundWidget ?? Container(),
                        ..._buildMenuItems(),
                        _buildMenuButton(context),
                      ],
                    )
                  : Container(
                      color: widget.blurColor != null
                          ? widget.blurColor?.withOpacity(0.3)
                          : Colors.black.withOpacity(0.3),
                      child: GlassContainer(
                        border: Border.all(width: 0, color: Colors.transparent),
                        borderRadius: BorderRadius.circular(0),
                        blur: _animation.value * widget.blurOpacity,
                        child: Stack(
                          children: <Widget>[
                            widget.backgroundWidget ?? Container(),
                            ..._buildMenuItems(),
                            _buildMenuButton(context),
                          ],
                        ),
                      ),
                    ),
            ],
          )),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class CircularMenuItem extends StatelessWidget {
  /// if icon and animatedIcon are passed, icon will be ignored
  final IconData? startIcon, endIcon;
  final Widget? icon;

  // final Color? iconColor;
  // final double iconSize;
  final Color? color;
  final VoidCallback onTap;
  final double padding;
  final double margin;
  final List<BoxShadow>? boxShadow;
  final bool enableBadge;
  final double? badgeRightOffet;
  final double? badgeLeftOffet;
  final double? badgeTopOffet;
  final double? badgeBottomOffet;
  final double? badgeRadius;
  final TextStyle? badgeTextStyle;
  final String? badgeLabel;
  final Color? badgeTextColor;
  final Color? badgeColor;
  final double? buttonSize;

  /// if animatedIcon and icon are passed, icon will be ignored
  final AnimatedIcon? animatedIcon;

  /// creates a menu item .
  /// [onTap] must not be null.
  /// [padding] and [margin]  must be equal or greater than zero.
  CircularMenuItem({
    required this.onTap,
    this.icon,
    this.color,
    this.boxShadow,
    this.animatedIcon,
    this.startIcon,
    this.buttonSize = 17,
    this.endIcon,
    this.padding = 10,
    this.margin = 10,
    this.enableBadge = false,
    this.badgeBottomOffet,
    this.badgeLeftOffet,
    this.badgeRightOffet,
    this.badgeTopOffet,
    this.badgeRadius,
    this.badgeTextStyle,
    this.badgeLabel,
    this.badgeTextColor,
    this.badgeColor,
  })  : assert(padding >= 0.0),
        assert(margin >= 0.0);

  Widget _buildCircularMenuItem(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(padding),
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: boxShadow ??
            [
              BoxShadow(
                  color: color ?? Theme.of(context).primaryColor,
                  blurRadius: 15,
                  spreadRadius: -7),
            ],
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Material(
          color: color ?? Theme.of(context).primaryColor,
          child: GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: CircleAvatar(
                radius: buttonSize,
                backgroundColor: color ?? Theme.of(context).primaryColor,
                child: animatedIcon == null ? icon : animatedIcon,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCircularMenuItemWithBadge(BuildContext context) {
    return _Badge(
      color: badgeColor,
      bottomOffset: badgeBottomOffet,
      rightOffset: badgeRightOffet,
      leftOffset: badgeLeftOffet,
      topOffset: badgeTopOffet,
      radius: badgeRadius,
      textStyle: badgeTextStyle,
      onTap: onTap,
      textColor: badgeTextColor,
      label: badgeLabel,
      child: _buildCircularMenuItem(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return enableBadge
        ? _buildCircularMenuItemWithBadge(context)
        : _buildCircularMenuItem(context);
  }
}

class _Badge extends StatelessWidget {
  const _Badge({
    Key? key,
    required this.child,
    required this.label,
    this.color,
    this.textColor,
    this.onTap,
    this.radius,
    this.bottomOffset,
    this.leftOffset,
    this.rightOffset,
    this.topOffset,
    this.textStyle,
  }) : super(key: key);

  final Widget child;
  final String? label;
  final Color? color;
  final Color? textColor;
  final Function? onTap;
  final double? rightOffset;
  final double? leftOffset;
  final double? topOffset;
  final double? bottomOffset;
  final double? radius;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      // overflow: Overflow.visible,

      children: [
        child,
        Positioned(
          right: (leftOffset == null && rightOffset == null) ? 8 : rightOffset,
          top: (topOffset == null && bottomOffset == null) ? 8 : topOffset,
          left: leftOffset,
          bottom: bottomOffset,
          child: FittedBox(
            child: GestureDetector(
              onTap: onTap as void Function()? ?? () {},
              child: CircleAvatar(
                maxRadius: radius ?? 10,
                minRadius: radius ?? 10,
                backgroundColor: color ?? Theme.of(context).primaryColor,
                child: FittedBox(
                  child: Text(
                    label ?? '',
                    textAlign: TextAlign.center,
                    style: textStyle ??
                        TextStyle(
                          fontSize: 10,
                          color: textColor ?? Theme.of(context).accentColor,
                        ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

///Create beautiful Glassmorphic ui using components provided by this package

///[GlassContainer] Container with frosted glass effect
///
///Note:
///
///It Inherit properties of [Container] so expect layout effect as container,
///while tinkering with height and width
class GlassContainer extends StatelessWidget {
  ///```
  ///opacity is used to control the glass frosted effect
  ///
  ///value should be in between 0 and 1
  ///
  ///--1 means fully opaque
  ///--0 means fully transparent
  ///
  ///default value : 0.1
  ///```
  final double opacity;

  ///[Widget] [child]
  final Widget? child;

  ///```
  ///blur intensity
  ///default value : 5
  ///```
  final double blur;

  ///```
  /// shadow strength
  ///
  /// default value : 4
  /// ```
  final double shadowStrength;

  ///```
  ///borderRadius [BorderRadiusGeometry]
  ///
  ///example:
  ///BorderRadius.circular(10),
  ///
  /// default value : BorderRadius.circular(10),
  ///
  ///```
  final BorderRadiusGeometry? borderRadius;

  ///[GlassContainer] Height
  final double? height;

  ///[GlassContainer] Width
  final double? width;

  ///```
  ///border [BoxBorder]
  ///
  ///example:
  ///Border.all(
  ///   color: Colors.white.withOpacity(0.3),
  ///   width: 0.3,
  ///   style: BorderStyle.solid,
  ///),
  ///
  ///default is same as example
  ///```
  final BoxBorder? border;

  const GlassContainer({
    Key? key,
    this.opacity = 0.05,
    this.child,
    this.blur = 5,
    this.border,
    this.height,
    this.width,
    this.borderRadius,
    this.shadowStrength = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _PaintShadow(shadowStrength: shadowStrength),
      child: Container(
        height: height,
        foregroundDecoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          border: border ??
              Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 0.3,
                  style: BorderStyle.solid),
        ),
        width: width,
        child: ClipRRect(
          borderRadius:
              borderRadius as BorderRadius? ?? BorderRadius.circular(10),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: blur,
              sigmaY: blur,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius ?? BorderRadius.circular(10),
                color: Colors.grey[100]!.withOpacity(opacity),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class _PaintShadow extends CustomPainter {
  _PaintShadow({
    this.shadowStrength = 1,
  });

  final double shadowStrength;

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  Paint customPainter(
      {required double blurStrength,
      required Color color,
      double? opacity,
      required double strokeWidth}) {
    return Paint()
      ..style = PaintingStyle.stroke
      ..color = color.withOpacity(0.24)
      ..strokeWidth = strokeWidth
      ..maskFilter = MaskFilter.blur(
        BlurStyle.normal,
        convertRadiusToSigma(
          blurStrength,
        ),
      );
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (shadowStrength == 0) return;
    RRect rect = RRect.fromRectAndRadius(
        Rect.fromPoints(
          Offset(-shadowStrength / 2, -shadowStrength / 2),
          Offset(
            size.width + shadowStrength / 2,
            size.height + shadowStrength / 2,
          ),
        ),
        Radius.circular(10));
    canvas.drawRRect(
      rect,
      customPainter(
        color: Color(0xff333333),
        blurStrength: 20,
        strokeWidth: shadowStrength,
        opacity: 0.24,
      ),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
