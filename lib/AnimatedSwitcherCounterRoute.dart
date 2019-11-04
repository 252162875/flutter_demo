import 'package:flutter/material.dart';

class AnimatedSwitcherCounterRoute extends StatefulWidget {

  AnimatedSwitcherCounterRoute({Key key})
      : super(key: key);

//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("提示"),
//      ),
//      body: Padding(
//        padding: EdgeInsets.all(18),
//        child: Center(
//          child: Column(
//            children: <Widget>[
//              Text(text),
//              RaisedButton(
//                onPressed: () => Navigator.pop(context, "我是TipRoute返回值"),
//                child: Text("返回"),
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }

  @override
  _AnimatedSwitcherCounterRouteState createState() =>
      _AnimatedSwitcherCounterRouteState();
}

class _AnimatedSwitcherCounterRouteState
    extends State<AnimatedSwitcherCounterRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedSwitcherCounterRoute"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: Text(
                "$_count",
                key: ValueKey<int>(_count),
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            RaisedButton(
                child: Text("+1"),
                onPressed: () {
                  setState(() {
                    _count += 1;
                  });
                })
          ],
        ),
      ),
    );
  }
}
