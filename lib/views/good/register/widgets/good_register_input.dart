import 'package:flutter/material.dart';

class GoodRegisterInput extends StatelessWidget {
  final String hintText;

  final TextEditingController controller;

  GoodRegisterInput({
    Key key,
    @required this.controller,
    this.hintText,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: this.hintText,
        contentPadding: const EdgeInsets.all(10.0)
      ),
    );
  }
}