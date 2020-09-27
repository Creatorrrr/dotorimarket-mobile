import 'package:dotorimarket/dtos/notice/notice_dto.dart';
import 'package:dotorimarket/viewmodels/notice_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:dotorimarket/views/notice/list/widgets/notice_list_body_item.dart';
import 'package:dotorimarket/views/notice/list/widgets/notice_list_header_item.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BodyLayoutState();
}

class _BodyLayoutState extends State<BodyLayout> {
  static const double HEADER_ITEM_VERTICAL_PADDING = 15.0;
  static const double HEADER_ITEM_HORIZONTAL_PADDING = 15.0;
  static const double BODY_ITEM_VERTICAL_PADDING = 15.0;
  static const double BODY_ITEM_HORIZONTAL_PADDING = 15.0;
  static const Color BODY_ITEM_BACKGROUND_COLOR = Color.fromRGBO(250, 250, 250, 1.0);
  static const double DIVIDER_HEIGHT = 0.0;
  static const double DIVIDER_THICKNESS = 1.0;
  static const Color DIVIDER_COLOR = Color.fromRGBO(216, 216, 216, 1.0);

  Map<int, bool> isExpandedMap = {};

  @override
  Widget build(BuildContext context) {
    final NoticeViewModel noticeViewModel = ViewModelProvider.of<NoticeViewModel>(context);

    return Container(
      child: CheckedFutureBuilder(
        future: noticeViewModel.getNoticeList("", "", "", "", "", context),
        builder: (BuildContext context, AsyncSnapshot<List<NoticeDto>> snapshot) {
          return ListView.separated(
            separatorBuilder: (BuildContext context, int index) => Divider(
              height: DIVIDER_HEIGHT,
              thickness: DIVIDER_THICKNESS,
              color: DIVIDER_COLOR,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Column(
                  children: [
                    Container(
                      child: NoticeListHeaderItem(
                        title: snapshot.data[index].title,
                        type: snapshot.data[index].type,
                        time: snapshot.data[index].time,
                        onPressed: (isExpanded) {
                          setState(() {
                            isExpandedMap[snapshot.data[index].noticeId] = isExpanded;
                          });
                        },
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: HEADER_ITEM_VERTICAL_PADDING,
                        horizontal: HEADER_ITEM_HORIZONTAL_PADDING,
                      ),
                    ),
                    Divider(
                      height: DIVIDER_HEIGHT,
                      thickness: DIVIDER_THICKNESS,
                      color: DIVIDER_COLOR,
                    ),
                    Container(
                      child: NoticeListBodyItem(
                        content: snapshot.data[index].content,
                      ),
                      color: BODY_ITEM_BACKGROUND_COLOR,
                      padding: const EdgeInsets.symmetric(
                        vertical: BODY_ITEM_VERTICAL_PADDING,
                        horizontal: BODY_ITEM_HORIZONTAL_PADDING,
                      ),
                      height: isExpandedMap[snapshot.data[index].noticeId] != null && isExpandedMap[snapshot.data[index].noticeId] ? null : 0.0,
                    ),
                  ],
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