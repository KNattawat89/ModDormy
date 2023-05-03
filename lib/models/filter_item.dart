
class FilterItem {
  int minPrice;
  int maxPrice;
  double distant;
  String overallRating;
  List<String> facilities;
  FilterItem({
    required this.minPrice,
    required this.maxPrice,
    required this.distant,
    required this.overallRating,
    required this.facilities
});
}