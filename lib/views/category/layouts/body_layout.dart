import 'package:dotorimarket/dtos/category/category_dto.dart';
import 'package:dotorimarket/viewmodels/category_view_model.dart';
import 'package:dotorimarket/views/category/widgets/category_list_item.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
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
      child: FutureBuilder(
        future: categoryViewModel.getCategoryList("", "", "", "", "", context),
        builder: (BuildContext context, AsyncSnapshot<List<CategoryDto>> snapshot) {
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

              // 데이터가 없을 경우
              if (snapshot.data == null || snapshot.data.length == 0) {
                return Center(
                  child: Text('No items'),
                );
              }

              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return CategoryListItem(
                    text: snapshot.data[index].name,
                    onPressed: () {

                    },
                  );
                },
                itemCount: snapshot.data.length,
              );
            default:
              return null;
          }
        },
      ),
      padding: const EdgeInsets.symmetric(
        vertical: VERTICAL_PADDING,
        horizontal: HORIZONTAL_PADDING,
      ),
    );
  }
}