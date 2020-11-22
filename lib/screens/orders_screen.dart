import 'package:ShoppingApp/widgets/app_drawer.dart';
import 'package:ShoppingApp/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:ShoppingApp/providers/orders.dart' show Orders;
import 'package:provider/provider.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/orders';

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  var _isLoading = false;

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    Provider.of<Orders>(context, listen: false)
        .fetchAndSetOrders()
        .then((value) => setState(() {
              _isLoading = false;
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      body: _isLoading
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: orderData.order.length,
              itemBuilder: (ctx, i) => OrderItem(orderData.order[i]),
            ),
      drawer: AppDrawer(),
    );
  }
}
