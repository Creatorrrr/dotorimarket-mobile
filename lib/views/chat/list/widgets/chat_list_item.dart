import 'package:dotorimarket/views/chat/list/widgets/chat_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ChatListItem extends StatelessWidget {
  static const String THUMBNAIL_PATH = 'assets/images/dotori-grid-item.png';
  static const double HEIGHT_DEFAULT = 70.0;
  static const double PROFILE_IMAGE_RADIUS = 30.0;
  static const double ACTION_EXTENT_RATIO = 0.25;
  static const double NICK_NAME_FONT_SIZE = 16.0;
  static const double TIME_FONT_SIZE = 12.0;
  static const double TIME_LEFT_PADDING = 10.0;
  static const double DESCRIPTION_FONT_SIZE = 14.0;
  static const double DESCRIPTION_TOP_PADDING = 5.0;
  static const double TEXT_AREA_LEFT_PADDING = 10.0;
  static const String DELETE_ACTION_BUTTON_TEXT = '삭제';

  final String nickName;
  final String description;
  final String time;
  final double height;
  final Function onPressed;

  ChatListItem({
    Key key,
    @required this.nickName,
    @required this.description,
    @required this.time,
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
                child: ChatProfileImage(
                  image: AssetImage(
                    THUMBNAIL_PATH,
                  ),
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
                              child: Text(time,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: TIME_FONT_SIZE,
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
                        child: Text(description,
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