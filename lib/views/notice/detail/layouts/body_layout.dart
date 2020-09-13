import 'package:dotorimarket/views/notice/detail/widgets/notice_content.dart';
import 'package:dotorimarket/views/notice/detail/widgets/notice_title.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Divider(),
          Container(
            child: NoticeTitle(
              time: '2020.08.11',
              title: '[알림] 중고거래 게시글의 댓글 기능이 종료될 예정이에요.',
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
          ),
          Divider(),
          Container(
            child: NoticeContent(
              content: '[알림] 중고거래 게시글의 댓글 기능이 종료될 예정이에요.\n'
                  + '[알림] 중고거래 게시글의 댓글 기능이 종료될 예정이에요.\n'
                  + '[알림] 중고거래 게시글의 댓글 기능이 종료될 예정이에요.\n'
                  + '[알림] 중고거래 게시글의 댓글 기능이 종료될 예정이에요.\n'
                  + '[알림] 중고거래 게시글의 댓글 기능이 종료될 예정이에요.\n\n'
                  + '도토리 팀 드림',
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
          ),
        ],
      )
    );
  }
}