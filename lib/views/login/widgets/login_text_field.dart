
import 'package:dotorimarket/constants/color_constant.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  static const bool AUTO_FOCUS_DEFAULT = false;
  static const bool OBSCURE_TEXT_DEFAULT = false;
  static const double VERTICAL_CONTENT_PADDING = 10.0;
  static const double HORIZONTAL_CONTENT_PADDING = 20.0;

  final String labelText;
  final Icon icon;
  final bool autoFocus;
  final bool obscureText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function onFieldSubmitted;

  const LoginTextField({
    Key key,
    @required this.labelText,
    @required this.icon,
    this.autoFocus = AUTO_FOCUS_DEFAULT,
    this.obscureText = OBSCURE_TEXT_DEFAULT,
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
        contentPadding: const  EdgeInsets.symmetric(
          vertical: VERTICAL_CONTENT_PADDING,
          horizontal: HORIZONTAL_CONTENT_PADDING,
        ),
        border: OutlineInputBorder(),
      ),
      autofocus: this.autoFocus,
      obscureText: this.obscureText,
      focusNode: this.focusNode ?? FocusNode(),
      onFieldSubmitted: this.onFieldSubmitted ?? (String value) {},
    );
  }
}