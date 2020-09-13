import 'package:flutter/material.dart';

class BodyTabBarText extends StatelessWidget {
  final String text;

  BodyTabBarText(this.text,{
    Key key,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: const TextStyle(
        color: Colors.black,
      ),
    );
  }
}