import 'package:dotorimarket/constants/color_constant.dart';
import 'package:dotorimarket/dtos/chat/chat_dto.dart';
import 'package:dotorimarket/viewmodels/chat_view_model.dart';
import 'package:dotorimarket/views/chat/content/chat_content_page.dart';
import 'package:dotorimarket/views/chat/list/widgets/chat_list_item.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {
  static const double ITEM_BOTTOM_BORDER_WIDTH = 1.0;

  @override
  Widget build(BuildContext context) {
    final ChatViewModel chatViewModel = ViewModelProvider.of<ChatViewModel>(context);
    
    return Container(
      child: CheckedFutureBuilder(
        future: chatViewModel.getChatList('', '', '', '', '', context),
        builder: (BuildContext context, AsyncSnapshot<List<ChatDto>> snapshot) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: ChatListItem(
                  nickName: '도토리',
                  title: snapshot.data[index].title,
                  createdAt: snapshot.data[index].createdAt,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return ChatContentPage(snapshot.data[index].id);
                      }
                    ));
                  },
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 15.0,
                ),
                decoration: const BoxDecoration(
                  border: const Border(
                    bottom: const BorderSide(
                      width: ITEM_BOTTOM_BORDER_WIDTH,
                      color: ColorConstant.BACKGROUND_GREY,
                    ),
                  ),
                ),
              );
            },
            itemCount: snapshot.data.length,
          );
        },
      ),
    );
  }
}