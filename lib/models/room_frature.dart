class RoomFeature {
  bool airConditioner;
  bool fan;
  bool furnished;
  bool waterHeater;
  bool tv;
  bool refrigerator;
  bool bathroom;

  List<String> roomFeatureToList(){
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
}
