import 'package:dotorimarket/dtos/chat/chat_post_dto.dart';
import 'package:dotorimarket/viewmodels/chat_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/deal/detail/widgets/chat_button.dart';
import 'package:flutter/material.dart';

class FooterLayout extends StatefulWidget {
  static const double HEIGHT_DEFAULT = 70.0;

  final double height;

  FooterLayout({
    Key key,
    this.height = HEIGHT_DEFAULT,
  }):super(key: key);

  @override
  State<StatefulWidget> createState() => _FooterLayoutState();
}

class _FooterLayoutState extends State<FooterLayout> {
  static const double PADDING_DEFAULT = 10.0;
  static const double CHAT_BUTTON_LEFT_PADDING = 5.0;

  double height;

  bool favorite;

  /// state 초기화
  void _init() {
    height = widget.height;
    favorite = false;
  }

  @override
  void initState() {
    _init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ChatViewModel chatViewModel = ViewModelProvider.of<ChatViewModel>(context);

    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: IconButton(
              icon: Icon(Icons.favorite,
                color: favorite ? Colors.red : Colors.black,
              ),
              onPressed: () {
                setState(() {
                  favorite = !favorite;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              child: ChatButton(
                onPressed: () {
                  // TODO 채팅이 생성되지 않았을 경우 생성 후 이동
                  ChatPostDto chatPostDto = ChatPostDto(
                    title: '거래제목',
                    deal: '거래아이디',
                    members: ['본인', '상대방'],
                  );
                  chatViewModel.postChat(chatPostDto, context);
                  // TODO 채팅이 생성되어 있을 경우 바로 이동
                },
              ),
              padding: const EdgeInsets.only(
                left: CHAT_BUTTON_LEFT_PADDING,
              ),
            ),
          ),
        ],
      ),
      height: this.height,
      padding: const EdgeInsets.all(PADDING_DEFAULT),
    );
  }
}