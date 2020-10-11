import 'package:dotorimarket/viewmodels/chat_view_model.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/chat/content/layouts/footer_layout.dart';
import 'package:dotorimarket/views/chat/content/layouts/header_layout.dart';
import 'package:dotorimarket/views/chat/content/layouts/body_layout.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:flutter/material.dart';

class ChatContentPage extends StatelessWidget {
  static const String HEADER_LOGO_PATH = 'assets/images/dotori-logo.png';
  static const double HEADER_TOP_HEIGHT = 50.0;
  static const double TAB_BOTTOM_HEIGHT = 50.0;

  final TextEditingController controller = TextEditingController();

  final String chatId;

  ChatContentPage({
    Key key,
    this.chatId,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      child: Scaffold(
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
                          text: '닉네임',
                        ),
                      ),
                      Positioned(
                        top: HEADER_TOP_HEIGHT,
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: BodyLayout(
                          dealId: 1,
                          chatId: chatId,
                        ),
                      ),
                      Positioned(
                        height: TAB_BOTTOM_HEIGHT,
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: FooterLayout(
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
        backgroundColor: Colors.white,
      ),
      viewModels: [
        DealViewModel(),
        ChatViewModel(),
      ]
    );
  }
}