import 'package:app/providers/products.dart';
import 'package:app/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = productData.items;
    // print(products.length);
    return GridView.builder(
      padding: const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 5,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 5 / 8,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(),
      ),
      itemCount: 6,
    );
  }
}
