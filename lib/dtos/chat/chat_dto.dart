import 'package:dotorimarket/dtos/account/account_dto.dart';
import 'package:dotorimarket/dtos/chat/chat_content_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_dto.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ChatDto {
  String id;
  String title;
  List<AccountDto> members;
  List<ChatContentDto> contents;
  DateTime createdAt;
  DateTime updatedAt;

  ChatDto({
    this.id,
    this.title,
    this.createdAt,
    this.updatedAt,
  });

  factory ChatDto.fromJson(Map<String, dynamic> json) => _$ChatDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ChatDtoToJson(this);
}