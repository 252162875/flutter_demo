import 'package:flutter/material.dart';

class MySlideTransition extends AnimatedWidget {
  Animation<double> get position => listenable;
  final bool transformHitTests;
  final AxisDirection direction;
  final Widget child;
  Tween<Offset> _tween;

  MySlideTransition(
      {Key key,
      @required Animation<double> position,
      this.transformHitTests = true,
      this.direction = AxisDirection.down,
      this.child})
      : assert(position != null),
        super(key: key, listenable: position) {
    switch (direction) {
      case AxisDirection.up:
        _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
        break;
      case AxisDirection.right:
        _tween = Tween(begin: Offset(-1, 0), end: Offset(0, 0));
        break;
      case AxisDirection.down:
        _tween = Tween(begin: Offset(0, -1), end: Offset(0, 0));
        break;
      case AxisDirection.left:
        _tween = Tween(begin: Offset(1, 0), end: Offset(0, 0));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Offset offset = _tween.evaluate(position);
    if (position.status == AnimationStatus.reverse) {
      switch(direction){
        case AxisDirection.up:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.right:
          offset = Offset(-offset.dx, offset.dy);
          break;
        case AxisDirection.down:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.left:
          offset = Offset(-offset.dx, offset.dy);
          break;
      }
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}
