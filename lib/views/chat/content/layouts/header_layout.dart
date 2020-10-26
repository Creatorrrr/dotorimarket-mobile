import 'dart:convert';
import 'dart:io';

import 'package:dotorimarket/constants/color_constant.dart';
import 'package:dotorimarket/dtos/chat/chat_dto.dart';
import 'package:dotorimarket/viewmodels/chat_view_model.dart';
import 'package:dotorimarket/views/chat/list/chat_list_page.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/common/widgets/header_icon_button.dart';
import 'package:dotorimarket/views/common/widgets/header_title_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Response;

class HeaderLayout extends StatelessWidget {
  static const int DELETE_CHAT = 4;

  static const double HEIGHT_DEFAULT = 50.0;
  static const double HEADER_TITLE_LEFT_PADDING = 15.0;
  static const double HEADER_BOTTOM_BORDER_WIDTH = 1.0;

  static const String DELETE_DIALOG_TEXT = '삭제하시겠습니까?';
  static const String CANCEL_TEXT = '취소';
  static const String DELETE_TEXT = '삭제하기';
  static const String DELETE_FAIL_TEXT = '삭제 실패';

  final double height;
  final ChatDto chat;

  HeaderLayout(this.chat, {
    Key key,
    this.height = HEIGHT_DEFAULT,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatViewModel chatViewModel = ViewModelProvider.of<ChatViewModel>(context);

    return Container(
      child: Stack(
        children: [
          Positioned(
            child: Row(
              children: [
                Container(
                  child: HeaderIconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      if (Navigator.of(context).canPop()) {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ),
                Container(
                  child: HeaderTitleText(chat.deal.sellerName),
                  alignment: Alignment.centerLeft,
                ),
              ],
            ),
          ),
          Positioned(
            child: Row(
              children: [
                Container(
                  child: PopupMenuButton(
                    icon: Icon(Icons.more_horiz),
                    onSelected: (int value) async {
                      switch(value) {
                        case DELETE_CHAT:
                          await showDialog(
                              context: context,
                              builder: (BuildContext dialogContext) {
                                return AlertDialog(
                                  title: Text(DELETE_DIALOG_TEXT),
                                  actions: [
                                    FlatButton(
                                      child: Text(CANCEL_TEXT),
                                      onPressed: () {
                                        Navigator.pop(dialogContext);
                                      },
                                    ),
                                    FlatButton(
                                      child: Text(DELETE_TEXT),
                                      onPressed: () async {
                                        Response res = await chatViewModel.deleteChat(chat.id, context);
                                        if (res.statusCode == HttpStatus.ok) {
                                          Navigator.pushReplacement(context, PageRouteBuilder(
                                            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation)
                                            => ChatListPage(),
                                          ));
                                        } else {
                                          Scaffold.of(context).removeCurrentSnackBar();
                                          Scaffold.of(context).showSnackBar(SnackBar(content: Text(DELETE_FAIL_TEXT)));
                                        }
                                      },
                                    ),
                                  ],
                                );
                              }
                          );
                          break;
                        default:
                      }
                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
                      const PopupMenuItem(
                        value: 1,
                        child: Text('신고하기'),
                      ),
                      const PopupMenuItem(
                        value: 2,
                        child: Text('알림끄기'),
                      ),
                      const PopupMenuItem(
                        value: 3,
                        child: Text('중요 채팅방으로 표시'),
                      ),
                      const PopupMenuItem(
                        value: 4,
                        child: Text('채팅방 나가기'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            top: 0.0,
            bottom: 0.0,
            right: 0.0,
          ),
        ],
      ),
      height: height,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: HEADER_BOTTOM_BORDER_WIDTH,
            color: ColorConstant.BACKGROUND_GREY,
          ),
        ),
      ),
    );
  }
}
