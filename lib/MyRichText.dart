import 'package:flutter/material.dart';

class MyRichText extends StatefulWidget {
  final String text;
  final TextStyle linkStyle;

  MyRichText({Key key, this.text, this.linkStyle}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyRichTextState();
  }
}

class _MyRichTextState extends State<MyRichText> {
  TextSpan _textSpan;

  @override
  void initState() {
    // TODO: implement initState
    _textSpan = parseText(widget.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(text: _textSpan);
  }

  TextSpan parseText(String text) {
    return TextSpan(children: [
      TextSpan(text: text[0], style: TextStyle(color: Colors.black)),
      TextSpan(
          text: text.substring(1, text.length),
          style: TextStyle(color: Colors.blue))
    ]);
  }

  @override
  void didUpdateWidget(MyRichText oldWidget) {
    // TODO: implement didUpdateWidget
    if (oldWidget.text != widget.text) {
      _textSpan = parseText(widget.text);
    }
    super.didUpdateWidget(oldWidget);
  }
}
