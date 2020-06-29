
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String labelText;
  final Icon icon;
  final TextEditingController textEditingController;

  LoginTextField({ Key key, @required this.labelText, @required this.icon, this.textEditingController }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: this.labelText,
        icon: this.icon,
      ),
    );
  }
}