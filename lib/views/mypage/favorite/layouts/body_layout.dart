import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/mypage/favorite/widgets/favorite_list_item.dart';
import 'package:dotorimarket/views/deal/detail/deal_detail_page.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {
  final List<DealDto> dealList;
  final void Function(int index) onItemPressed;
  final void Function(bool favorite, int index) onFavoritePressed;

  BodyLayout(this.dealList, {
    Key key,
    @required this.onItemPressed,
    @required this.onFavoritePressed,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    final DealViewModel dealViewModel = ViewModelProvider.of<DealViewModel>(context);

    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => FavoriteListItem(dealList[index],
          onItemPressed: () {
            onItemPressed(index);
          },
          onFavoritePressed: (bool favorite) {
            onFavoritePressed(favorite, index);
          },
        ),
        itemCount: dealList.length,
      ),
    );
  }
}