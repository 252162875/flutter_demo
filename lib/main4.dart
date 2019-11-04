import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ScaffoldRoute(),
      ),
    );
  }
}

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute>
    with SingleTickerProviderStateMixin {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];
  @override
  void initState() {
    super.initState();
  }
  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {
        //重新构建列表
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget divider1=Divider(
      indent: 10.0,
      endIndent: 20.0,
      color: Colors.blue,);
    Widget divider2= Container(height: 5.0,color: Colors.red,margin:EdgeInsets.only(left: 5.0,right: 5.0),);
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: Text("App Name"),
      ),
      body: Column(
        children: <Widget>[
          ListTile(title: Text("商品列表"),),
          Expanded(
            child: ListView.separated(
                itemCount: _words.length,
                separatorBuilder:(BuildContext context,int index){
                  return index%2==0?divider1:divider2;
                },
                itemBuilder: (BuildContext context,int index){
                  //如果到了表尾
                  if (_words[index] == loadingTag) {
                    //不足100条，继续获取数据
                    if (_words.length - 1 < 30) {
                      //获取数据
                      _retrieveData();
                      //加载时显示loading
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: SizedBox(
                            width: 24.0,
                            height: 24.0,
                            child: CircularProgressIndicator(strokeWidth: 2.0)
                        ),
                      );
                    } else {
                      print("changdu"+_words.length.toString());
                      //已经加载了100条数据，不再获取数据。
                      return Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(16.0),
                          child: Text("没有更多了", style: TextStyle(color: Colors.grey),)
                      );
                    }
                  }
              return ListTile(title: Text(_words[index]),);
            }),
          ),
        ],
      ),
    );
  }}