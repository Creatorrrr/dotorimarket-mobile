
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  static const bool AUTO_FOCUS_DEFAULT = false;

  final String labelText;
  final Icon icon;
  final bool autoFocus;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function onFieldSubmitted;

  LoginTextField({
    Key key,
    @required this.labelText,
    @required this.icon,
    this.autoFocus = AUTO_FOCUS_DEFAULT,
    this.controller,
    this.focusNode,
    this.onFieldSubmitted,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: this.labelText,
        icon: this.icon,
      ),
      autofocus: this.autoFocus,
      focusNode: this.focusNode ?? FocusNode(),
      onFieldSubmitted: this.onFieldSubmitted ?? (String value) {},
    );
  }
}