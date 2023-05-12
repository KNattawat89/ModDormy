import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Imagestring {
  @JsonKey(name: 'file_name')
  String image;

  Imagestring({
    required this.image,
  });

  factory Imagestring.fromJson(Map<String, dynamic> json) =>
      _$ImagestringFromJson(json);

  Map<String, dynamic> toJson() => _$ImagestringToJson(this);
}
