import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ShoppingApp/widgets/app_drawer.dart';
import 'package:ShoppingApp/widgets/user_product_item.dart';
import 'package:ShoppingApp/providers/products.dart';
import 'package:ShoppingApp/screens/edit_product_screen.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Your Products"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              })
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemBuilder: (_, i) => Column(
              children: [
                UserProductItem(
                  productData.items[i].id,
                  productData.items[i].title,
                  productData.items[i].imageUrl,
                ),
                Divider()
              ],
            ),
            itemCount: productData.items.length,
          ),
        ),
      ),
    );
  }
}
