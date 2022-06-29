import 'package:flutter/material.dart';

class LabelOfFormField extends StatelessWidget {

  final String label ;

  const LabelOfFormField({Key? key , required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(label , style: Theme.of(context).textTheme.headline6,);
  }
}
