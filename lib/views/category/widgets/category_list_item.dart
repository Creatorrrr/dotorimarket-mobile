import 'package:flutter/material.dart';

class CategoryListItem extends StatelessWidget {
  static const double VERTICAL_PADDING = 15.0;
  static const double TEXT_FONT_SIZE = 16.0;
  static const double TEXT_LEFT_PADDING = 15.0;

  final String text;
  final Function onPressed;

  CategoryListItem({
    Key key,
    @required this.text,
    @required this.onPressed,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Row(
          children: [
            Container(
              child: Icon(Icons.circle,
                color: Colors.black26,
              ),
            ),
            Expanded(
                child: Container(
                  child: Text(text,
                    style: const TextStyle(
                      fontSize: TEXT_FONT_SIZE,
                    ),
                  ),
                  padding: const EdgeInsets.only(
                    left: TEXT_LEFT_PADDING,
                  ),
                )
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(
          vertical: VERTICAL_PADDING,
        ),
      ),
      onTap: onPressed,
    );
  }
}