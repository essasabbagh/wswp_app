import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../constants/enums.dart';
import '../providers/app_provider.dart';
import '../widgets/main_appbar.dart';

class ProductSearchPage extends StatelessWidget {
  const ProductSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: const MainAppbar(),
      drawer: const Drawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: appProvider.searchController,
                    decoration: InputDecoration(
                      // labelText: 'Search for products',
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      // hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Type in your text",
                      filled: true,
                      fillColor: Colors.white70,
                    ),
                    onChanged: appProvider.setSearchQuery,
                    // onChanged: (value) => appProvider.setSearchQuery(value),
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
            appProvider.searchState,
            appProvider.searchResults,
          ),
        ],
      ),
    );
  }

  Widget _buildSearchStateWidget(SearchState searchState, List<dynamic> searchResults) {
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
