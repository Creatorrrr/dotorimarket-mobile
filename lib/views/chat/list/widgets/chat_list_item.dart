import 'package:dotorimarket/configs/http_config.dart';
import 'package:dotorimarket/constants/color_constant.dart';
import 'package:dotorimarket/dtos/account/account_dto.dart';
import 'package:dotorimarket/dtos/chat/chat_dto.dart';
import 'package:dotorimarket/utils/string_util.dart';
import 'package:dotorimarket/views/common/widgets/circle_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatListItem extends StatelessWidget {
  static const String DEFAULT_PROFILE_IMAGE_PATH = 'assets/images/default-profile.png';

  static const double PROFILE_IMAGE_RADIUS = 30.0;
  static const ImageProvider DEFAULT_PROFILE_IMAGE = AssetImage(DEFAULT_PROFILE_IMAGE_PATH);
  static const double ACTION_EXTENT_RATIO = 0.25;
  static const double NICK_NAME_FONT_SIZE = 16.0;
  static const double TIME_FONT_SIZE = 12.0;
  static const double TIME_LEFT_PADDING = 10.0;
  static const double DESCRIPTION_FONT_SIZE = 14.0;
  static const double DESCRIPTION_TOP_PADDING = 5.0;
  static const double TEXT_AREA_LEFT_PADDING = 10.0;
  static const double ITEM_VERTICAL_PADDING = 10.0;
  static const double ITEM_HORIZONTAL_PADDING = 15.0;

  static const String DELETE_ACTION_BUTTON_TEXT = '삭제';
  static const String TIME_FORMAT = 'yyyy년 MM월 dd일';

  final ChatDto chat;
  final SharedPreferences prefs;
  final void Function() onPressed;
  final void Function() onDeletePressed;

  ChatListItem(this.chat, this.prefs, {
    Key key,
    @required this.onPressed,
    @required this.onDeletePressed,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    String userId = prefs.getString('id');
    String img = prefs.getString('img');

    // 내가 판매자일 경우 상대방의 현재 닉네임
    // 내가 판매자가 아닐 경우 상대방의 당시 닉네

    AccountDto member = chat.members.firstWhere((member) => member.id != userId);

    String nickName;
    if (chat.deal.seller.id == userId) nickName = member.name;
    else nickName = chat.deal.sellerName;

    String imagePath;
    if (chat.deal.seller.id == userId) imagePath = member.img?.filename;
    else imagePath = chat.deal.seller.img?.filename;

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: ACTION_EXTENT_RATIO,
      child: InkWell(
        child: Container(
          child: Row(
            children: <Widget>[
              Container(
                child: CircleImage(
                  image: StringUtil.isNotEmpty(imagePath) ? NetworkImage('${HttpConfig.URL_FILE_PREFIX}/${imagePath}') : DEFAULT_PROFILE_IMAGE,
                  radius: PROFILE_IMAGE_RADIUS,
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Text(nickName,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: NICK_NAME_FONT_SIZE,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(DateFormat(TIME_FORMAT).format(chat.createdAt),
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: TIME_FONT_SIZE,
                                  color: ColorConstant.TEXT_LIGHT_GREY,
                                ),
                              ),
                              padding: const EdgeInsets.only(
                                left: TIME_LEFT_PADDING,
                              ),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                        ),
                      ),
                      Container(
                        child: Text(chat.title,
                          style: const TextStyle(
                            fontSize: DESCRIPTION_FONT_SIZE,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(
                          top: DESCRIPTION_TOP_PADDING,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  padding: const EdgeInsets.only(
                    left: TEXT_AREA_LEFT_PADDING,
                  ),
                ),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(
            vertical: ITEM_VERTICAL_PADDING,
            horizontal: ITEM_HORIZONTAL_PADDING,
          ),
        ),
        onTap: onPressed,
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: DELETE_ACTION_BUTTON_TEXT,
          color: Colors.red,
          icon: Icons.delete,
          onTap: onDeletePressed,
        ),
      ],
    );
  }
}