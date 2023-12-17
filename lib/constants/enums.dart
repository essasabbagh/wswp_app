enum SearchState {
  loading,
  idle,
  noData,
  data,
  error,
  noMore,
}

enum ProductType {
  all,
  israeli,
  supportingIsrael,
}

extension ProductTypeExtension on ProductType {
  String get type => switch (this) {
        ProductType.all => 'all',
        ProductType.israeli => 'israeli',
        ProductType.supportingIsrael => 'supporting-israel',
      };
}
