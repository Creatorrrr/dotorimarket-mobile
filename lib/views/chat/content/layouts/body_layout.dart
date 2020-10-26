import 'dart:async';
import 'dart:convert';

import 'package:dotorimarket/configs/http_config.dart';
import 'package:dotorimarket/constants/color_constant.dart';
import 'package:dotorimarket/dtos/chat/chat_content_dto.dart';
import 'package:dotorimarket/dtos/chat/chat_dto.dart';
import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:dotorimarket/utils/string_util.dart';
import 'package:dotorimarket/viewmodels/chat_view_model.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/chat/content/layouts/deal_profile_layout.dart';
import 'package:dotorimarket/views/chat/content/widgets/chat_content_input_text_field.dart';
import 'package:dotorimarket/views/chat/content/widgets/chat_content_list_left_item.dart';
import 'package:dotorimarket/views/chat/content/widgets/chat_content_list_right_item.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:dotorimarket/views/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class BodyLayout extends StatefulWidget {
  final ChatDto chat;
  final SharedPreferences prefs;

  BodyLayout(this.chat, this.prefs, {
    Key key,
  }):super(key: key);

  @override
  State<StatefulWidget> createState() => _BodyLayoutState();
}

class _BodyLayoutState extends State<BodyLayout> {
  static const String THUMBNAIL_PATH = 'assets/images/dotori-grid-item.png';

  static const double DEAL_PROFILE_VERTICAL_PADDING = 15.0;
  static const double DEAL_PROFILE_HORIZONTAL_PADDING = 15.0;
  static const double DIVIDER_HEIGHT = 0.0;
  static const double CHAT_CONTENT_ITEM_VERTICAL_PADDING = 10.0;
  static const double CHAT_CONTENT_ITEM_HORIZONTAL_PADDING = 15.0;
  static const double CHAT_SEND_HEIGHT = 50.0;

  static const String CHAT_CONTENT_SOCKET_EVENT = 'content';

  IO.Socket socket;
  final StreamController<ChatContentDto> _socketStreamController = StreamController();
  final TextEditingController _chatContentInputController = TextEditingController();

  @override
  void initState() {
    String token = widget.prefs.getString('token');
    socket = IO.io('${HttpConfig.URL_WEB_SOCKET_PREFIX}/chat', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'extraHeaders': {'authorization': token},
      'query': { 'chatId': widget.chat.id},
    });
    socket.connect();
    socket.on(CHAT_CONTENT_SOCKET_EVENT, (data) {
      ChatContentDto chatContentDto = ChatContentDto.fromJson(data);
      _socketStreamController.sink.add(chatContentDto);
    });
    socket.on('error', (data) {
      Navigator.pushReplacement(context, PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation)
        => LoginPage(
          showUpdateMessage: true,
        ),
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DealViewModel dealViewModel = ViewModelProvider.of<DealViewModel>(context);
    final ChatViewModel chatViewModel = ViewModelProvider.of<ChatViewModel>(context);

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: CheckedFutureBuilder(
              future: dealViewModel.getDealOne(widget.chat.deal.id, context),
              builder: (BuildContext context, AsyncSnapshot<DealDto> snapshot) {
                // 위젯 리스트 그리기
                return DealProfileLayout(
                  image: Image.asset(THUMBNAIL_PATH,
                    fit: BoxFit.cover,
                  ),
                  status: '거래중',
                  name: snapshot.data.title,
                  price: snapshot.data.price,
                );
              },
            ),
            padding: const EdgeInsets.symmetric(
              vertical: DEAL_PROFILE_VERTICAL_PADDING,
              horizontal: DEAL_PROFILE_HORIZONTAL_PADDING,
            ),
          ),
          Divider(
            height: DIVIDER_HEIGHT,
            color: ColorConstant.BACKGROUND_GREY,
          ),
          Expanded(
            child: Container(
              child: CheckedFutureBuilder(
                future: chatViewModel.getChatContentList(widget.chat.id, '', '', '', '{"createdAt": "desc"}', '', context),
                builder: (BuildContext context, AsyncSnapshot<List<ChatContentDto>> chatContentDtoListSnapshot) {
                  return StreamBuilder(
                    stream: _socketStreamController.stream,
                    builder: (BuildContext context, AsyncSnapshot<ChatContentDto> chatContentDtoSnapshot) {
                      if (chatContentDtoSnapshot.data != null) {
                        bool isExist = chatContentDtoListSnapshot.data.any((element) => element.id == chatContentDtoSnapshot.data.id);
                        if (!isExist) chatContentDtoListSnapshot.data.insert(0, chatContentDtoSnapshot.data);
                      }

                      return ListView.builder(
                        reverse: true,
                        itemBuilder: (BuildContext context, int index) {
                          String prefAccountId = widget.prefs.getString('id');
                          String chatContentAccountId = chatContentDtoListSnapshot.data[index].account.id;

                          return prefAccountId == chatContentAccountId
                              ? Container(
                            child: ChatContentListRightItem(
                              text: chatContentDtoListSnapshot.data[index].content,
                              time: chatContentDtoListSnapshot.data[index].createdAt,
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: CHAT_CONTENT_ITEM_VERTICAL_PADDING,
                            ),
                          )
                              : Container(
                            child: ChatContentListLeftItem(
                              text: chatContentDtoListSnapshot.data[index].content,
                              time: chatContentDtoListSnapshot.data[index].createdAt,
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: CHAT_CONTENT_ITEM_VERTICAL_PADDING,
                            ),
                          );
                        },
                        itemCount: chatContentDtoListSnapshot.data.length,
                      );
                    },
                  );
                },
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: CHAT_CONTENT_ITEM_HORIZONTAL_PADDING,
              ),
            ),
          ),
          Divider(
            height: DIVIDER_HEIGHT,
            color: ColorConstant.BACKGROUND_GREY,
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                    ),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ChatContentInputTextField(
                      controller: this._chatContentInputController,
                    ),
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      if (StringUtil.isNotEmpty(_chatContentInputController.text)) {
                        socket.emit(CHAT_CONTENT_SOCKET_EVENT, _chatContentInputController.text);
                        _chatContentInputController.text = '';
                      }
                    },
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            height: CHAT_SEND_HEIGHT,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _socketStreamController.close();
    socket.dispose();
    super.dispose();
  }
}