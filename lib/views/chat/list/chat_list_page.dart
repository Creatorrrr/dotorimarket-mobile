
import 'dart:convert';
import 'dart:io';

import 'package:dotorimarket/dtos/chat/chat_dto.dart';
import 'package:dotorimarket/viewmodels/chat_view_model.dart';
import 'package:dotorimarket/views/common/widgets/common_alert_dialog.dart';
import 'package:dotorimarket/views/chat/content/chat_content_page.dart';
import 'package:dotorimarket/views/chat/list/layouts/body_layout.dart';
import 'package:dotorimarket/views/chat/list/layouts/header_layout.dart';
import 'package:dotorimarket/views/common/menu_layout.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatListPage extends StatelessWidget {
  static const String HEADER_LOGO_PATH = 'assets/images/dotori-logo.png';
  static const double HEADER_TOP_HEIGHT = 50.0;
  static const double TAB_BOTTOM_HEIGHT = 50.0;

  static const String DELETE_DIALOG_TEXT = '삭제하시겠습니까?';
  static const String CANCEL_TEXT = '취소';
  static const String DELETE_TEXT = '삭제하기';
  static const String DELETE_FAIL_TEXT = '삭제 실패';

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      child: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            final ChatViewModel chatViewModel = ViewModelProvider.of<ChatViewModel>(context);

            String orders = jsonEncode({
              'createdAt': 'desc',
            });

            return CheckedFutureBuilder(
              future: Future.wait([
                SharedPreferences.getInstance(),
                chatViewModel.getChatList('', '', '', orders, '', context),
              ]),
              builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
                SharedPreferences prefs = snapshot.data[0];
                List<ChatDto> chatList = snapshot.data[1];

                return SafeArea(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          height: HEADER_TOP_HEIGHT,
                          top: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: HeaderLayout(
                            height: HEADER_TOP_HEIGHT,
                          ),
                        ),
                        Positioned(
                          top: HEADER_TOP_HEIGHT,
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: BodyLayout(chatList, prefs,
                            onPressed: (int index) {
                              Navigator.push(context, MaterialPageRoute<void>(
                                builder: (BuildContext context) {
                                  return ChatContentPage(chatList[index].id);
                                }
                              ));
                            },
                            onDeletePressed: (int index) async {
                              CommonAlertDialog.openDialog(context,
                                title: DELETE_DIALOG_TEXT,
                                cancelText: CANCEL_TEXT,
                                okText: DELETE_TEXT,
                                onOk: () async {
                                  Response res = await chatViewModel.deleteChat(chatList[index].id, context);
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
                              );
                            },
                          ),
                        ),
                        Positioned(
                          height: TAB_BOTTOM_HEIGHT,
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: MenuLayout(
                            height: TAB_BOTTOM_HEIGHT,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
        backgroundColor: Colors.white,
      ),
      viewModels: [
        ChatViewModel(),
      ],
    );
  }
}