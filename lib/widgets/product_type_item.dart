
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../constants/enums.dart';
import '../providers/app_provider.dart';

class ProductTypeItem extends StatelessWidget {
  const ProductTypeItem({
    super.key,
    required this.productType,
  });
  final ProductType productType;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Expanded(
      child: GestureDetector(
          onTap: () => appProvider.setProductType(productType),
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: appProvider.productType == productType
                  ? Colors.blue
                  : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              productType.name.toUpperCase(),
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: appProvider.productType == productType
                    ? Colors.white
                    : Colors.black87,
                // fontWeight: FontWeight.bold,
                // fontSize: 18,
              ),
            ),
          )),
    );
  }
}
