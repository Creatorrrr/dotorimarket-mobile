import 'package:dotorimarket/views/chat/list/widgets/chat_profile_image.dart';
import 'package:flutter/material.dart';

class ChatListItem extends StatelessWidget {
  static const String THUMBNAIL_PATH = 'assets/dotori-grid-item.png';
  static const double HEIGHT_DEFAULT = 70.0;
  static const double PROFILE_IMAGE_RADIUS = 30.0;

  final String nickName;
  final String description;
  final String place;
  final String time;
  final double height;
  final Function onPressed;

  ChatListItem({
    Key key,
    @required this.nickName,
    @required this.description,
    @required this.place,
    @required this.time,
    this.height = HEIGHT_DEFAULT,
    @required this.onPressed,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
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
                        children: [
                          Container(
                            child: Text(
                              this.nickName,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  this.place,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                Text(' | '),
                                Text(
                                  this.time,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.only(
                              left: 10.0,
                            ),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                    Container(
                      child: Text(
                        this.description,
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(
                        top: 5.0,
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                padding: const EdgeInsets.only(
                  left: 10.0,
                ),
              ),
            ),
          ],
        ),
        height: this.height,
      ),
      onPressed: this.onPressed,

    );
  }
}