
import 'package:json_annotation/json_annotation.dart';

part 'deal_post_dto.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class DealPostDto {
  String title;
  String category;
  String price;
  String description;
  String seller;

  DealPostDto({
    this.title,
    this.category,
    this.price,
    this.description,
    this.seller,
  });

  factory DealPostDto.fromJson(Map<String, dynamic> json) => _$DealPostDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DealPostDtoToJson(this);
}
