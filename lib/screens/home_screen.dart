import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/search_provider.dart';

class ProductSearchPage extends StatelessWidget {
  const ProductSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('WSWP'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share_rounded),
          )
        ],
      ),
      drawer: const Drawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchProvider.searchController,
                    decoration: const InputDecoration(
                      labelText: 'Search for products',
                    ),
                    onChanged: (value) {
                      searchProvider.setSearchQuery(value);
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    // Implement filter functionality
                  },
                ),
              ],
            ),
          ),
          _buildSearchStateWidget(
              searchProvider.searchState, searchProvider.searchResults),
        ],
      ),
    );
  }

  Widget _buildSearchStateWidget(
      SearchState searchState, List<dynamic> searchResults) {
    switch (searchState) {
      case SearchState.loading:
        return const CircularProgressIndicator(); // Show a loading indicator
      case SearchState.noData:
        return const Text('No data found');
      case SearchState.data:
        return Expanded(
          child: ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(searchResults[index]['productName']),
                // Display other product information as needed
              );
            },
          ),
        );
      case SearchState.error:
        return const Text('Error occurred'); // Show an error message
      default:
        return const SizedBox(); // Return an empty widget by default
    }
  }
}
