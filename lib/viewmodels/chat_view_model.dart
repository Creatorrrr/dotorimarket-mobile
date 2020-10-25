import 'dart:convert';

import 'package:dotorimarket/configs/http_config.dart';
import 'package:dotorimarket/dtos/chat/chat_content_dto.dart';
import 'package:dotorimarket/dtos/chat/chat_dto.dart';
import 'package:dotorimarket/dtos/chat/chat_post_dto.dart';
import 'package:dotorimarket/utils/http_util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Response;
import 'package:dotorimarket/viewmodels/view_model.dart';
import 'package:sprintf/sprintf.dart';

class ChatViewModel extends ViewModel {
  static const POST_DEAL = '${HttpConfig.URL_MOBILE_PREFIX}/v1/chats';
  static const GET_DEAL_ONE = '${HttpConfig.URL_MOBILE_PREFIX}/v1/chats/%s';
  static const GET_DEAL_LIST = '${HttpConfig.URL_MOBILE_PREFIX}/v1/chats';
  static const GET_CHAT_CONTENT_LIST = '${HttpConfig.URL_MOBILE_PREFIX}/v1/chats/%s/contents';

  Future<Response> postChat(ChatPostDto chatPostDto, BuildContext context) async {
    Response res = await HttpUtil.post(
      POST_DEAL,
      context,
      body: chatPostDto.toJson(),
    );
    return res;
  }

  Future<ChatDto> getChatOne(String chatId, BuildContext context) async {
    String url = sprintf(GET_DEAL_ONE, [chatId]);

    Response res = await HttpUtil.get(url, context);
    Map<String, dynamic> bodyJson = jsonDecode(res.body);

    ChatDto chat = new ChatDto.fromJson(bodyJson['result']);

    return chat;
  }

  Future<List<ChatDto>> getChatList(String filter, String field, String keyword, String orders, String paging, BuildContext context) async {
    String url = GET_DEAL_LIST;

    Map<String, String> queryParams = {
      'filter': filter,
      'field': field,
      'keyword': keyword,
      'orders': orders,
      'paging': paging,
    };

    Response res = await HttpUtil.get(url, context,
      queryParams: queryParams,
    );
    Map<String, dynamic> bodyJson = jsonDecode(res.body);

    List<ChatDto> chatList = [];
    for (dynamic json in bodyJson['result']) {
      ChatDto chatDto = new ChatDto.fromJson(json);
      chatList.add(chatDto);
    }

    return chatList;
  }

  Future<List<ChatContentDto>> getChatContentList(String chatId, String filter, String field, String keyword, String orders, String paging, BuildContext context) async {
    String url = sprintf(GET_CHAT_CONTENT_LIST, [chatId]);

    Map<String, String> queryParams = {
      'filter': filter,
      'field': field,
      'keyword': keyword,
      'orders': orders,
      'paging': paging,
    };

    Response res = await HttpUtil.get(url, context,
      queryParams: queryParams,
    );
    Map<String, dynamic> bodyJson = jsonDecode(res.body);

    List<ChatContentDto> chatContentList = [];
    for (dynamic json in bodyJson['result']) {
      ChatContentDto chatContentDto = new ChatContentDto.fromJson(json);
      chatContentList.add(chatContentDto);
    }

    return chatContentList;
  }
}