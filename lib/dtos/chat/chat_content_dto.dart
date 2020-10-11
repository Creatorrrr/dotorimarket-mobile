import 'package:dotorimarket/dtos/account/account_dto.dart';
import 'package:dotorimarket/dtos/chat/chat_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_content_dto.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ChatContentDto {
  String id;
  String content;
  AccountDto account;
  ChatDto chat;
  DateTime createdAt;
  DateTime updatedAt;

  ChatContentDto({
    this.id,
    this.content,
    this.account,
    this.chat,
    this.createdAt,
    this.updatedAt,
  });

  factory ChatContentDto.fromJson(Map<String, dynamic> json) => _$ChatContentDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ChatContentDtoToJson(this);
}