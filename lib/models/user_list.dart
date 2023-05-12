import 'package:json_annotation/json_annotation.dart';
import 'package:moddormy_flutter/models/user_item.dart';

part 'user_list.g.dart';

@JsonSerializable()
class UserList {
  @JsonKey(name:'success')
  bool success;

  @JsonKey(name:'data')
  List<UserItem> data;

  UserList({
    required this.success,
    required this.data,
  });

  factory UserList.fromJson(Map<String, dynamic> json) =>
      _$UserListFromJson(json);

  Map<String, dynamic> toJson() => _$UserListToJson(this);

}