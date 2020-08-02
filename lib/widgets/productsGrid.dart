import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:ShoppingApp/widgets/product_item.dart';
import 'package:ShoppingApp/providers/products_provider.dart';

class ProductsGrid extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final productsData=Provider.of<Products>(context);
    final products=productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ProductItem(
        products[i].id,
        products[i].title,
        products[i].imageUrl,
      ),
    );
  }
}
