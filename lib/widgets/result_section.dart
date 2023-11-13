import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/enums.dart';
import '../providers/app_provider.dart';

class ResultSection extends StatelessWidget {
  const ResultSection({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

     switch (appProvider.searchState) {
      case SearchState.loading:
        return const CircularProgressIndicator.adaptive(); // Show a loading indicator
      case SearchState.noData:
        return const Text('No data found');
      case SearchState.data:
        return Expanded(
          child: ListView.builder(
            itemCount: appProvider.searchResults.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(appProvider.searchResults[index]['title']),
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