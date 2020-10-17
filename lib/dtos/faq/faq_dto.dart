import 'package:json_annotation/json_annotation.dart';

part 'faq_dto.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class FaqDto {
  String id;
  String title;
  String content;
  DateTime createdAt;
  DateTime updatedAt;

  FaqDto({
    this.id,
    this.title,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  factory FaqDto.fromJson(Map<String, dynamic> json) => _$FaqDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FaqDtoToJson(this);
}