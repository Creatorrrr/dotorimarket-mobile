import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionSettingDialog extends StatelessWidget {
  static const String PERMISSION_DIALOG_CANCEL = '취소';
  static const String PERMISSION_DIALOG_SET_PERMISSION = '권한설정';

  final String title;
  final Function onCancel;
  final Function onOk;

  PermissionSettingDialog({
    Key key,
    @required this.title,
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
          onPressed: onCancel(),
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
}