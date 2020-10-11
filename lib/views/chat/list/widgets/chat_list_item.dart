import 'package:dotorimarket/constants/color_constant.dart';
import 'package:dotorimarket/views/common/widgets/circle_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class ChatListItem extends StatelessWidget {
  static const String DEFAULT_PROFILE_IMAGE_PATH = 'assets/images/default-profile.png';

  static const double HEIGHT_DEFAULT = 70.0;
  static const double PROFILE_IMAGE_RADIUS = 30.0;
  static const ImageProvider DEFAULT_PROFILE_IMAGE = AssetImage(DEFAULT_PROFILE_IMAGE_PATH);
  static const double ACTION_EXTENT_RATIO = 0.25;
  static const double NICK_NAME_FONT_SIZE = 16.0;
  static const double TIME_FONT_SIZE = 12.0;
  static const double TIME_LEFT_PADDING = 10.0;
  static const double DESCRIPTION_FONT_SIZE = 14.0;
  static const double DESCRIPTION_TOP_PADDING = 5.0;
  static const double TEXT_AREA_LEFT_PADDING = 10.0;

  static const String DELETE_ACTION_BUTTON_TEXT = '삭제';
  static const String TIME_FORMAT = 'yyyy년 MM월 dd일';

  final String nickName;
  final String title;
  final DateTime createdAt;
  final double height;
  final Function onPressed;

  ChatListItem({
    Key key,
    @required this.nickName,
    @required this.title,
    @required this.createdAt,
    this.height = HEIGHT_DEFAULT,
    @required this.onPressed,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: ACTION_EXTENT_RATIO,
      child: InkWell(
        child: Container(
          child: Row(
            children: <Widget>[
              Container(
                child: CircleImage(
                  image: DEFAULT_PROFILE_IMAGE,
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
                              child: Text(DateFormat(TIME_FORMAT).format(createdAt),
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
                        child: Text(title,
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
          height: this.height,
        ),
        onTap: this.onPressed,
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: DELETE_ACTION_BUTTON_TEXT,
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => print(DELETE_ACTION_BUTTON_TEXT),
        ),
      ],
    );
  }
}