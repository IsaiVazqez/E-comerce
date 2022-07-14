import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/features/Cart/Presentation/widgets/add_cart_button.dart';
import 'package:shop_app/features/Cart/Presentation/widgets/cart_beta.dart';
import 'package:shop_app/features/Products/data/models/product.dart';
import 'package:shop_app/features/Products/presentation/provider/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(183, 148, 246, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.items.length,
              itemBuilder: (ctx, i) => CartItemm(
                cartProvider.items.values.toList()[i].id,
                cartProvider.items.keys.toList()[i],
                cartProvider.items.values.toList()[i].price,
                cartProvider.items.values.toList()[i].quantity,
                cartProvider.items.values.toList()[i].title,
              ),
            ),
          ),
          AddCartButton(monto: '\$${cartProvider.totalAmount.ceil()}')
        ],
      ),
    );
  }
}
