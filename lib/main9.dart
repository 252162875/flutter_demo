import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("DialogTest"),
        ),
        body: GestureDetectorTest(),
      ),
    );
  }
}

class GestureDetectorTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DragState();
  }
}

class DragState extends State<GestureDetectorTest>
    with SingleTickerProviderStateMixin {
  double _top = 0.0;
  double _left = 0.0;
  double _width = 200.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Positioned(
            left: _left,
            top: _top,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("A"),
              ),
              onVerticalDragUpdate: (DragUpdateDetails e) {
                setState(() {
                  _top += e.delta.dy;
                });
              },
              onPanDown: (DragDownDetails e) {
                print("手指按下：${e.globalPosition}");
              },
              onPanUpdate: (DragUpdateDetails e) {
                setState(() {
                  _left += e.delta.dx;
                  if (_left < 10) {
                    _left = 10;
                  }
                  _top += e.delta.dy;
                  if (_top < 10) {
                    _top = 10;
                  }
                });
              },
              onPanEnd: (DragEndDetails e) {
                print(e.velocity);
              },
            )),
        Center(
          child: GestureDetector(
            child: Image.asset(
              "./images/avatar.png",
              width: _width,
            ),
            onScaleUpdate: (ScaleUpdateDetails e) {
              setState(() {
                _width = 200 * e.scale.clamp(.8, 10.0);
              });
            },
          ),
        )
      ],
    );
  }
}
