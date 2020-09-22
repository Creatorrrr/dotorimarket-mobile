import 'package:flutter/material.dart';

class CheckedFutureBuilder<T> extends StatelessWidget {
  static const String WAITING = '기다리는 중...';
  static const String ERROR_PREFIX = '에러';
  static const String NO_DATA = '데이터가 없습니다';

  final Future<T> future;
  final Widget Function(BuildContext context, AsyncSnapshot<T> snapshot) builder;

  CheckedFutureBuilder({
    Key key,
    @required this.future,
    @required this.builder,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Center(
              child: Text(WAITING),
            );
          case ConnectionState.waiting:
          case ConnectionState.active:
          case ConnectionState.done:
            // 에러 발생 시 에러메시지 표시
            if (snapshot.hasError) {
              return Center(
                child: Text('$ERROR_PREFIX: ${snapshot.error}'),
              );
            }
            // 결과값이 없을 경우 에러메시지 표시
            if (snapshot.data == null) {
              return Center(
                child: Text('$ERROR_PREFIX: $NO_DATA'),
              );
            }

            // 위젯 리스트 그리기
            return builder(context, snapshot);
          default:
            return null;
        }
      },
    );
  }
}