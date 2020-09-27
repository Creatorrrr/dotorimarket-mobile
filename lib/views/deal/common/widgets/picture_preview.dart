import 'package:dotorimarket/constants/color_constant.dart';
import 'package:dotorimarket/views/common/widgets/circle_image.dart';
import 'package:flutter/material.dart';

class PicturePreview extends StatelessWidget {
  static const double PICTURE_PREVIEW_SIZE_DEFAULT = 70.0;
  static const double PICTURE_PREVIEW_BORDER_WIDTH = 1.0;
  static const double PICTURE_PREVIEW_BORDER_RADIUS = 5.0;
  static const double CLOSE_BUTTON_OVERFLOW_SIZE_DEFAULT = 8.0;
  static const double CLOSE_BUTTON_RADIUS = 10.0;
  static const double CLOSE_BUTTON_ICON_SIZE = 16.0;
  static const Color CLOSE_BUTTON_BACKGROUND_COLOR = ColorConstant.BACKGROUND_GREY;

  final Image image;
  final double height;
  final double width;
  final double closeButtonOverflowSize;
  final Function onPressed;

  PicturePreview({
    Key key,
    @required this.image,
    this.height = PICTURE_PREVIEW_SIZE_DEFAULT,
    this.width = PICTURE_PREVIEW_SIZE_DEFAULT,
    this.closeButtonOverflowSize = CLOSE_BUTTON_OVERFLOW_SIZE_DEFAULT,
    this.onPressed,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            child: image,
            height: height,
            width: width,
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorConstant.BACKGROUND_GREY,
                width: PICTURE_PREVIEW_BORDER_WIDTH,
              ),
              borderRadius: BorderRadius.circular(PICTURE_PREVIEW_BORDER_RADIUS),
            ),
            margin: EdgeInsets.only(
              top: closeButtonOverflowSize,
              right: closeButtonOverflowSize,
            ),
          ),
          Positioned(
            child: GestureDetector(
              child: Align(
                alignment: Alignment.topRight,
                child: CircleImage(
                  child: Icon(Icons.close,
                    size: CLOSE_BUTTON_ICON_SIZE,
                    color: Colors.white,
                  ),
                  radius: CLOSE_BUTTON_RADIUS,
                  backgroundColor: CLOSE_BUTTON_BACKGROUND_COLOR,
                ),
              ),
              onTap: onPressed,
            ),
            right: 0.0,
          ),
        ],
      ),
    );
  }
}