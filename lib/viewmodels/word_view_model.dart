import 'dart:convert';

import 'package:dotorimarket/configs/http_config.dart';
import 'package:dotorimarket/dtos/word/word_dto.dart';
import 'package:dotorimarket/utils/http_util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Response;
import 'package:dotorimarket/viewmodels/view_model.dart';

class WordViewModel extends ViewModel {
  static const GET_WORD_RANDOM = '${HttpConfig.URL_MOBILE_PREFIX}/v1/words/random';

  Future<WordDto> getWordRandom(String type, BuildContext context) async {
    String url = GET_WORD_RANDOM;

    Map<String, String> queryParams = {
      'type': type,
    };

    Response res = await HttpUtil.get(url, context,
      queryParams: queryParams,
    );
    Map<String, dynamic> bodyJson = jsonDecode(res.body);

    WordDto word = new WordDto.fromJson(bodyJson['result']);

    return word;
  }
}