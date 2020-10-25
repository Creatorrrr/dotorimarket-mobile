import 'package:dotorimarket/dtos/category/category_dto.dart';
import 'package:dotorimarket/viewmodels/category_view_model.dart';
import 'package:dotorimarket/views/category/widgets/category_list_item.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:dotorimarket/views/deal/list/deal_list_page.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {
  static const double HORIZONTAL_PADDING = 15.0;
  static const double VERTICAL_PADDING = 10.0;

  BodyLayout({
    Key key,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    final CategoryViewModel categoryViewModel = ViewModelProvider.of<CategoryViewModel>(context);

    return Container(
      child: CheckedFutureBuilder(
        future: categoryViewModel.getCategoryList("", "", "", "", "", context),
        builder: (BuildContext context, AsyncSnapshot<List<CategoryDto>> snapshot) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return CategoryListItem(
                text: snapshot.data[index].name,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute<void>(
                      builder: (context) {
                        return DealListPage(
                          categoryId: snapshot.data[index].id,
                        );
                      }
                  ));
                },
              );
            },
            itemCount: snapshot.data.length,
          );
        },
      ),
      padding: const EdgeInsets.symmetric(
        vertical: VERTICAL_PADDING,
        horizontal: HORIZONTAL_PADDING,
      ),
    );
  }
}