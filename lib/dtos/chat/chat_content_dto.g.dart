// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_content_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatContentDto _$ChatContentDtoFromJson(Map<String, dynamic> json) {
  return ChatContentDto(
    id: json['id'] as String,
    content: json['content'] as String,
    account: json['account'] == null
        ? null
        : AccountDto.fromJson(json['account'] as Map<String, dynamic>),
    chat: json['chat'] == null
        ? null
        : ChatDto.fromJson(json['chat'] as Map<String, dynamic>),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$ChatContentDtoToJson(ChatContentDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('content', instance.content);
  writeNotNull('account', instance.account?.toJson());
  writeNotNull('chat', instance.chat?.toJson());
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  return val;
}
