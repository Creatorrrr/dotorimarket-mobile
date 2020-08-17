
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String labelText;
  final Icon icon;
  final TextEditingController controller;

  LoginTextField({
    Key key,
    @required this.labelText,
    @required this.icon,
    this.controller
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: this.labelText,
        icon: this.icon,
      ),
    );
  }
}