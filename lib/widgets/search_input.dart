import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/app_provider.dart';

import 'product_type_selection.dart';

class SearchInput extends StatelessWidget implements PreferredSize {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
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
            const SizedBox(width: 8),
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.filter_list),
              ),
              onTap: () {
                // Implement filter functionality
              },
            ),
          ],
        ),
      ),
      const ProductTypeSelector()
    ]);
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 110);
}
