import 'package:flutter/material.dart';

class MyCaption extends StatelessWidget {
  final String text ;
  final double fontSize ;
  final Color color ;
  const MyCaption({Key? key,required this.text , this.fontSize = 20 , this.color = Colors.grey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color:color
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
    );
  }
}
