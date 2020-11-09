import 'package:ShoppingApp/providers/cart.dart';
import 'package:ShoppingApp/providers/orders.dart';
import 'package:ShoppingApp/screens/product_detail_screen.dart';
import 'package:ShoppingApp/screens/products_overview_screen.dart';
import 'screens/user_products_screen.dart';
import 'providers/products.dart';
import 'package:provider/provider.dart';
import 'screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'screens/orders_screen.dart';
import 'package:ShoppingApp/screens/edit_product_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => Products(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => Cart(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => Orders(),
          ),
        ],
        child: MaterialApp(
          title: 'Shopping App',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Lato',
          ),
          home: ProductsOverviewScreen(),
          debugShowCheckedModeBanner: false,
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
          },
        ));
  }
}
