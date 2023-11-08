import 'dart:async';

import 'package:flutter/material.dart';

import 'package:rxdart/rxdart.dart';

import '../di.dart';
import '../services/search_service.dart';

enum SearchState {
  loading,
  idle,
  noData,
  data,
  error,
  noMore,
}

class SearchProvider with ChangeNotifier {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _searchResults = [];
  final _searchSubject = BehaviorSubject<String>();
  late StreamSubscription _searchSubscription;

  SearchProvider() {
    _searchSubscription = _searchSubject
        .debounceTime(const Duration(milliseconds: 200))
        .distinct()
        .listen((query) {
      _searchProducts(query);
    });
  }

  TextEditingController get searchController => _searchController;

  List<dynamic> get searchResults => _searchResults;
  SearchState _searchState = SearchState.idle;

  SearchState get searchState => _searchState;

  // Future<void> _searchProducts(String query) async {
  //   final String apiUrl =
  //       'https://api.example.com/products?query=$query'; // Replace with your API endpoint

  //   final searchService = locator<SearchService>();
  //   final response = await searchService.searchProducts(apiUrl);

  //   notifyListeners();
  // }

  Future<void> _searchProducts(String query) async {
    final String apiUrl =
        'https://api.example.com/products?query=$query'; // Replace with your API endpoint

    try {
      final searchService = locator<SearchService>();
      final response = await searchService.searchProducts(apiUrl);

      _searchResults = response;
      _searchState = _searchResults.isEmpty ? SearchState.noData : SearchState.data;
      notifyListeners();
    } catch (e) {
      _searchState = SearchState.error;
      debugPrint('Error: $e');
      notifyListeners();
    }

    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchSubject.add(query);
  }

  @override
  void dispose() {
    _searchSubscription.cancel();
    _searchSubject.close();
    super.dispose();
  }
}
