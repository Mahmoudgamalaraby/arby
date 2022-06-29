import 'package:flutter/material.dart';

class MyHeadText extends StatelessWidget {
  final String headText ;
  const MyHeadText({Key? key, required this.headText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      headText,
      style: Theme.of(context)
          .textTheme
          .headline3!
          .copyWith(color: Colors.black),
    );
  }
}
