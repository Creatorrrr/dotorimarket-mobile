import 'package:dotorimarket/dtos/account/account_dto.dart';
import 'package:dotorimarket/dtos/chat/chat_content_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_post_dto.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ChatPostDto {
  String title;
  String deal;
  List<String> members;

  ChatPostDto({
    this.title,
    this.deal,
    this.members,
  });

  factory ChatPostDto.fromJson(Map<String, dynamic> json) => _$ChatPostDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ChatPostDtoToJson(this);
}