// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatDto _$ChatDtoFromJson(Map<String, dynamic> json) {
  return ChatDto(
    id: json['id'] as String,
    title: json['title'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  )
    ..members = (json['members'] as List)
        ?.map((e) =>
            e == null ? null : AccountDto.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..contents = (json['contents'] as List)
        ?.map((e) => e == null
            ? null
            : ChatContentDto.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ChatDtoToJson(ChatDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('members', instance.members?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'contents', instance.contents?.map((e) => e?.toJson())?.toList());
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  return val;
}
