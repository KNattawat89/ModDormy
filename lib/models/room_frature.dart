import 'package:json_annotation/json_annotation.dart';

part 'room_frature.g.dart';

@JsonSerializable()
class RoomFeature {
  @JsonKey(name: 'airc')
  bool airConditioner;
  @JsonKey(name: 'fan')
  bool fan;
  @JsonKey(name: 'furniture')
  bool furnished;
  @JsonKey(name: 'waterHeater')
  bool waterHeater;
  @JsonKey(name: 'tv')
  bool tv;
  @JsonKey(name: 'fridge')
  bool refrigerator;
  @JsonKey(name: 'bathroom')
  bool bathroom;

  List<String> roomFeatureToList() {
    List<String> list = [];
    if (airConditioner) list.add('Air conditioner');
    if (fan) list.add('Fan');
    if (furnished) list.add('Furnished');
    if (waterHeater) list.add('Water heater');
    if (tv) list.add('TV');
    if (refrigerator) list.add('Refrigerator');
    if (bathroom) list.add('Bathroom');
    return list;
  }

  RoomFeature(
      {required this.airConditioner,
      required this.fan,
      required this.furnished,
      required this.waterHeater,
      required this.tv,
      required this.refrigerator,
      required this.bathroom});

  factory RoomFeature.fromJson(Map<String, dynamic> json) =>
      _$RoomFeatureFromJson(json);

  Map<String, dynamic> toJson() => _$RoomFeatureToJson(this);
}
