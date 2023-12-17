import 'dart:async';

import 'package:flutter/material.dart';

import 'package:rxdart/rxdart.dart';

import '../constants/constants.dart';
import '../constants/enums.dart';
import '../di.dart';
import '../interfaces/data_interface.dart';
import '../models/product.dart';
import '../services/search_service.dart';

final searchService = locator<SearchService>();

class AppProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  Locale _appLocale = const Locale('en'); // Default locale

  ThemeMode get themeMode => _themeMode;
  Locale get appLocale => _appLocale;

  void changeTheme(ThemeMode value) {
    _themeMode = value;
    notifyListeners();
  }

  void changeLanguage(Locale newLocale) {
    _appLocale = newLocale;
    notifyListeners();
  }

  final _searchSubject = BehaviorSubject<String>();
  late StreamSubscription _searchSubscription;

  AppProvider() {
    _searchSubscription =
        _searchSubject.debounceTime(duration).distinct().listen(_searchProducts);
    scrollController.addListener(() {
      // print('SCROLLCONTROLLER.POSITION.PIXELS: ${scrollController.position.pixels}');
      // print(
      //     'SCROLLCONTROLLER.POSITION.MAXSCROLLEXTENT: ${scrollController.position.maxScrollExtent}');
      // print(
      //     ' ${scrollController.position.pixels == scrollController.position.maxScrollExtent}');
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print('sdasdasdasdasd========================asdasdadsad');
        _searchProducts(searchController.text);
        // _loadMore(); // Load more results when scrolled to the bottom
      }
    });
    search();
  }

  final TextEditingController searchController = TextEditingController();

  final ScrollController scrollController = ScrollController();

  List<Output> _results = [];
  List<Output> get results => _results;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _page = 1;
  int get page => _page;

  // Keep track of the page for pagination

  ProductType _productType = ProductType.all;
  ProductType get productType => _productType;

  String _techType = 'all';

  String get techType => _techType;

  Future<void> _searchProducts(String data) async {
    if (isLoading) return;
    try {
      _isLoading = true;
      final res = await searchService.fetchData(
        DataInterface(
          query: data,
          productType: productType,
          paged: page,
          techType: techType,
          lang: _appLocale.countryCode ?? 'en',
        ),
      );

      if (res.output?.isNotEmpty ?? false) {
        _results.addAll(res.output ?? []);
        _page++; // Increment page for the next fetch
      }

      notifyListeners();
    } catch (e) {
      debugPrint('Error: $e');
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void search() {
    reset();
    _searchSubject.add(searchController.text);
    notifyListeners();
  }

  void setProductType(ProductType value) {
    reset();
    _productType = value;
    notifyListeners();
    _searchProducts(searchController.text);
  }

  void setTechType(String value) {
    reset();
    _techType = value;
    notifyListeners();
    _searchProducts(searchController.text);
  }

  void reset() {
    _page = 1;
    _results = [];
    notifyListeners();
  }

  @override
  void dispose() {
    _searchSubscription.cancel();
    _searchSubject.close();
    searchController.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
