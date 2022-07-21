import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/widgets/custom_appbar.dart';
import 'package:shop_app/features/Cart/Presentation/widgets/add_cart_button.dart';
import 'package:shop_app/features/Cart/Presentation/widgets/cart_beta.dart';
import 'package:shop_app/features/Cart/Presentation/providers/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 18),
          const CustomAppBar('My cart'),
          Expanded(child: Listview(cartProvider: cartProvider)),
          AddCartButton(monto: '\$${cartProvider.totalAmount.ceil()}')
        ],
      ),
    );
  }
}

class Listview extends StatelessWidget {
  const Listview({
    Key? key,
    required this.cartProvider,
  }) : super(key: key);

  final Cart cartProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: cartProvider.items.length,
      itemBuilder: (ctx, i) => CartItemm(
        cartProvider.items.values.toList()[i].id,
        cartProvider.items.keys.toList()[i],
        cartProvider.items.values.toList()[i].price,
        cartProvider.items.values.toList()[i].quantity,
        cartProvider.items.values.toList()[i].title,
      ),
    );
  }
}
