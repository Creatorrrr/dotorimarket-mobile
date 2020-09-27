import 'package:json_annotation/json_annotation.dart';

part 'notice_dto.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class NoticeDto {
  int noticeId;
  String title;
  String type;
  String time;
  String content;

  NoticeDto({
    this.noticeId,
    this.title,
    this.type,
    this.time,
    this.content,
  });

  factory NoticeDto.fromJson(Map<String, dynamic> json) => _$NoticeDtoFromJson(json);
  Map<String, dynamic> toJson() => _$NoticeDtoToJson(this);
}