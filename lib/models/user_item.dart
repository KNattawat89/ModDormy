import 'package:json_annotation/json_annotation.dart';

part 'user_item.g.dart';

@JsonSerializable()
class UserItem {
  @JsonKey(name: 'id')
  String userId;

  @JsonKey(name: 'profile_image')
  String? profileImage;

  @JsonKey(name: 'username')
  String username;

  @JsonKey(name: 'fname')
  String firstname;

  @JsonKey(name: 'lname')
  String lastname;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'tel')
  String? telephone;

  @JsonKey(name: 'line_id')
  String? lineId;

  @JsonKey(name: 'user_type')
  String userType;

  @JsonKey(name: 'updated_at')
  DateTime updatedAt;

  UserItem(
      {required this.userId,
      this.profileImage,
      required this.username,
      required this.firstname,
      required this.lastname,
      required this.email,
      this.telephone,
      this.lineId,
      required this.userType,
      required this.updatedAt});
  factory UserItem.fromJson(Map<String, dynamic> json) =>
      _$UserItemFromJson(json);

  Map<String, dynamic> toJson() => _$UserItemToJson(this);

}
