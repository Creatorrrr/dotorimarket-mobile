import 'dart:io';

import 'package:async/async.dart';
import 'package:dotorimarket/configs/http_config.dart';
import 'package:dotorimarket/constants/color_constant.dart';
import 'package:dotorimarket/dtos/word/word_dto.dart';
import 'package:dotorimarket/utils/string_util.dart';
import 'package:dotorimarket/viewmodels/word_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/common/widgets/circle_image.dart';
import 'package:dotorimarket/views/common/widgets/picture_selection_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BodyLayout extends StatefulWidget {
  final void Function(File picture, String accountId, String password, String nickName, String place) onChanged;

  BodyLayout({
    Key key,
    this.onChanged,
  }):super(key: key);

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
  static const int NICKNAME_MAX_LENGTH = 8;
  static const double ACCOUNT_ID_LABEL_SIZE = 12.0;
  static const double ACCOUNT_ID_HINT_SIZE = 14.0;
  static const double ACCOUNT_ID_WIDTH = 200.0;
  static const int ACCOUNT_ID_MAX_LENGTH = 20;
  static const double PASSWORD_LABEL_SIZE = 12.0;
  static const double PASSWORD_HINT_SIZE = 14.0;
  static const double PASSWORD_WIDTH = 200.0;
  static const int PASSWORD_MAX_LENGTH = 8;
  static const double PLACE_LABEL_SIZE = 12.0;
  static const double PLACE_HINT_SIZE = 14.0;
  static const double PLACE_WIDTH = 200.0;
  static const int PLACE_MAX_LENGTH = 10;

  static const String NICKNAME_LABEL_TEXT = '닉네임';
  static const String NICKNAME_HINT_TEXT = '닉네임을 입력해주세요';
  static const String ACCOUNT_ID_LABEL_TEXT = '아이디';
  static const String ACCOUNT_ID_HINT_TEXT = '아이디를 입력해주세요';
  static const String PASSWORD_LABEL_TEXT = '패스워드';
  static const String PASSWORD_HINT_TEXT = '패스워드를 입력해주세요';
  static const String PLACE_LABEL_TEXT = '지역';
  static const String PLACE_HINT_TEXT = '지역을 입력해주세요';

  File picture;
  String nickName;
  String accountId;
  String password;
  String place;

  TextEditingController _nickNameController = TextEditingController();
  TextEditingController _accountIdController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _placeController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Stack(
              children: [
                CircleImage(
                  image: picture == null
                    ? DEFAULT_PROFILE_IMAGE
                    : Image.file(picture).image,
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
                        onCameraPressed: (File pickedFile) {
                          setState(() {
                            picture = File(pickedFile.path);
                            widget.onChanged(picture, accountId, password, nickName, place);
                          });
                        },
                        onGalleryPressed: (File pickedFile) {
                          setState(() {
                            picture = File(pickedFile.path);
                            widget.onChanged(picture, accountId, password, nickName, place);
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
              controller: _accountIdController,
              onChanged: (String value) {
                accountId = value;
                widget.onChanged(picture, accountId, password, nickName, place);
              },
              inputFormatters: [
                LengthLimitingTextInputFormatter(ACCOUNT_ID_MAX_LENGTH),
              ],
              decoration: InputDecoration(
                labelText: ACCOUNT_ID_LABEL_TEXT,
                labelStyle: TextStyle(
                  fontSize: ACCOUNT_ID_LABEL_SIZE,
                ),
                hintText: ACCOUNT_ID_HINT_TEXT,
                hintStyle: TextStyle(
                  fontSize: ACCOUNT_ID_HINT_SIZE,
                ),
              ),
            ),
            width: ACCOUNT_ID_WIDTH,
          ),
          Container(
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              onChanged: (String value) {
                password = value;
                widget.onChanged(picture, accountId, password, nickName, place);
              },
              inputFormatters: [
                LengthLimitingTextInputFormatter(PASSWORD_MAX_LENGTH),
              ],
              decoration: InputDecoration(
                labelText: PASSWORD_LABEL_TEXT,
                labelStyle: TextStyle(
                  fontSize: PASSWORD_LABEL_SIZE,
                ),
                hintText: PASSWORD_HINT_TEXT,
                hintStyle: TextStyle(
                  fontSize: PASSWORD_HINT_SIZE,
                ),
              ),
            ),
            width: PASSWORD_WIDTH,
          ),
          Container(
            child: TextFormField(
              controller: _nickNameController,
              onChanged: (String value) {
                nickName = value;
                widget.onChanged(picture, accountId, password, nickName, place);
              },
              inputFormatters: [
                LengthLimitingTextInputFormatter(NICKNAME_MAX_LENGTH),
              ],
              decoration: InputDecoration(
                labelText: NICKNAME_LABEL_TEXT,
                labelStyle: TextStyle(
                  fontSize: NICKNAME_LABEL_SIZE,
                ),
                hintText: NICKNAME_HINT_TEXT,
                hintStyle: TextStyle(
                  fontSize: NICKNAME_HINT_SIZE,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.shuffle),
                  onPressed: () async {
                    nickName = await _getRandomNickName(context);
                    widget.onChanged(picture, accountId, password, nickName, place);
                    setState(() {
                      _nickNameController.text = nickName;
                    });
                  },
                ),
              ),
            ),
            width: NICKNAME_WIDTH,
          ),
          Container(
            child: TextFormField(
              controller: _placeController,
              onChanged: (String value) {
                place = value;
                widget.onChanged(picture, accountId, password, nickName, place);
              },
              inputFormatters: [
                LengthLimitingTextInputFormatter(PLACE_MAX_LENGTH),
              ],
              decoration: InputDecoration(
                labelText: PLACE_LABEL_TEXT,
                labelStyle: TextStyle(
                  fontSize: PLACE_LABEL_SIZE,
                ),
                hintText: PLACE_HINT_TEXT,
                hintStyle: TextStyle(
                  fontSize: PLACE_HINT_SIZE,
                ),
              ),
            ),
            width: PLACE_WIDTH,
          ),
        ],
      ),
    );
  }

  Future<String> _getRandomNickName(BuildContext context) async {
    final WordViewModel wordViewModel = ViewModelProvider.of<WordViewModel>(context);

    WordDto adj = await wordViewModel.getWordRandom('ADJ', context);
    WordDto noun = await wordViewModel.getWordRandom('NOUN', context);

    return '${adj.name} ${noun.name}';
  }
}