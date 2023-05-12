class ReviewM {
  final String userId;
  final String dormId;
  final String reviewId;
  final String reviewText;
  final DateTime createDate;
  final int priceRate;
  final int locationRate;
  final int facilityRate;
  final int sanitaryRate;
  final int securityRate;
  final int overallRate;

  ReviewM({
    required this.userId,
    required this.dormId,
    required this.reviewId,
    required this.reviewText,
    required this.createDate,
    required this.priceRate,
    required this.locationRate,
    required this.facilityRate,
    required this.sanitaryRate,
    required this.securityRate,
    required this.overallRate,
  });
}

List<ReviewM> generateMockReviews() {
  return [
    ReviewM(
      userId: 'user123',
      dormId: 'dorm456',
      reviewId: 'review1',
      reviewText: 'Great dorm, would definitely recommend!',
      createDate: DateTime.now().subtract(const Duration(days: 10)),
      priceRate: 4,
      locationRate: 5,
      facilityRate: 5,
      sanitaryRate: 4,
      securityRate: 5,
      overallRate: 5,
    ),
    ReviewM(
      userId: 'user456',
      dormId: 'dorm123',
      reviewId: 'review2',
      reviewText: 'Decent dorm, nothing too special.',
      createDate: DateTime.now().subtract(const Duration(days: 5)),
      priceRate: 3,
      locationRate: 4,
      facilityRate: 3,
      sanitaryRate: 3,
      securityRate: 4,
      overallRate: 3,
    ),
    ReviewM(
      userId: 'user789',
      dormId: 'dorm456',
      reviewId: 'review3',
      reviewText: 'Terrible dorm, would not recommend!',
      createDate: DateTime.now().subtract(const Duration(days: 2)),
      priceRate: 1,
      locationRate: 2,
      facilityRate: 1,
      sanitaryRate: 1,
      securityRate: 2,
      overallRate: 1,
    ),
  ];
}
