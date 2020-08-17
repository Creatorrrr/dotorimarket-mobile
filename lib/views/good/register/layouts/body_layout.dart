import 'package:dotorimarket/views/category/widgets/category_list_item.dart';
import 'package:dotorimarket/views/good/register/widgets/good_register_input.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {
  static const String IMAGE_PATH = 'assets/dotori-logo.png';
  static const double IMAGE_HEIGHT = 100.0;
  static const double TEXT_FORM_FIELD_VERTICAL_PADDING = 5.0;
  static const double TEXT_FORM_FIELD_HORIZONTAL_PADDING = 10.0;

  static const String GOOD_NAME_HINT_TEXT = '상품명';
  static const String CATEGORY_HINT_TEXT = '카테고리';
  static const String PRICE_HINT_TEXT = '가격';
  static const String DESCRIPTION_HINT_TEXT = '설명';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Image.asset(
              IMAGE_PATH,
              height: IMAGE_HEIGHT,
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              vertical: TEXT_FORM_FIELD_VERTICAL_PADDING,
              horizontal: TEXT_FORM_FIELD_HORIZONTAL_PADDING,
            ),
          ),
          Container(
            child: GoodRegisterInput(
              hintText: GOOD_NAME_HINT_TEXT,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: TEXT_FORM_FIELD_VERTICAL_PADDING,
              horizontal: TEXT_FORM_FIELD_HORIZONTAL_PADDING,
            ),
          ),
          Container(
            child: DropdownButtonFormField(
              items: [
                DropdownMenuItem(
                  child: Text('카테고리1'),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text('카테고리2'),
                  value: 2,
                ),
                DropdownMenuItem(
                  child: Text('카테고리3'),
                  value: 3,
                ),
              ],
              onChanged: (value) {

              },
              decoration: InputDecoration(
                hintText: CATEGORY_HINT_TEXT,
                contentPadding: const EdgeInsets.all(10.0),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: TEXT_FORM_FIELD_VERTICAL_PADDING,
              horizontal: TEXT_FORM_FIELD_HORIZONTAL_PADDING,
            ),
          ),
          Container(
            child: GoodRegisterInput(
              hintText: PRICE_HINT_TEXT,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: TEXT_FORM_FIELD_VERTICAL_PADDING,
              horizontal: TEXT_FORM_FIELD_HORIZONTAL_PADDING,
            ),
          ),
          Container(
            child: GoodRegisterInput(
              hintText: DESCRIPTION_HINT_TEXT,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: TEXT_FORM_FIELD_VERTICAL_PADDING,
              horizontal: TEXT_FORM_FIELD_HORIZONTAL_PADDING,
            ),
          ),
        ],
      ),
      padding: const EdgeInsets.all(10.0),
    );
  }
}