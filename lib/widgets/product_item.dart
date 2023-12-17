import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wswp_app/utils/context_ext.dart';
import 'package:wswp_app/widgets/image_modal.dart';

import '../models/product.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.item,
  });

  final Output? item;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.theme.primaryColorLight.withOpacity(.1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: context.isDark
                  ? Colors.grey.withOpacity(.5)
                  : Colors.grey.withOpacity(.1),
              // color: context.theme.primaryColorLight.computeLuminance() >= 0.5
              //     ? Colors.black
              //     : Colors.white,
              // decoration: BoxDecoration(
              //   color: context.theme.primaryColorLight.withOpacity(.1),
              // ),
              child: CachedNetworkImage(
                // width: context.width / 3,
                imageUrl: item?.image ?? '',
                placeholder: (_, __) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (_, __, ___) => const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline_rounded,
                      size: 32,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'No Image',
                      textAlign: TextAlign.center,
                      // style: context.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Center(
                child: Text(
                  item?.name ?? '',
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleLarge!.copyWith(fontSize: 18),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: item!.evidences!.isEmpty
                      ? () => context.showSnackBar('No Evidences yet !')
                      : () {
                          final evidence = item?.evidences?.first;
                          String imageUrl = evidence?.image ?? '';
                          String webUrl = evidence?.url ?? '';

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullScreenImageModal(
                                imageUrl: imageUrl,
                                webUrl: webUrl,
                                name: '',
                              ),
                            ),
                          );
                        },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: item!.evidences!.isEmpty
                          ? Colors.grey.shade300
                          : Colors.red.shade100,
                    ),
                    child: const Text(
                      'Evidences',
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: item!.alternatives!.isEmpty
                      ? () => context.showSnackBar('No Alternatives yet !')
                      : () {
                          final alternative = item?.alternatives?.first;
                          String imageUrl = alternative?.image ?? '';
                          String name = alternative?.name ?? '';

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullScreenImageModal(
                                imageUrl: imageUrl,
                                webUrl: '',
                                name: name,
                              ),
                            ),
                          );
                        },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: item!.alternatives!.isEmpty
                          ? Colors.grey.shade300
                          : Colors.green.shade100,
                    ),
                    child: const Text(
                      'Alternatives',
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
          // GridTile(
          //   header: Text(item?.name ?? ''),
          //   footer: Text(item?.name ?? ''),
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Image(image: NetworkImage(item?.image ?? '')),
          //   ),
          //   // child: Text(data[index]
          //   //     ['image']), //just for testing, will fill with image later
          // ),
        ],
      ),
    );
  }
}
