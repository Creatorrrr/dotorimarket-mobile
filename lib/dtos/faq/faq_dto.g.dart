// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaqDto _$FaqDtoFromJson(Map<String, dynamic> json) {
  return FaqDto(
    id: json['id'] as String,
    title: json['title'] as String,
    content: json['content'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$FaqDtoToJson(FaqDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('content', instance.content);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  return val;
}
