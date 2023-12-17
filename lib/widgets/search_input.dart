import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:wswp_app/constants/constants.dart';
import 'package:wswp_app/utils/context_ext.dart';

import '../providers/app_provider.dart';

import 'product_type_selection.dart';

class SearchInput extends StatelessWidget implements PreferredSize {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: appProvider.searchController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  border: OutlineInputBorder(
                    // borderSide: const BorderSide(width: .5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: "Search about ...",
                  filled: true,
                  // fillColor: Colors.white70,
                  fillColor: context.theme.canvasColor,
                  suffixIcon: appProvider.searchController.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            appProvider.searchController.clear();
                            appProvider.search();
                          },
                          icon: const Icon(Icons.clear),
                        )
                      : null,
                ),
                onChanged: (_) => appProvider.search(),
                onSubmitted: (_) => appProvider.search(),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: context.theme.iconTheme.color!,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    if (appProvider.techType != 'all')
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    const Icon(Icons.filter_list),
                  ],
                ),
              ),
              onTap: () {
                // Implement filter functionality
                _showBottomSheet(context);
              },
            ),
          ],
        ),
      ),
      const ProductTypeSelector()
    ]);
  }

  void _showBottomSheet(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            color: const Color.fromRGBO(0, 0, 0, 0.001),
            child: DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.2,
              maxChildSize: 0.75,
              builder: (_, controller) {
                return Container(
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    color: context.theme.canvasColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.remove,
                        color: Colors.grey[600],
                      ),
                      Expanded(
                        child: ListView.builder(
                          controller: controller,
                          itemCount: techTypes.length,
                          itemBuilder: (_, index) {
                            final techType =
                                techTypes[index].isEmpty ? 'All' : techTypes[index];

                            return GestureDetector(
                              onTap: () {
                                appProvider.setTechType(techType);
                                Navigator.of(context).pop();
                              },
                              child: Card(
                                elevation: 1,
                                shadowColor: Colors.black.withOpacity(.1),
                                color: context.theme.dialogBackgroundColor,
                                shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 4,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    techType,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 110);
}
