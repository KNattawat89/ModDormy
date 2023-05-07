import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moddormy_flutter/models/review.dart';

import 'package:moddormy_flutter/widgets/review/review_mockup.dart';

//List<ReviewM> reviews = generateMockReviews();

class DormRating extends StatelessWidget {
  final List<Review> reviews;
  const DormRating({super.key, required this.reviews});

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
                      color: Color(0xffDC6E46),
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
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: fiveRates(averageRates))
            ],
          ),
        ));
  }
}

Map<String, double> _calculateAverageRates(List<Review> reviews) {
  int sumPriceRate = 0;
  int sumLocationRate = 0;
  int sumFacilityRate = 0;
  int sumSanitaryRate = 0;
  int sumSecurityRate = 0;
  int sumOverallRate = 0;

  for (Review review in reviews) {
    sumPriceRate += review.ratingPrice;
    sumLocationRate += review.ratingLocation;
    sumFacilityRate += review.ratingFacility;
    sumSanitaryRate += review.ratingSanitary;
    sumSecurityRate += review.ratingSanitary;
    sumOverallRate += review.ratingOverall;
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

Widget fiveRates(Map<String, double> averageRates) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: [
          Text(
            averageRates['price']!.toStringAsFixed(1),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          Text(averageRates['location']!.toStringAsFixed(1),
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
          Text(averageRates['facility']!.toStringAsFixed(1),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              )),
          Text(averageRates['sanitary']!.toStringAsFixed(1),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              )),
          Text(averageRates['security']!.toStringAsFixed(1),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              )),
        ],
      ),
      const SizedBox(
        width: 10,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Price',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              )),
          Text('Location',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              )),
          Text('Facility',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              )),
          Text('Sanitary',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              )),
          Text('Security',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              )),
        ],
      ),
    ],
  );
}
