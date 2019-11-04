import 'package:flutter/material.dart';
import 'tiproute.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("New Route"),
      ),
      body: Center(
        child: RaisedButton(onPressed: () async {
          //打开TipRoute，并等待返回结果
          var result = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return TipRoute(
              text: "我是NewRoute提示参数",
            );
          }));
         print("路由返回值：$result");
        },
        child: Text(args),),

      ),
    );
  }
}
