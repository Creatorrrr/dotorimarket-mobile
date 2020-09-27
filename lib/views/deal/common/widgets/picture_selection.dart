import 'package:dotorimarket/constants/color_constant.dart';
import 'package:flutter/material.dart';

class PictureSelection extends StatelessWidget {
  static const String PICTURE_SELECTION_ICON_PATH = 'assets/images/picture-selection.png';

  static const double PICTURE_SELECTION_SIZE_DEFAULT = 70.0;
  static const Color PICTURE_SELECTION_ICON_COLOR = ColorConstant.DEEP_YELLOW;
  static const double PICTURE_SELECTION_FONT_SIZE = 12.0;
  static const double PICTURE_SELECTION_TEXT_TOP_PADDING = 5.0;
  static const double PICTURE_SELECTION_BORDER_WIDTH = 1.0;
  static const double PICTURE_SELECTION_BORDER_RADIUS = 5.0;
  static const double PICTURE_SELECTION_TOP_MARGIN = 7.0;
  static const double PICTURE_SELECTION_RIGHT_MARGIN = 7.0;

  static const String PICTURE_SELECTION_TEXT = '사진선택';

  final double height;
  final double width;
  final Function onPressed;

  PictureSelection({
    Key key,
    this.height = PICTURE_SELECTION_SIZE_DEFAULT,
    this.width = PICTURE_SELECTION_SIZE_DEFAULT,
    this.onPressed,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Container(
          child: Column(
            children: [
              Image.asset(PICTURE_SELECTION_ICON_PATH,
                color: PICTURE_SELECTION_ICON_COLOR,
              ),
              Container(
                child: const Text(PICTURE_SELECTION_TEXT,
                  style: const TextStyle(
                    fontSize: PICTURE_SELECTION_FONT_SIZE,
                  ),
                ),
                padding: const EdgeInsets.only(
                  top: PICTURE_SELECTION_TEXT_TOP_PADDING,
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          height: height,
          width: width,
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorConstant.BACKGROUND_GREY,
              width: PICTURE_SELECTION_BORDER_WIDTH,
            ),
            borderRadius: BorderRadius.circular(PICTURE_SELECTION_BORDER_RADIUS),
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}