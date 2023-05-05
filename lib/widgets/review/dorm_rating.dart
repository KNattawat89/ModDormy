import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:moddormy_flutter/widgets/review/review_mockup.dart';

List<ReviewM> reviews = generateMockReviews();

class DormRating extends StatelessWidget {
  const DormRating({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, double> averageRates = _calculateAverageRates(reviews);
    double overallRate = averageRates['overall']!;
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        height: MediaQuery.of(context).size.height * 0.25,
        child: Card(
          color: const Color(0xffDFDADA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //left side
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Overall Rating'),
                  Text(overallRate.toStringAsFixed(1),
                      style: const TextStyle(
                          fontSize: 48, fontWeight: FontWeight.bold)),
                  RatingBarIndicator(
                    rating: averageRates['overall']!,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                  Text(
                    'Based on ${reviews.length} reviews',
                    style: const TextStyle(fontSize: 12),
                  )
                ],
              ),

              //divider
              const VerticalDivider(
                color: Colors.white,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),

              //right side
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildRatingRow('Price', averageRates['price']!),
                  _buildRatingRow('Location', averageRates['location']!),
                  _buildRatingRow('Facility', averageRates['facility']!),
                  _buildRatingRow('Sanitary', averageRates['sanitary']!),
                  _buildRatingRow('Security', averageRates['security']!),
                ],
              )
            ],
          ),
        ));
  }
}

Map<String, double> _calculateAverageRates(List<ReviewM> reviews) {
  int sumPriceRate = 0;
  int sumLocationRate = 0;
  int sumFacilityRate = 0;
  int sumSanitaryRate = 0;
  int sumSecurityRate = 0;
  int sumOverallRate = 0;

  for (ReviewM review in reviews) {
    sumPriceRate += review.priceRate;
    sumLocationRate += review.locationRate;
    sumFacilityRate += review.facilityRate;
    sumSanitaryRate += review.sanitaryRate;
    sumSecurityRate += review.securityRate;
    sumOverallRate += review.overallRate;
  }

  int numberOfReviews = reviews.length;
  double averagePriceRate = sumPriceRate / numberOfReviews;
  double averageLocationRate = sumLocationRate / numberOfReviews;
  double averageFacilityRate = sumFacilityRate / numberOfReviews;
  double averageSanitaryRate = sumSanitaryRate / numberOfReviews;
  double averageSecurityRate = sumSecurityRate / numberOfReviews;
  double averageOverallRate = sumOverallRate / numberOfReviews;

  return {
    'price': averagePriceRate,
    'location': averageLocationRate,
    'facility': averageFacilityRate,
    'sanitary': averageSanitaryRate,
    'security': averageSecurityRate,
    'overall': averageOverallRate,
  };
}

Widget _buildRatingRow(String label, double score) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        score.toStringAsFixed(1),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
    ],
  );
}