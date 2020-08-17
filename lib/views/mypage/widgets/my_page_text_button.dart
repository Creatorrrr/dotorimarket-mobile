import 'package:flutter/cupertino.dart';

class MyPageTextButton extends StatelessWidget {
  static final double TEXT_SIZE_DEFAULT = 18.0;
  final String text;

  MyPageTextButton({
    Key key,
    @required this.text,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
        fontSize: TEXT_SIZE_DEFAULT,
      ),
    );
  }
}