import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:wswp_app/themes/dark_theme.dart';
import 'package:wswp_app/themes/light_theme.dart';

import 'constants/langs.dart';
import 'generated/l10n.dart';
import 'providers/app_provider.dart';
import 'screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return MaterialApp(
      title: 'WSWP',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeAnimationCurve: Curves.bounceIn,
      themeAnimationDuration: const Duration(milliseconds: 200),
      themeMode: appProvider.themeMode,
      locale: appProvider.appLocale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: langs.map((e) => e.locale),
      // supportedLocales: const [
      //   Locale('en', ''),
      //   Locale('ar', ''),
      //   Locale('tr', ''),
      // ],
      home: const HomeScreen(),
      // home: const SearchScreen(),
    );
  }
}

class SearchResult {
  final String title;
  final String imageUrl;

  SearchResult({required this.title, required this.imageUrl});
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<SearchResult> _results = [];
  bool _isLoading = false;
  int _page = 1; // Keep track of the page for pagination

  // Simulated function to fetch search results
  Future<List<SearchResult>> _fetchResults(int page) async {
    // Simulated API call or data fetching mechanism
    // Replace this with your actual data fetching logic
    await Future.delayed(const Duration(seconds: 2)); // Simulating delay
    List<SearchResult> newResults = List.generate(
      10,
      (index) => SearchResult(
        title: 'Result ${index + 1 + (page - 1) * 10}',
        imageUrl: 'https://via.placeholder.com/150', // Example image URL
      ),
    );
    return newResults;
  }

  // Function to load more results
  Future<void> _loadMore() async {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });

      List<SearchResult> newResults = await _fetchResults(_page);

      setState(() {
        _results.addAll(newResults);
        _isLoading = false;
        _page++; // Increment page for the next fetch
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadMore(); // Initially load results
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMore(); // Load more results when scrolled to the bottom
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      itemCount: _results.length + 1,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        if (index < _results.length) {
          return _buildResultItem(_results[index]);
        } else {
          return _buildLoader(); // Show a loader at the end of the grid
        }
      },
    );
  }

  Widget _buildResultItem(SearchResult result) {
    return GridTile(
      footer: GridTileBar(
        title: Text(result.title),
      ),
      child: Image.network(result.imageUrl, fit: BoxFit.cover),
    );
  }

  Widget _buildLoader() {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container();
  }
}
