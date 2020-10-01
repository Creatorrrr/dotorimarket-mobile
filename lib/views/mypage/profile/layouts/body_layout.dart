import 'dart:io';

import 'package:dotorimarket/constants/color_constant.dart';
import 'package:dotorimarket/views/common/widgets/circle_image.dart';
import 'package:dotorimarket/views/common/widgets/picture_selection_dialog.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BodyLayoutState();
}

class _BodyLayoutState extends State<BodyLayout> {
  static const String DEFAULT_PROFILE_IMAGE_PATH = 'assets/images/default-profile.png';
  static const String PICTURE_SELECTION_IMAGE_PATH = 'assets/images/picture-selection.png';

  static const double PROFILE_IMAGE_RADIUS = 90.0;
  static const ImageProvider DEFAULT_PROFILE_IMAGE = AssetImage(DEFAULT_PROFILE_IMAGE_PATH);
  static const Color PICTURE_SELECTION_IMAGE_COLOR = ColorConstant.DEEP_YELLOW;
  static const double PICTURE_SELECTION_RADIUS = 25.0;
  static const double PICTURE_SELECTION_BORDER_WIDTH = 1.0;
  static const double PROFILE_VERTICAL_PADDING = 50.0;
  static const double NICKNAME_LABEL_SIZE = 12.0;
  static const double NICKNAME_HINT_SIZE = 14.0;
  static const double NICKNAME_WIDTH = 200.0;

  static const String NICKNAME_LABEL_TEXT = '닉네임';
  static const String NICKNAME_HINT_TEXT = '닉네임을 입력해주세요';

  File picture;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Stack(
              children: [
                CircleImage(
                  image: picture == null ? DEFAULT_PROFILE_IMAGE : Image.file(picture).image,
                  radius: PROFILE_IMAGE_RADIUS,
                  border: Border.all(
                    width: PICTURE_SELECTION_BORDER_WIDTH,
                    color: ColorConstant.BACKGROUND_GREY,
                  ),
                ),
                Positioned(
                  child: CircleImage(
                    child: Image.asset(PICTURE_SELECTION_IMAGE_PATH,
                      color: PICTURE_SELECTION_IMAGE_COLOR,
                    ),
                    backgroundColor: Colors.white,
                    radius: PICTURE_SELECTION_RADIUS,
                    border: Border.all(
                      width: PICTURE_SELECTION_BORDER_WIDTH,
                      color: ColorConstant.BACKGROUND_GREY,
                    ),
                    onPressed: () async {
                      // 사진 선택 모달 열기
                      PictureSelectionDialog.openDialog(context,
                        onCameraPressed: (pickedFile) {
                          setState(() {
                            picture = File(pickedFile.path);
                          });
                        },
                        onGalleryPressed: (pickedFile) {
                          setState(() {
                            picture = File(pickedFile.path);
                          });
                        },
                      );
                    },
                  ),
                  bottom: 0.0,
                  right: 0.0,
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(
              vertical: PROFILE_VERTICAL_PADDING,
            ),
          ),
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: NICKNAME_LABEL_TEXT,
                labelStyle: TextStyle(
                  fontSize: NICKNAME_LABEL_SIZE,
                ),
                hintText: NICKNAME_HINT_TEXT,
                hintStyle: TextStyle(
                  fontSize: NICKNAME_HINT_SIZE,
                ),
              ),
            ),
            width: NICKNAME_WIDTH,
          )
        ],
      ),
    );
  }
}