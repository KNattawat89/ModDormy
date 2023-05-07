import 'package:json_annotation/json_annotation.dart';
import 'package:moddormy_flutter/models/user_item.dart';
part 'review.g.dart';

@JsonSerializable()
class Review {
  @JsonKey(name: 'review')
  String review;

  @JsonKey(name: 'ratingPrice')
  int ratingPrice;

  @JsonKey(name: 'ratingLocation')
  int ratingLocation;

  @JsonKey(name: 'ratingFacility')
  int ratingFacility;

  @JsonKey(name: 'ratingSanitary')
  int ratingSanitary;

  @JsonKey(name: 'ratingSecurity')
  int ratingSecurity;

  @JsonKey(name: 'ratingOverall')
  int ratingOverall;

  @JsonKey(name: 'userId')
  String? userId;

  @JsonKey(name: 'createdAt')
  DateTime? createdAt;

  @JsonKey(name: 'user')
  UserItem? user;

  @JsonKey(name: 'dormId')
  int dormId;

  @JsonKey(name: 'id')
  int reviewId;

  Review(
      {required this.review,
      required this.ratingPrice,
      required this.ratingLocation,
      required this.ratingFacility,
      required this.ratingSanitary,
      required this.ratingSecurity,
      required this.ratingOverall,
      required this.userId,
      required this.user,
      required this.createdAt,
      required this.dormId,
      required this.reviewId});

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
