import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/widgets/custom_appbar.dart';
import 'package:shop_app/features/Cart/Presentation/providers/orders.dart'
    show Orders;
import 'package:shop_app/features/Cart/Presentation/widgets/order_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 18),
          const CustomAppBar('My Orders'),
          Expanded(
              child: ListView.builder(
            itemCount: orderData.orders.length,
            itemBuilder: (context, index) => OrderItem(orderData.orders[index]),
          ))
        ],
      ),
    );
  }
}
