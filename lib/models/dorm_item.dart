import 'package:json_annotation/json_annotation.dart';

part 'dorm_item.g.dart';

@JsonSerializable()
class DormItem {
  @JsonKey(name: 'dorm_id')
  int dormId;

  @JsonKey(name: 'dorm_name')
  String dormName;

  @JsonKey(name: 'cover_image')
  String coverImage;

  @JsonKey(name: 'overall_rate')
  int overallRate;

  @JsonKey(name: 'min_price')
  int minPrice;

  @JsonKey(name: 'max_price')
  int maxPrice;

  @JsonKey(name:'fav_status')
  bool isFav;

  DormItem({
    required this.dormId,
    required this.dormName,
    required this.coverImage,
    required this.overallRate,
    required this.minPrice,
    required this.maxPrice,
    required this.isFav
  });

  factory DormItem.fromJson(Map<String, dynamic> json) =>
      _$DormItemFromJson(json);

  Map<String, dynamic> toJson() => _$DormItemToJson(this);
}