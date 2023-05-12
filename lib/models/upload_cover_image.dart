import 'package:json_annotation/json_annotation.dart';

part 'upload_cover_image.g.dart';

@JsonSerializable()
class UploadCoverImage {
  @JsonKey(name: 'image')
  String image;

  UploadCoverImage({
    required this.image,
  });

  factory UploadCoverImage.fromJson(Map<String, dynamic> json) =>
      _$UploadCoverImageFromJson(json);

  Map<String, dynamic> toJson() => _$UploadCoverImageToJson(this);
}
