import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DealModifyTextField extends StatelessWidget {
  static const double CONTENT_PADDING_DEFAULT = 10.0;

  final String hintText;
  final double contentPadding;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final int maxLines;
  final InputBorder enabledBorder;
  final InputBorder focusedBorder;
  final InputBorder focusedErrorBorder;
  final InputBorder disabledBorder;
  final InputBorder errorBorder;

  final TextEditingController controller;

  DealModifyTextField({
    Key key,
    @required this.controller,
    this.hintText,
    this.contentPadding = CONTENT_PADDING_DEFAULT,
    this.keyboardType,
    this.inputFormatters,
    this.maxLines,
    this.enabledBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.errorBorder,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black54,
        ),
        contentPadding: EdgeInsets.all(contentPadding),
        enabledBorder: enabledBorder ?? const UnderlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black12,
          ),
        ),
        focusedBorder: focusedBorder,
        focusedErrorBorder: focusedErrorBorder,
        disabledBorder: disabledBorder,
        errorBorder: errorBorder,
      ),
    );
  }
}