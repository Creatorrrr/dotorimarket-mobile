// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeDto _$NoticeDtoFromJson(Map<String, dynamic> json) {
  return NoticeDto(
    noticeId: json['noticeId'] as int,
    title: json['title'] as String,
    type: json['type'] as String,
    time: json['time'] as String,
    content: json['content'] as String,
  );
}

Map<String, dynamic> _$NoticeDtoToJson(NoticeDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('noticeId', instance.noticeId);
  writeNotNull('title', instance.title);
  writeNotNull('type', instance.type);
  writeNotNull('time', instance.time);
  writeNotNull('content', instance.content);
  return val;
}
