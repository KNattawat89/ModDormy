import 'package:json_annotation/json_annotation.dart';

part 'dorm_feature.g.dart';

@JsonSerializable()
class DormFeature {
  @JsonKey(name: 'parking')
  bool parking;
  @JsonKey(name: 'wifi')
  bool wifi;
  @JsonKey(name: 'smokeFree')
  bool smokeFree;
  @JsonKey(name: 'securityGuard')
  bool securityGuard;
  @JsonKey(name: 'cctv')
  bool cctv;
  @JsonKey(name: 'keyCard')
  bool keycard;
  @JsonKey(name: 'lift')
  bool lift;
  @JsonKey(name: 'pet')
  bool petFriendly;
  @JsonKey(name: 'pool')
  bool pool;
  @JsonKey(name: 'fitness')
  bool fitness;

  List<String> toList() {
    List<String> list = [];
    if (parking) list.add('Parking');
    if (wifi) list.add('Wifi');
    if (smokeFree) list.add('Smoke free');
    if (securityGuard) list.add('Security guard');
    if (cctv) list.add('CCTV');
    if (keycard) list.add('Keycard');
    if (lift) list.add('Lift');
    if (petFriendly) list.add('Pet friendly');
    if (pool) list.add('Pool');
    if (fitness) list.add('Fitness');
    return list;
  }

  DormFeature({
    required this.parking,
    required this.wifi,
    required this.smokeFree,
    required this.securityGuard,
    required this.cctv,
    required this.keycard,
    required this.lift,
    required this.petFriendly,
    required this.pool,
    required this.fitness,
  });

  factory DormFeature.fromJson(Map<String, dynamic> json) =>
      _$DormFeatureFromJson(json);

  Map<String, dynamic> toJson() => _$DormFeatureToJson(this);
}
