import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DealRegisterInput extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final int maxLines;
  final InputBorder enabledBorder;
  final InputBorder focusedBorder;
  final InputBorder focusedErrorBorder;
  final InputBorder disabledBorder;
  final InputBorder errorBorder;

  final TextEditingController controller;

  DealRegisterInput({
    Key key,
    @required this.controller,
    this.hintText,
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
        contentPadding: const EdgeInsets.all(10.0),
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