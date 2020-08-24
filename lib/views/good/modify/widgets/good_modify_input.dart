import 'package:flutter/material.dart';

class GoodModifyInput extends StatelessWidget {
  final String hintText;

  GoodModifyInput({
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