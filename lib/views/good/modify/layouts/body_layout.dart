import 'package:dotorimarket/views/category/widgets/category_list_item.dart';
import 'package:dotorimarket/views/good/modify/widgets/good_modify_input.dart';
import 'package:dotorimarket/views/good/register/widgets/deal_register_input.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {
  static const String IMAGE_PATH = 'assets/images/otori-logo.png';
  static const double IMAGE_SIZE = 100.0;
  static const double IMAGE_LEFT_PADDING = 20.0;
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
            child: Row(
              children: [
                Container(
                  child: Text('사진선택'),
                  height: IMAGE_SIZE,
                  width: IMAGE_SIZE,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      style: BorderStyle.solid
                    ),
                  ),
                ),
                Container(
                  child: Image.asset(
                    IMAGE_PATH,
                    height: IMAGE_SIZE,
                  ),
                  margin: const EdgeInsets.only(
                    left: IMAGE_LEFT_PADDING,
                  ),
                ),
              ],
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              vertical: TEXT_FORM_FIELD_VERTICAL_PADDING,
              horizontal: TEXT_FORM_FIELD_HORIZONTAL_PADDING,
            ),
          ),
          Container(
            child: GoodModifyInput(
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
            child: GoodModifyInput(
              hintText: PRICE_HINT_TEXT,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: TEXT_FORM_FIELD_VERTICAL_PADDING,
              horizontal: TEXT_FORM_FIELD_HORIZONTAL_PADDING,
            ),
          ),
          Container(
            child: GoodModifyInput(
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