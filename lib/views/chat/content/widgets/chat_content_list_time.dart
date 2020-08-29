import 'package:flutter/material.dart';

class ChatContentListTime extends StatelessWidget {
  final String time;

  ChatContentListTime({
    Key key,
    @required this.time,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.time,
      style: TextStyle(
        fontSize: 12.0,
        color: Colors.black54,
      ),
    );
  }
}