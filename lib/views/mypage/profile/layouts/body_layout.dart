import 'dart:io';

import 'package:async/async.dart';
import 'package:dotorimarket/constants/color_constant.dart';
import 'package:dotorimarket/dtos/word/word_dto.dart';
import 'package:dotorimarket/utils/string_util.dart';
import 'package:dotorimarket/viewmodels/word_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:dotorimarket/views/common/widgets/circle_image.dart';
import 'package:dotorimarket/views/common/widgets/picture_selection_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BodyLayout extends StatefulWidget {
  final File picture;
  final String nickName;
  final void Function(File picture, String nickName) onChanged;

  BodyLayout({
    Key key,
    this.picture,
    this.nickName,
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

  static const String NICKNAME_LABEL_TEXT = '닉네임';
  static const String NICKNAME_HINT_TEXT = '닉네임을 입력해주세요';

  File picture;
  String nickName;

  final AsyncMemoizer _memoizer = AsyncMemoizer();
  TextEditingController _nickNameController = TextEditingController();

  @override
  void initState() {
    picture = widget.picture;
    nickName = widget.nickName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final WordViewModel wordViewModel = ViewModelProvider.of<WordViewModel>(context);

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
                        onCameraPressed: (File pickedFile) {
                          setState(() {
                            picture = File(pickedFile.path);
                            widget.onChanged(picture, nickName);
                          });
                        },
                        onGalleryPressed: (File pickedFile) {
                          setState(() {
                            picture = File(pickedFile.path);
                            widget.onChanged(picture, nickName);
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
          CheckedFutureBuilder(
            future: SharedPreferences.getInstance(),
            builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
              SharedPreferences prefs = snapshot.data;
              String nickName = prefs.getString('name');
              if (StringUtil.isEmpty(_nickNameController.text)) {
                if (nickName != null) {
                  _nickNameController.text = nickName;
                } else {
                  _getRandomNickName(context)
                  .then((String nickName) {
                    setState(() {
                      _nickNameController.text = nickName;
                    });
                  });
                }
              }

              return Container(
                child: TextFormField(
                  controller: _nickNameController,
                  onChanged: (String value) {
                    nickName = value;
                    widget.onChanged(picture, nickName);
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
                        widget.onChanged(picture, nickName);
                        setState(() {
                          _nickNameController.text = nickName;
                        });
                      },
                    ),
                  ),
                ),
                width: NICKNAME_WIDTH,
              );
            },
          )
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