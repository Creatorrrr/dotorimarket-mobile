import 'package:dotorimarket/dtos/account/account_dto.dart';
import 'package:dotorimarket/dtos/category/category_dto.dart';
import 'package:dotorimarket/dtos/chat/chat_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'deal_dto.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class DealDto {
  String id;
  String title;
  CategoryDto category;
  int price;
  String description;
  List<ChatDto> chats;
  AccountDto seller;
  String sellerName;

  DealDto({
    this.id,
    this.title,
    this.category,
    this.price,
    this.description,
    this.chats,
    this.seller,
    this.sellerName,
  });

  factory DealDto.fromJson(Map<String, dynamic> json) => _$DealDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DealDtoToJson(this);
}