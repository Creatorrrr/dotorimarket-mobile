import 'package:flutter/material.dart';

class SettingButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  SettingButton({
    Key key,
    @required this.text,
    @required this.onPressed,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        this.text,
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      onTap: this.onPressed,
    );
  }
}