import 'package:flutter/material.dart';

class ChatButton extends StatelessWidget {
  static const double CHAT_BUTTON_HEIGHT = 40.0;
  static const double CHAT_BUTTON_BORDER_RADIUS = 5.0;

  static const Color BUTTON_BACKGROUND_COLOR = Color.fromRGBO(250, 187, 65, 1.0);

  static const String CHAT_BUTTON_TEXT = '채팅으로 거래하기';

  final Function onPressed;

  ChatButton({
    Key key,
    @required this.onPressed,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: const Text(CHAT_BUTTON_TEXT,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        decoration: BoxDecoration(
          color: BUTTON_BACKGROUND_COLOR,
          borderRadius: BorderRadius.circular(CHAT_BUTTON_BORDER_RADIUS),
        ),
        alignment: Alignment.center,
      ),
      onTap: this.onPressed,
    );
  }
}