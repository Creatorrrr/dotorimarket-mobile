import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:dotorimarket/views/deal/detail/deal_detail_page.dart';
import 'package:dotorimarket/views/mypage/purchase/widgets/purchase_list_item.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DealViewModel dealViewModel = ViewModelProvider.of<DealViewModel>(context);

    return Container(
      child: CheckedFutureBuilder(
        future: dealViewModel.getDealList("", "", "", "", "", context),
        builder: (BuildContext context, AsyncSnapshot<List<DealDto>> snapshot) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return PurchaseListItem(
                title: snapshot.data[index].title,
                price: snapshot.data[index].price,
                onItemPressed: () {
                  Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) => DealDetailPage(
                        dealId: snapshot.data[index].id,
                      )
                  ));
                },
                onToReservingPressed: () {

                },
                onToDealtPressed: () {

                },
              );
            },
            itemCount: snapshot.data.length,
          );
        },
      ),
    );
  }
}