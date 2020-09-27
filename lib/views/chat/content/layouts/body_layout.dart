import 'package:dotorimarket/constants/color_constant.dart';
import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/chat/content/layouts/deal_profile_layout.dart';
import 'package:dotorimarket/views/chat/content/widgets/chat_content_list_left_item.dart';
import 'package:dotorimarket/views/chat/content/widgets/chat_content_list_right_item.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {
  static const String THUMBNAIL_PATH = 'assets/images/dotori-grid-item.png';

  static const double DEAL_PROFILE_VERTICAL_PADDING = 15.0;
  static const double DEAL_PROFILE_HORIZONTAL_PADDING = 15.0;
  static const double DIVIDER_HEIGHT = 0.0;
  static const double CHAT_CONTENT_ITEM_VERTICAL_PADDING = 10.0;
  static const double CHAT_CONTENT_ITEM_HORIZONTAL_PADDING = 15.0;

  final int dealId;

  BodyLayout({
    Key key,
    @required this.dealId,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    final DealViewModel dealViewModel = ViewModelProvider.of<DealViewModel>(context);

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: CheckedFutureBuilder(
              future: dealViewModel.getDealOne(dealId, context),
              builder: (BuildContext context, AsyncSnapshot<DealDto> snapshot) {
                // 위젯 리스트 그리기
                return DealProfileLayout(
                  image: Image.asset(THUMBNAIL_PATH,
                    fit: BoxFit.cover,
                  ),
                  status: '거래중',
                  name: snapshot.data.title,
                  price: snapshot.data.price,
                );
              },
            ),
            padding: const EdgeInsets.symmetric(
              vertical: DEAL_PROFILE_VERTICAL_PADDING,
              horizontal: DEAL_PROFILE_HORIZONTAL_PADDING,
            ),
          ),
          Divider(
            height: DIVIDER_HEIGHT,
            color: ColorConstant.BACKGROUND_GREY,
          ),
          Container(
            child: Column(
              children: [
                Container(
                  child: ChatContentListRightItem(
                    text: 'test\nasfgasdfasdf\nsfda',
                    time: '16:23',
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: CHAT_CONTENT_ITEM_VERTICAL_PADDING,
                  ),
                ),
                Container(
                  child: ChatContentListLeftItem(
                    text: 'test',
                    time: '16:23',
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: CHAT_CONTENT_ITEM_VERTICAL_PADDING,
                  ),
                ),
                Container(
                  child: ChatContentListRightItem(
                    text: 'test',
                    time: '16:23',
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: CHAT_CONTENT_ITEM_VERTICAL_PADDING,
                  ),
                ),
                Container(
                  child: ChatContentListLeftItem(
                    text: 'test',
                    time: '16:23',
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: CHAT_CONTENT_ITEM_VERTICAL_PADDING,
                  ),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: CHAT_CONTENT_ITEM_HORIZONTAL_PADDING,
            ),
          )
        ],
      ),
    );
  }
}