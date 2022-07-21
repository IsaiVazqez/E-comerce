import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/features/Cart/Presentation/providers/orders.dart'
    as ord;

class OrderItem extends StatelessWidget {
  final ord.OrderItem? order;
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${order!.amount}'),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(order!.dateTime),
            ),
            trailing: IconButton(
              icon: const Icon(CupertinoIcons.arrow_down_circle),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
