import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:dotorimarket/views/mypage/favorite/widgets/favorite_list_item.dart';
import 'package:dotorimarket/views/deal/detail/deal_detail_page.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {

  final List<DealDto> deals = [];

  @override
  Widget build(BuildContext context) {
    final DealViewModel dealViewModel = ViewModelProvider.of<DealViewModel>(context);

    return Container(
      child: CheckedFutureBuilder(
        future: dealViewModel.getDealList("", "", "", "", "", context),
        builder: (BuildContext context, AsyncSnapshot<List<DealDto>> snapshot) {
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) => FavoriteListItem(
              title: snapshot.data[index].title,
              price: snapshot.data[index].price,
              onItemPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                    builder: (context) {
                      return DealDetailPage(
                        dealId: snapshot.data[index].id,
                      );
                    }
                ));
              },
              onFavoritePressed: (bool favorite) {
                Scaffold.of(context).removeCurrentSnackBar();
                Scaffold.of(context).showSnackBar(SnackBar(content: Text('좋아요!')));
              },
            ),
            separatorBuilder: (BuildContext context, int index) => Divider(),
            padding: const EdgeInsets.all(10.0),
            itemCount: snapshot.data.length,
          );
        },
      ),
    );
  }
}