import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionSettingDialog extends StatelessWidget {
  static const String PERMISSION_TITLE_DEFAULT = '권한이 필요합니다';
  static const String PERMISSION_DIALOG_CANCEL = '취소';
  static const String PERMISSION_DIALOG_SET_PERMISSION = '권한설정';

  final String title;
  final Function onCancel;
  final Function onOk;

  PermissionSettingDialog({
    Key key,
    this.title = PERMISSION_TITLE_DEFAULT,
    @required this.onCancel,
    @required this.onOk,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      actions: [
        FlatButton(
          child: Text(PERMISSION_DIALOG_CANCEL),
          onPressed: onCancel,
        ),
        FlatButton(
          child: Text(PERMISSION_DIALOG_SET_PERMISSION),
          onPressed: () {
            openAppSettings();
            onOk();
          },
        )
      ],
    );
  }

  static Future<T> openDialog<T>(BuildContext context, {
    String title,
    void Function() onCancel,
    void Function() onOk,
  }) async {
    return await showDialog<T>(
      context: context,
      builder: (BuildContext dialogContext) {
        return PermissionSettingDialog(
          title: title,
          onCancel: () {
            if (onCancel != null) onCancel();

            Navigator.pop(dialogContext);
          },
          onOk: () {
            if (onOk != null) onOk();

            Navigator.pop(dialogContext);
          }
        );
      }
    );
  }
}