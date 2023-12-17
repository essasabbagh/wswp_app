import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:wswp_app/models/product.dart';
import 'package:wswp_app/utils/context_ext.dart';

import '../constants/enums.dart';
import '../di.dart';
import '../interfaces/data_interface.dart';
import '../providers/app_provider.dart';
import '../services/search_service.dart';
import 'loading_widget.dart';
import 'product_item.dart';
/* 
class ResultSection extends StatefulWidget {
  const ResultSection({super.key});

  @override
  State<ResultSection> createState() => _ScrollControllerDemoState();
}

class _ScrollControllerDemoState extends State<ResultSection> {
  ScrollController scrollController = ScrollController();
  bool isLastPage = false;
  int pageNumber = 1;
  bool error = false;
  bool loading = true;
  List<Output> posts = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      // nextPageTrigger will have a value equivalent to 80% of the list size.
      var nextPageTrigger = 0.8 * scrollController.position.maxScrollExtent;

      // _scrollController fetches the next paginated data when the current postion of the user on the screen has surpassed
      if (scrollController.position.pixels > nextPageTrigger) {
        loading = true;
        fetchData();
      }
    });

    return buildPostsView();
  }

  Widget buildPostsView() {
    if (posts.isEmpty) {
      if (loading) {
        return const Center(
            child: Padding(
          padding: EdgeInsets.all(8),
          child: CircularProgressIndicator(),
        ));
      } else if (error) {
        return const Center(child: Text('Error occurred'));
      }
    }
    return ListView.builder(
        controller: scrollController,
        itemCount: posts.length + (isLastPage ? 0 : 1),
        itemBuilder: (context, index) {
          if (index == posts.length) {
            if (error) {
              return const Center(child: Text('Error occurred'));
            } else {
              return const Center(
                  child: Padding(
                padding: EdgeInsets.all(8),
                child: CircularProgressIndicator(),
              ));
            }
          }

          final Output post = posts[index];
          return Padding(
            padding: const EdgeInsets.all(15.0),
            // child: PostItem(post.title, post.body),
            child: Text(
              post.name ?? '',
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge,
            ),
          );
        });
  }

  void fetchData() async {
    try {
      final searchService = locator<SearchService>();
      final res = await searchService.fetchData(
        DataInterface(
          query: 'notion',
          // productType: productType,
          paged: 1,
          techType: '',
          // lang: _appLocale.countryCode ?? 'en',
        ),
      );

      posts = res.output ?? [];
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}
 */

class ResultSection extends StatelessWidget {
  const ResultSection({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: appProvider.results.length + 1,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (context.orientation == Orientation.portrait) ? 2 : 3,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (BuildContext context, int index) {
        if (index < appProvider.results.length) {
          return ItemCard(item: appProvider.results[index]);
        } else {
          // return const Center(
          //   child: CircularProgressIndicator(),
          // );
          return appProvider.isLoading
              ? const LoadingWidget()
              : const SizedBox(); // Show a loader at the end of the grid
        }
      },
    );
    /* 
    switch (appProvider.searchState) {
      case SearchState.loading:
        return const CircularProgressIndicator
            .adaptive(); // Show a loading indicator
      case SearchState.noData:
        return const Text('No data found');
      case SearchState.data:
        // return ListView.builder(
        //   itemCount: appProvider.searchResults.length,
        //   itemBuilder: (context, index) {
        //     return ListTile(
        //       title: Text(appProvider.searchResults[index]['title']),
        //       // Display other product information as needed
        //     );
        //   },
        // );
        return GridView.builder(
          itemCount: appProvider.searchResult.output?.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (context.orientation == Orientation.portrait) ? 2 : 3),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: GridTile(
                child: Text(appProvider.searchResult.output?[index].image ?? ''),
                // footer: Text(data[index]['name']),
                // child: Text(data[index]
                //     ['image']), //just for testing, will fill with image later
              ),
            );
          },
        );
      case SearchState.idle:
        return const Center(child: Text('idle')); // Show an error message
      case SearchState.error:
        return const Text('Error occurred'); // Show an error message
      default:
        return const SizedBox(); // Return an empty widget by default
    }
  */
  }
}
