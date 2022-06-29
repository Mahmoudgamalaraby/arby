import 'package:flutter/material.dart';

class HelpButton extends StatelessWidget {

  final String textButton ;
  final IconData icon ;

  const HelpButton({Key? key,this.textButton = 'help' , this.icon = Icons.info,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Text(
            textButton,
            style: const TextStyle(color: Colors.blue),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Icon(
          icon,
          color: Colors.blue,
        ),
      ],
    );
  }
}
