import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
//渐变色数组
  final List<Color> colors;

//按钮宽高
  final double width;
  final double height;
  final Widget child;
  final BorderRadius borderRadius;
  final GestureTapCallback onPressed;

  GradientButton(
      {this.colors,
      this.width,
      this.height,
      this.onPressed,
      this.borderRadius,
      @required this.child});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ThemeData themeData = Theme.of(context);
    List<Color> _colors = colors ??
        [
          themeData.primaryColor,
          themeData.primaryColorDark ?? themeData.primaryColor
        ];
    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: _colors),
          borderRadius: borderRadius),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onPressed,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    child: child),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
