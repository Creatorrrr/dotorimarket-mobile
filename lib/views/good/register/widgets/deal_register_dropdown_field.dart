import 'package:flutter/material.dart';

class DealRegisterDropdownField<T> extends StatelessWidget {
  static const double CONTENT_PADDING_DEFAULT = 10.0;

  static const String CATEGORY_HINT_TEXT = '카테고리';

  final String hintText;
  final double contentPadding;
  final List<DropdownMenuItem<T>> items;
  final InputBorder enabledBorder;
  final InputBorder focusedBorder;
  final InputBorder focusedErrorBorder;
  final InputBorder disabledBorder;
  final InputBorder errorBorder;
  final Function(T) onChanged;

  DealRegisterDropdownField({
    Key key,
    this.items,
    this.hintText,
    this.contentPadding = CONTENT_PADDING_DEFAULT,
    this.enabledBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.errorBorder,
    this.onChanged,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      items: items,
      onChanged: onChanged ?? (T value) {},
      decoration: InputDecoration(
        hintText: CATEGORY_HINT_TEXT,
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