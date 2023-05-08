import 'package:json_annotation/json_annotation.dart';

part 'profile_dorm.g.dart';

@JsonSerializable()
class ProfileDorm {
  @JsonKey(name: 'dormId')
  int dormId;

  @JsonKey(name: 'dormName')
  String dormName;

  @JsonKey(name: 'coverImage')
  String? coverImage;

  @JsonKey(name: 'createdAt')
  DateTime createdAt;

  ProfileDorm(
      {required this.dormId,
        required this.dormName,
        required this.coverImage,
        required this.createdAt});

  factory ProfileDorm.fromJson(Map<String, dynamic> json) =>
      _$ProfileDormFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDormToJson(this);
}