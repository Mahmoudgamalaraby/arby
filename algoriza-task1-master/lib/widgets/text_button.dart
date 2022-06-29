import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String textButton;
  final Color color;
  final double fontSize ;

  final void Function() onTap;

  const MyTextButton(
      {Key? key,
      required this.textButton,
      required this.onTap,
      this.color = Colors.blue,
      this.fontSize = 14
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        textButton,
        style: TextStyle(
          color: color,
          fontSize: fontSize
        ),
      ),
    );
  }
}
