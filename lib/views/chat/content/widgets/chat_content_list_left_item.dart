import 'package:dotorimarket/views/chat/content/widgets/chat_profile_image.dart';
import 'package:flutter/material.dart';

class ChatContentListLeftItem extends StatelessWidget {
  static const String PROFILE_IMAGE_PATH = 'assets/images/dotori-logo.png';

  static const Color TEXT_BOX_COLOR_DEFAULT = Color.fromRGBO(242, 242, 242, 1.0);
  static const double PROFILE_IMAGE_RADIUS = 20.0;
  static const double TEXT_BOX_LEFT_MARGIN = 15.0;
  static const double TEXT_BOX_PADDING = 10.0;
  static const double TEXT_BOX_BORDER_RADIUS = 20.0;
  static const double TIME_FONT_SIZE = 12.0;
  static const double TIME_LEFT_MARGIN = 10.0;
  static const double TIME_RIGHT_MARGIN = 50.0;
  static const double TIME_WIDTH = 40.0;

  final String text;
  final Color backgroundColor;
  final String time;
  final ImageProvider image;

  ChatContentListLeftItem({
    Key key,
    @required this.text,
    this.backgroundColor = TEXT_BOX_COLOR_DEFAULT,
    this.time = '',
    this.image = const AssetImage(PROFILE_IMAGE_PATH),
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ChatProfileImage(
            image: this.image,
            radius: PROFILE_IMAGE_RADIUS,
          ),
          Container(
            child: Row(
              children: [
                Container(
                  child: Text(text),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(TEXT_BOX_BORDER_RADIUS),
                      topRight: Radius.circular(TEXT_BOX_BORDER_RADIUS),
                      bottomRight: Radius.circular(TEXT_BOX_BORDER_RADIUS),
                    ),
                    color: backgroundColor,
                  ),
                  padding: const EdgeInsets.all(TEXT_BOX_PADDING),
                  margin: const EdgeInsets.only(
                    left: TEXT_BOX_LEFT_MARGIN,
                  ),
                ),
                Container(
                  child: Text(time,
                    style: const TextStyle(
                      fontSize: TIME_FONT_SIZE,
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                  width: TIME_WIDTH,
                  margin: const EdgeInsets.only(
                    left: TIME_LEFT_MARGIN,
                    right: TIME_RIGHT_MARGIN,
                  ),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.end,
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      alignment: Alignment.centerLeft,
    );
  }
}