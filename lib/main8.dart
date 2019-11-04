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
        body: DialogTest(),
      ),
    );
  }
}

class DialogTest extends StatelessWidget {
  Future<bool> showDialog1(context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Text("你确定要做这个操作吗"),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("取消")),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text("确定"))
            ],
          );
        });
  }

  Future<void> showDialog2(context) async {
    int i = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("选择"),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop(1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop(2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              )
            ],
          );
        });
    if (i != null) {
      print("选择了：${i == 1 ? "选择1" : "选择2"}");
    }
  }

  Future<void> showListDialog(context) async {
    int i = await showDialog(
        context: context,
        builder: (BuildContext context) {
          var child = Column(
            children: <Widget>[
              ListTile(title: Text("请选择")),
              Expanded(
                  child: ListView.builder(
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("$index"),
                    onTap: () => Navigator.of(context).pop(index),
                  );
                },
              )),
            ],
          );

//          return Dialog(
//            child: child,
//          );
          return UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 180),
              child: Material(
                child: child,
                type: MaterialType.card,
              ),
            ),
          );
        });
    if (i != null) {
      print("点击了$i");
    }
  }

  @override
  Widget build(BuildContext context) {
    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return Material(
      child: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text("按钮1"),
                onPressed: () async {
                  bool res = await showDialog1(context);
                  if (res == null) {
                    print("取消操作");
                  } else {
                    print("确认操作");
                  }
                }),
            RaisedButton(
                child: Text("按钮2"),
                onPressed: () {
                  showDialog2(context);
                }),
            RaisedButton(
                child: Text("按钮3"),
                onPressed: () {
                  showListDialog(context);
                }),
          ],
        ),
      ),
    );
  }
}
