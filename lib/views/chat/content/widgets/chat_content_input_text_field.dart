import 'package:flutter/material.dart';

class ChatContentInputTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String value) onSubmitted;

  ChatContentInputTextField({
    Key key,
    @required this.controller,
    this.onSubmitted,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      onSubmitted: onSubmitted,
      maxLines: 100,
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