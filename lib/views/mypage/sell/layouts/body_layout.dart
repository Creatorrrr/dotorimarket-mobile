import 'package:dotorimarket/constants/color_constant.dart';
import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:dotorimarket/views/deal/detail/deal_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:dotorimarket/views/mypage/sell/widgets/sell_list_item.dart';

class BodyLayout extends StatefulWidget {
  final List<DealDto> dealList;

  BodyLayout(this.dealList,{
    Key key,
  }):super(key: key);

  @override
  State<StatefulWidget> createState() => BodyLayoutState();
}

class BodyLayoutState extends State<BodyLayout> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final DealViewModel dealViewModel = ViewModelProvider.of<DealViewModel>(context);

    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return SellListItem(
            title: widget.dealList[index].title,
            price: widget.dealList[index].price,
            onItemPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) => DealDetailPage(widget.dealList[index].id),
              ));
            },
            onToReservingPressed: () {

            },
            onToDealtPressed: () {

            },
          );
        },
        itemCount: widget.dealList.length,
      ),
    );
  }
}
