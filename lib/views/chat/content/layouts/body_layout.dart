import 'package:dotorimarket/views/chat/content/widgets/chat_content_list_item.dart';
import 'package:dotorimarket/views/chat/content/widgets/chat_content_list_time.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {
  static const String HEADER_LOGO_PATH = 'assets/images/dotori-logo.png';
  static const double CHAT_CONTENT_ITEM_VERTICAL_PADDING = 10.0;
  static const double CHAT_CONTENT_ITEM_HORIZONTAL_PADDING = 10.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: ChatContentListItem(
              mode: ChatContentListItem.MESSAGE_LEFT,
              image: AssetImage(HEADER_LOGO_PATH),
              content: 'test',
            ),
            padding: const EdgeInsets.symmetric(
              vertical: CHAT_CONTENT_ITEM_VERTICAL_PADDING,
              horizontal: CHAT_CONTENT_ITEM_HORIZONTAL_PADDING,
            ),
          ),
          Container(
            child: ChatContentListTime(
              time: '16:57',
            ),
            padding: const EdgeInsets.symmetric(
              vertical: CHAT_CONTENT_ITEM_VERTICAL_PADDING,
              horizontal: CHAT_CONTENT_ITEM_HORIZONTAL_PADDING,
            ),
          ),
          Container(
            child: ChatContentListItem(
              mode: ChatContentListItem.MESSAGE_RIGHT,
              image: AssetImage(HEADER_LOGO_PATH),
              content: 'test',
            ),
            padding: const EdgeInsets.symmetric(
              vertical: CHAT_CONTENT_ITEM_VERTICAL_PADDING,
              horizontal: CHAT_CONTENT_ITEM_HORIZONTAL_PADDING,
            ),
          ),
          Container(
            child: ChatContentListItem(
              mode: ChatContentListItem.MESSAGE_RIGHT,
              image: AssetImage(HEADER_LOGO_PATH),
              content: 'test',
            ),
            padding: const EdgeInsets.symmetric(
              vertical: CHAT_CONTENT_ITEM_VERTICAL_PADDING,
              horizontal: CHAT_CONTENT_ITEM_HORIZONTAL_PADDING,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Colors.black12,
          ),
        ),
        color: Colors.white,
      ),
    );
  }
}