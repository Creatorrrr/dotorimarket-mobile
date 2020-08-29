import 'package:dotorimarket/views/notice/detail/notice_detail_page.dart';
import 'package:dotorimarket/views/notice/list/widgets/notice_list_item.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {
  static const double SUBJECT_HEIGHT = 70.0;
  static const double SUBJECT_FONT_SIZE = 24.0;
  static const double ITEM_HORIZONTAL_PADDING = 10.0;

  static const String SUBJECT_TEXT = '도토리 공지사항';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              SUBJECT_TEXT,
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: SUBJECT_FONT_SIZE,
                fontWeight: FontWeight.bold,
              ),
            ),
            height: SUBJECT_HEIGHT,
            alignment: Alignment.center,
            color: Colors.cyanAccent,
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  child: NoticeListItem(
                    time: '2020.08.11',
                    title: '[공지] 도토리마켓이 새로 나왔어요!',
                    onTab: () {
                      Navigator.push(context, MaterialPageRoute<void>(
                          builder: (context) {
                            return NoticeDetailPage();
                          }
                      ));
                    },
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: ITEM_HORIZONTAL_PADDING,
                  ),
                ),
                Divider(),
                Container(
                  child: NoticeListItem(
                    time: '2020.08.11',
                    title: '[알림] 중고거래 게시글의 댓글 기능이 종료될 예정이에요.',
                    onTab: () {
                      Navigator.push(context, MaterialPageRoute<void>(
                          builder: (context) {
                            return NoticeDetailPage();
                          }
                      ));
                    },
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: ITEM_HORIZONTAL_PADDING,
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}