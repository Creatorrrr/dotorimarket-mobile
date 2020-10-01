import 'dart:io';

import 'package:dotorimarket/views/common/widgets/permission_setting_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class PictureSelectionDialog extends StatelessWidget {
  static const String CAMERA_SELECTION_TEXT = '촬영하기';
  static const String GALLERY_SELECTION_TEXT = '갤러리에서 선택하기';
  static const String CAMERA_PERMISSION_DIALOG_TITLE = '카메라 접근 권한이 필요합니다';
  static const String GALLERY_PERMISSION_DIALOG_TITLE = '갤러리 접근 권한이 필요합니다';

  final void Function() onCameraPressed;
  final void Function() onGalleryPressed;

  PictureSelectionDialog({
    Key key,
    @required this.onCameraPressed,
    @required this.onGalleryPressed,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text(CAMERA_SELECTION_TEXT),
            onTap: onCameraPressed,
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text(GALLERY_SELECTION_TEXT),
            onTap: onGalleryPressed,
          ),
        ],
      ),
    );
  }

  static Future<T> openDialog<T>(BuildContext context, {
    @required void Function(File pickedFile) onCameraPressed,
    @required void Function(File pickedFile) onGalleryPressed,
  }) async {
    return await showModalBottomSheet<T>(
      context: context,
      builder: (BuildContext dialogContext) {
        final ImagePicker imagePicker = ImagePicker();

        return PictureSelectionDialog(
          onCameraPressed: () async {
            // 카메라 화면 띄우기
            try {
              PickedFile pickedFile = await imagePicker.getImage(
                source: ImageSource.camera,
              );
              if (pickedFile != null) {
                if (onCameraPressed != null) onCameraPressed(File(pickedFile.path));
              }
            } catch (e) {
              // 카메라 권한 확인
              _checkCameraPermission(context);
            }

            Navigator.pop(dialogContext);
          },
          onGalleryPressed: () async {
            // 갤러리 화면 띄우기
            try {
              PickedFile pickedFile = await imagePicker.getImage(
                source: ImageSource.gallery,
              );
              if (pickedFile != null) {
                if (onGalleryPressed != null) onGalleryPressed(File(pickedFile.path));
              }
            } catch (e) {
              // 갤러리 권한 확인
              _checkGalleryPermission(context);
            }

            Navigator.pop(dialogContext);
          },
        );
      },
    );
  }

  /// 카메라 권한 확인
  static void _checkCameraPermission(BuildContext context) async {
    PermissionStatus cameraStatus = await Permission.camera.status;

    if (cameraStatus != PermissionStatus.granted) {
      await PermissionSettingDialog.openDialog(context,
        title: CAMERA_PERMISSION_DIALOG_TITLE,
      );
    }
  }

  /// 갤러리 권한 확인
  static void _checkGalleryPermission(BuildContext context) async {
    PermissionStatus photosStatus = await Permission.photos.status;

    if (photosStatus != PermissionStatus.granted) {
      await PermissionSettingDialog.openDialog(context,
        title: GALLERY_PERMISSION_DIALOG_TITLE,
      );
    }
  }
}