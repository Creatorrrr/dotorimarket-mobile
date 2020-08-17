import 'package:flutter/material.dart';

class GoodRegisterInput extends StatelessWidget {
  final String hintText;

  GoodRegisterInput({
    Key key,
    this.hintText,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: this.hintText,
        contentPadding: const EdgeInsets.all(10.0)
      ),
    );
  }
}