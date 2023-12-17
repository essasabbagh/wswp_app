import '../constants/enums.dart';

class DataInterface {
  final String query;
  final String techType;
  final int paged;
  final String lang;
  final ProductType productType;

  DataInterface({
    required this.query,
    required this.techType,
    this.paged = 1,
    this.lang = 'en',
    this.productType = ProductType.all,
  });
}
