// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_post_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatPostDto _$ChatPostDtoFromJson(Map<String, dynamic> json) {
  return ChatPostDto(
    title: json['title'] as String,
    deal: json['deal'] as String,
    members: (json['members'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ChatPostDtoToJson(ChatPostDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('deal', instance.deal);
  writeNotNull('members', instance.members);
  return val;
}
