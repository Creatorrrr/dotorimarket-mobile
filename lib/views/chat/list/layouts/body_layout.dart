import 'package:dotorimarket/constants/color_constant.dart';
import 'package:dotorimarket/views/chat/content/chat_content_page.dart';
import 'package:dotorimarket/views/chat/list/widgets/chat_list_item.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {
  static const double ITEM_BOTTOM_BORDER_WIDTH = 1.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            child: ChatListItem(
              nickName: '도토리',
              description: '안녕하세요! 아이패드 사고 싶어요!',
              time: '7월 15일 17시',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (context) {
                    return ChatContentPage();
                  }
                ));
              },
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 15.0,
            ),
            decoration: const BoxDecoration(
              border: const Border(
                bottom: const BorderSide(
                  width: ITEM_BOTTOM_BORDER_WIDTH,
                  color: ColorConstant.BACKGROUND_GREY,
                ),
              ),
            ),
          ),
          Container(
            child: ChatListItem(
              nickName: '도토리',
              description: '안녕하세요! 아이패드 사고 싶어요!',
              time: '7월 15일 17시',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (context) {
                    return ChatContentPage();
                  }
                ));
              },
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 15.0,
            ),
            decoration: const BoxDecoration(
              border: const Border(
                bottom: const BorderSide(
                  width: ITEM_BOTTOM_BORDER_WIDTH,
                  color: ColorConstant.BACKGROUND_GREY,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}