import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Wi',
        style: TextStyle(
          fontSize: 50,
          color: Colors.pink[200],
          fontWeight: FontWeight.bold,
          fontFamily: 'PlayfairDisplay',
        ),
        children: <TextSpan>[
          TextSpan(
            text: title != null ? ' ne $title.' : ' ne.',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Color.fromARGB(255, 45, 40, 122),
            ),
          ),
        ],
      ),
    );
  }
}
