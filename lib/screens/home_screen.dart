import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/app_provider.dart';
import '../widgets/main_appbar.dart';
import '../widgets/main_drawer.dart';
import '../widgets/result_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: const MainAppbar(),
      drawer: const MainDrawer(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.qr_code),
        onPressed: () {},
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: appProvider.searchController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: "Type in your text",
                      filled: true,
                      fillColor: Colors.white70,
                    ),
                    onChanged: appProvider.setSearchQuery,
                    onSubmitted: appProvider.setSearchQuery,
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
          const Expanded(
            child: Center(
              child: ResultSection(),
            ),
          ),
        ],
      ),
    );
  }
}
