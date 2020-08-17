import 'package:dotorimarket/views/chat/chat_input_layout.dart';
import 'package:dotorimarket/views/chat/header_layout.dart';
import 'package:dotorimarket/views/chat/body_layout.dart';
import 'package:flutter/material.dart';

class ChatContentPage extends StatelessWidget {
  static const String HEADER_LOGO_PATH = 'assets/dotori-logo.png';
  static const double HEADER_TOP_HEIGHT = 50.0;
  static const double TAB_BOTTOM_HEIGHT = 50.0;

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return SafeArea(
            child: GestureDetector(
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
                        logoPath: HEADER_LOGO_PATH,
                      ),
                    ),
                    Positioned(
                      top: HEADER_TOP_HEIGHT,
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: BodyLayout(),
                    ),
                    Positioned(
                      height: TAB_BOTTOM_HEIGHT,
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: ChatInputLayout(
                        height: TAB_BOTTOM_HEIGHT,
                        controller: controller,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                FocusScope.of(context).unfocus();
              },
            ),
          );
        },
      ),
    );
  }
}