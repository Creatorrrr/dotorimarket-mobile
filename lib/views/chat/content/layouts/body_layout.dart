import 'package:dotorimarket/constants/color_constant.dart';
import 'package:dotorimarket/dtos/chat/chat_content_dto.dart';
import 'package:dotorimarket/dtos/chat/chat_dto.dart';
import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:dotorimarket/viewmodels/chat_view_model.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/chat/content/layouts/deal_profile_layout.dart';
import 'package:dotorimarket/views/chat/content/widgets/chat_content_list_left_item.dart';
import 'package:dotorimarket/views/chat/content/widgets/chat_content_list_right_item.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BodyLayout extends StatelessWidget {
  static const String THUMBNAIL_PATH = 'assets/images/dotori-grid-item.png';

  static const double DEAL_PROFILE_VERTICAL_PADDING = 15.0;
  static const double DEAL_PROFILE_HORIZONTAL_PADDING = 15.0;
  static const double DIVIDER_HEIGHT = 0.0;
  static const double CHAT_CONTENT_ITEM_VERTICAL_PADDING = 10.0;
  static const double CHAT_CONTENT_ITEM_HORIZONTAL_PADDING = 15.0;

  final String dealId;
  final String chatId;

  BodyLayout({
    Key key,
    @required this.dealId,
    @required this.chatId,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    final DealViewModel dealViewModel = ViewModelProvider.of<DealViewModel>(context);
    final ChatViewModel chatViewModel = ViewModelProvider.of<ChatViewModel>(context);

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: CheckedFutureBuilder(
              future: dealViewModel.getDealOne(dealId, context),
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
                future: SharedPreferences.getInstance(),
                builder: (BuildContext context, AsyncSnapshot<SharedPreferences> prefsSnapshot) {
                  return CheckedFutureBuilder(
                    future: chatViewModel.getChatContentList(chatId, '', '', '', '', '', context),
                    builder: (BuildContext context, AsyncSnapshot<List<ChatContentDto>> chatContentDtoListSnapshot) {
                      return ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          String prefAccountId = prefsSnapshot.data.getString('id');
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
        ],
      ),
    );
  }
}