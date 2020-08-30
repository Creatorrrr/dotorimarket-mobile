
import 'package:json_annotation/json_annotation.dart';

part 'deal_post_dto.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class DealPostDto {
  String title;
  String categoryId;
  String price;
  String description;

  DealPostDto({
    this.title,
    this.categoryId,
    this.price,
    this.description,
  });

  factory DealPostDto.fromJson(Map<String, dynamic> json) => _$DealPostDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DealPostDtoToJson(this);
}
