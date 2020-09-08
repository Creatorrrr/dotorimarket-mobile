import 'package:json_annotation/json_annotation.dart';

part 'deal_dto.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class DealDto {
  int dealId;
  String title;
  String categoryId;
  int price;
  String description;

  DealDto({
    this.dealId,
    this.title,
    this.categoryId,
    this.price,
    this.description,
  });

  factory DealDto.fromJson(Map<String, dynamic> json) => _$DealDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DealDtoToJson(this);
}