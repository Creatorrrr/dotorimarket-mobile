import 'package:flutter/material.dart';

class GoodModifyButton extends StatelessWidget {
  static const double HEIGHT_DEFAULT = 50.0;

  static const String BUTTON_NAME_TEXT = '수정완료';

  final double height;
  final Function onPressed;

  GoodModifyButton({
    Key key,
    this.height = HEIGHT_DEFAULT,
    @required this.onPressed,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        child: Text(
          BUTTON_NAME_TEXT,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        color: Colors.blueAccent,
        padding: const EdgeInsets.all(10.0),
        onPressed: this.onPressed,
    );
  }
}