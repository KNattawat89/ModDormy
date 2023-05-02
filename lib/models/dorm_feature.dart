class DormFeature {
  bool parking;
  bool wifi;
  bool smokeFree;
  bool securityGuard;
  bool cctv;
  bool keycard;
  bool lift;
  bool petFriendly;
  bool pool;
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
}
