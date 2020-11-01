import 'package:dotorimarket/dtos/account/account_dto.dart';
import 'package:dotorimarket/dtos/category/category_dto.dart';
import 'package:dotorimarket/dtos/chat/chat_dto.dart';
import 'package:dotorimarket/dtos/common/image_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'deal_dto.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class DealDto {
  String id;
  String title;
  CategoryDto category;
  int price;
  String status;
  String description;
  List<ChatDto> chats;
  AccountDto seller;
  String sellerName;
  List<ImageDto> imgs;

  DealDto({
    this.id,
    this.title,
    this.category,
    this.price,
    this.status,
    this.description,
    this.chats,
    this.seller,
    this.sellerName,
    this.imgs,
  });

  factory DealDto.fromJson(Map<String, dynamic> json) => _$DealDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DealDtoToJson(this);
}