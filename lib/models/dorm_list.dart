import 'package:json_annotation/json_annotation.dart';
import 'package:moddormy_flutter/models/dorm_item.dart';

part 'dorm_list.g.dart';

@JsonSerializable()
class DormList {
  @JsonKey(name:'success')
  bool success;

  @JsonKey(name:'data')
  List<DormItem> data;

  DormList({
    required this.success,
    required this.data,
});

  factory DormList.fromJson(Map<String, dynamic> json) =>
      _$DormListFromJson(json);

  Map<String, dynamic> toJson() => _$DormListToJson(this);

}