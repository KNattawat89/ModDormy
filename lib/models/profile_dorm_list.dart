import 'package:json_annotation/json_annotation.dart';
import 'package:moddormy_flutter/models/profile_dorm.dart';

part 'profile_dorm_list.g.dart';

@JsonSerializable()
class ProfileDormList{
  @JsonKey(name:'success')
  bool success;

  @JsonKey(name:'data')
  List<ProfileDorm> data;

  ProfileDormList({
    required this.success,
    required this.data,
  });

  factory ProfileDormList.fromJson(Map<String, dynamic> json) =>
      _$ProfileDormListFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDormListToJson(this);

}