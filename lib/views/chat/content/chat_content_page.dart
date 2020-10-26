import 'package:dotorimarket/dtos/chat/chat_content_dto.dart';
import 'package:dotorimarket/dtos/chat/chat_dto.dart';
import 'package:dotorimarket/viewmodels/chat_view_model.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/chat/content/layouts/footer_layout.dart';
import 'package:dotorimarket/views/chat/content/layouts/header_layout.dart';
import 'package:dotorimarket/views/chat/content/layouts/body_layout.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatContentPage extends StatelessWidget {
  static const String HEADER_LOGO_PATH = 'assets/images/dotori-logo.png';
  static const double HEADER_TOP_HEIGHT = 50.0;

  final String chatId;

  ChatContentPage(this.chatId, {
    Key key,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      child: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            final ChatViewModel chatViewModel = ViewModelProvider.of<ChatViewModel>(context);

            return CheckedFutureBuilder(
              future: Future.wait([
                SharedPreferences.getInstance(),
                chatViewModel.getChatOne(this.chatId, context),
              ]),
              builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
                SharedPreferences prefs = snapshot.data[0];
                ChatDto chat = snapshot.data[1];

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
                            child: HeaderLayout(chat,
                              height: HEADER_TOP_HEIGHT,
                            ),
                          ),
                          Positioned(
                            top: HEADER_TOP_HEIGHT,
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: BodyLayout(chat, prefs),
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