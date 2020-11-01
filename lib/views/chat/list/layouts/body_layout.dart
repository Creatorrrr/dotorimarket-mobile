import 'package:dotorimarket/constants/color_constant.dart';
import 'package:dotorimarket/dtos/account/account_dto.dart';
import 'package:dotorimarket/dtos/chat/chat_dto.dart';
import 'package:dotorimarket/views/chat/list/widgets/chat_list_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BodyLayout extends StatelessWidget {
  static const double ITEM_BOTTOM_BORDER_WIDTH = 1.0;

  final List<ChatDto> chatList;
  final SharedPreferences prefs;
  final void Function(int index) onPressed;
  final void Function(int index) onDeletePressed;

  BodyLayout(this.chatList, this.prefs, {
    Key key,
    @required this.onPressed,
    @required this.onDeletePressed,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          String userId = prefs.getString('id');
          AccountDto nickNameAccount = chatList[index].members.firstWhere((member) => member.id != userId);
          String nickName;
          if (nickNameAccount.id == chatList[index].deal.seller.id) nickName = chatList[index].deal.sellerName;
          else nickName = nickNameAccount.name;
            return Container(
            child: ChatListItem(chatList[index], prefs,
              onPressed: () {
                onPressed(index);
              },
              onDeletePressed: () {
                onDeletePressed(index);
              },
            ),
            decoration: const BoxDecoration(
              border: const Border(
                bottom: const BorderSide(
                  width: ITEM_BOTTOM_BORDER_WIDTH,
                  color: ColorConstant.BACKGROUND_GREY,
                ),
              ),
            ),
          );
        },
        itemCount: chatList.length,
      ),
    );
  }
}