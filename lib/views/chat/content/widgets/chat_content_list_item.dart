import 'package:dotorimarket/views/chat/content/widgets/chat_profile_image.dart';
import 'package:flutter/material.dart';

class ChatContentListItem extends StatelessWidget {
  static const String PROFILE_IMAGE_PATH = 'assets/images/dotori-logo.png';
  static const double HEIGHT_DEFAULT = 35.0;
  static const double PROFILE_IMAGE_RADIUS_DEFAULT = HEIGHT_DEFAULT / 2;

  static const int MESSAGE_LEFT = 0;
  static const int MESSAGE_RIGHT = 1;

  final int mode;
  final String content;
  final ImageProvider image;

  ChatContentListItem({
    Key key,
    @required this.mode,
    @required this.content,
    this.image = const AssetImage(PROFILE_IMAGE_PATH),
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widget;
    switch (this.mode) {
      case MESSAGE_RIGHT:
        widget = _makeMessageRightWidget();
        break;
      default:
        widget = _makeMessageLeftWidget();
    };

    return widget;
  }

  Widget _makeMessageLeftWidget() {
    return Container(
      child: Row(
        children: [
          ChatProfileImage(
            image: this.image,
            radius: PROFILE_IMAGE_RADIUS_DEFAULT,
          ),
          Container(
            child: Text(content),
            height: HEIGHT_DEFAULT,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.lightBlueAccent,
            ),
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
          )
        ],
      ),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _makeMessageRightWidget() {
    return Container(
      child: Row(
        children: [
          Container(
            child: Text(content),
            height: HEIGHT_DEFAULT,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.amberAccent,
            ),
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}