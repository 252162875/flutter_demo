import 'package:flutter/material.dart';
import 'package:flutter_demo/HttpTestRoute.dart';
import 'newroute.dart';
import 'tiproute.dart';
import 'AnimatedSwitcherCounterRoute.dart';
import 'AnimatedSwitcherCounterRoute2.dart';
import 'GradientButton.dart';
import 'TurnBox.dart';
import 'MyRichText.dart';
import 'CustomPatainerRoute.dart';
import 'GradientCircularProgressRoute.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "newroute": (context) => NewRoute(),
        "tiproute": (context) => TipRoute(text: "提示main")
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double _turnBoxTurns = 0.0;
  String _richText = "www.baidu.com";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
              FlatButton(
                child: Text("Open New Route"),
                textColor: Colors.blue,
                onPressed: () {
//                Navigator.pushNamed(context, "newroute");
                  Navigator.of(context)
                      .pushNamed("newroute", arguments: "main arg");
//                Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                        builder: (context) {
//                          return NewRoute();
//                        },
//                        maintainState: false));
                },
              ),
              FlatButton(
                child: Text("Open New Route 2"),
                textColor: Colors.blue,
                onPressed: () {
//                Navigator.pushNamed(context, "newroute");
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 300),
                          pageBuilder: (BuildContext context,
                              Animation animation,
                              Animation secondaryAnimation) {
                            return FadeTransition(
                              opacity: animation,
                              child: TipRoute(text: "push"),
                            );
                          }));
//                Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                        builder: (context) {
//                          return NewRoute();
//                        },
//                        maintainState: false));
                },
              ),
              FlatButton(
                child: Text("AnimatedSwitcherCounterRoute"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AnimatedSwitcherCounterRoute();
                  }));
//                Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                        builder: (context) {
//                          return NewRoute();
//                        },
//                        maintainState: false));
                },
              ),
              FlatButton(
                child: Text("AnimatedSwitcherCounterRoute2"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AnimatedSwitcherCounterRoute2();
                  }));
//                Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                        builder: (context) {
//                          return NewRoute();
//                        },
//                        maintainState: false));
                },
              ),
              FlatButton(
                child: Text("Open New Route 3"),
                textColor: Colors.blue,
                onPressed: () {
//                Navigator.pushNamed(context, "newroute");
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TipRoute(text: "3");
                  }));
//                Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                        builder: (context) {
//                          return NewRoute();
//                        },
//                        maintainState: false));
                },
              ),
              GradientButton(
                child: Text("按钮"),
                colors: [Colors.blue, Colors.red],
                height: 50.0,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                onPressed: () {
                  print("GradientButton");
                  setState(() {
                    _turnBoxTurns += 0.75;
                    _richText = _richText += "*";
                  });
                },
              ),
              TurnBox(
                turns: _turnBoxTurns,
                speed: 1000,
                child: Icon(
                  Icons.refresh,
                  size: 100.0,
                ),
              ),
              MyRichText(
                text: _richText,
                linkStyle: null,
              ),
              FlatButton(
                child: Text("CustomPatainerRoute"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CustomPatainerRoute();
                  }));
                },
              ),
              FlatButton(
                child: Text("CustomPatainerRoute"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CustomPatainerRoute();
                  }));
                },
              ),
              FlatButton(
                child: Text("GradientCircularProgressIndicator"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return GradientCircularProgressRoute();
                  }));
                },
              ),
              FlatButton(
                child: Text("HttpTestRoutePage"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HttpTestRoute();
                  }));
                },
              ),
              FlatButton(
                child: Text("DioTestRoutePage"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HttpTestRoute();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
