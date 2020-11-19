import 'package:ShoppingApp/widgets/app_drawer.dart';
import 'package:ShoppingApp/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:ShoppingApp/providers/orders.dart' show Orders;
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      body: ListView.builder(
        itemCount: orderData.order.length,
        itemBuilder: (ctx, i) => OrderItem(orderData.order[i]),
      ),
      drawer: AppDrawer(),
    );
  }
}
