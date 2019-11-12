import 'package:flutter/material.dart';

class DioTestRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DioTestRouteState();
  }
}

class DioTestRouteState extends State<DioTestRoute>{
//  Dio dio =
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FutureBuilder(
          builder: (BuildContext context,AsyncSnapshot snapshot){

      }),
    );
  }

}