import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPageTextButton extends StatelessWidget {
  static final double TEXT_SIZE_DEFAULT = 18.0;

  final String text;
  final Function onTab;

  MyPageTextButton({
    Key key,
    @required this.text,
    @required this.onTab,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        this.text,
        style: TextStyle(
          fontSize: TEXT_SIZE_DEFAULT,
        ),
      ),
      onTap: this.onTab,
    );
  }
}