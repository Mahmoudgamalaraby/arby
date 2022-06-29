import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {

  final Widget? prefix ;

  final TextEditingController controller;

  final String validateText;

  final bool isPassword;

  final TextInputType inputType;

  final String hintText;

  const MyFormField({
    Key? key,
    required this.controller,
    required this.validateText,
    this.isPassword = false,
    required this.inputType,
    required this.hintText,
    this.prefix ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return validateText;
          }
        },
        obscureText: isPassword,
        keyboardType: inputType,
        decoration: InputDecoration(
          hintText: hintText,
          prefix: prefix,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
