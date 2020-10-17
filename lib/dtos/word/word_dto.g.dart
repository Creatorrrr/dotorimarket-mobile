// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordDto _$WordDtoFromJson(Map<String, dynamic> json) {
  return WordDto(
    id: json['id'] as String,
    name: json['name'] as String,
    type: json['type'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$WordDtoToJson(WordDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('type', instance.type);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  return val;
}
