import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CommonAlertDialog extends StatelessWidget {
  final String title;
  final String cancelText;
  final String okText;
  final void Function() onCancel;
  final void Function() onOk;

  CommonAlertDialog(this.title, this.cancelText, this.okText, {
    Key key,
    @required this.onCancel,
    @required this.onOk,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      actions: [
        FlatButton(
          child: Text(cancelText),
          onPressed: onCancel,
        ),
        FlatButton(
          child: Text(okText),
          onPressed: onOk,
        )
      ],
    );
  }

  static Future<T> openDialog<T>(BuildContext context, {
    String title,
    String cancelText,
    String okText,
    T Function() onCancel,
    T Function() onOk,
  }) async {
    return await showDialog<T>(
      context: context,
      builder: (BuildContext dialogContext) {
        return CommonAlertDialog(title, cancelText, okText,
          onCancel: () {
            T t = onCancel != null ? onCancel() : null;
            Navigator.pop(dialogContext, t);
          },
          onOk: () {
            T t = onOk != null ? onOk() : null;
            Navigator.pop(dialogContext, t);
          }
        );
      }
    );
  }
}