
import 'package:dotorimarket/constants/color_constant.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  static const bool AUTO_FOCUS_DEFAULT = false;
  static const double VERTICAL_CONTENT_PADDING = 18.0;
  static const double HORIZONTAL_CONTENT_PADDING = 12.0;

  final String labelText;
  final Icon icon;
  final bool autoFocus;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function onFieldSubmitted;

  const LoginTextField({
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
        contentPadding: const  EdgeInsets.symmetric(
          vertical: VERTICAL_CONTENT_PADDING,
          horizontal: HORIZONTAL_CONTENT_PADDING,
        ),
        border: OutlineInputBorder(),
      ),
      autofocus: this.autoFocus,
      focusNode: this.focusNode ?? FocusNode(),
      onFieldSubmitted: this.onFieldSubmitted ?? (String value) {},
    );
  }
}