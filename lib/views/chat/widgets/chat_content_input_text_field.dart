import 'package:flutter/material.dart';

class ChatContentInputTextField extends StatelessWidget {
  final TextEditingController controller;

  ChatContentInputTextField({
    Key key,
    @required this.controller,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}