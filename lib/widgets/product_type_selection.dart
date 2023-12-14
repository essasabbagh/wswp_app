import 'package:flutter/material.dart';

import 'package:wswp_app/constants/enums.dart';

import 'product_type_item.dart';

class ProductTypeSelector extends StatelessWidget {
  const ProductTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ProductTypeItem(productType: ProductType.all),
          ProductTypeItem(productType: ProductType.israili),
          ProductTypeItem(productType: ProductType.nonIsraili),
        ],
      ),
    );
  }
}
