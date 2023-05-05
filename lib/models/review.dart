class Review {
  String review;
  int priceRate;
  int locationRate;
  int facilityRate;
  int sanitaryRate;
  int securityRate;
  double overallRate;

  Review({
    required this.review,
    required this.priceRate,
    required this.locationRate,
    required this.facilityRate,
    required this.sanitaryRate,
    required this.securityRate,
    required this.overallRate,
  });

  static fromJson(json) {}
}
