import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/mypage/favorite/widgets/favorite_list_item.dart';
import 'package:dotorimarket/views/good/detail/deal_detail_page.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {

  final List<DealDto> deals = [];

  @override
  Widget build(BuildContext context) {
    final DealViewModel dealViewModel = ViewModelProvider.of<DealViewModel>(context);

    return Container(
      child: FutureBuilder(
        future: dealViewModel.getDealList("", "", "", "", "", context),
        builder: (BuildContext context, AsyncSnapshot<List<DealDto>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Text('Awaiting result...'),
              );
            case ConnectionState.waiting:
            case ConnectionState.active:
            case ConnectionState.done:
            // 에러 발생 시 에러메시지 표시
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }

              // 데이터가 존재할 경우에만 세팅
              if (snapshot.data != null && snapshot.data.length > 0) {
                deals.clear();
                deals.addAll(snapshot.data);
              }

              // 관심상품 리스트 그리기
              return ListView.separated(
                itemBuilder: (BuildContext context, int index) => FavoriteListItem(
                  title: deals[index].title,
                  price: deals[index].price,
                  onItemPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (context) {
                          return DealDetailPage(deals[index].dealId);
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
                itemCount: deals.length,
              );
            default:
              return null;
          }
        },
      ),
    );
  }
}