import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/widgets/custom_appbar.dart';
import 'package:shop_app/features/Cart/Presentation/widgets/add_cart_button.dart';
import 'package:shop_app/features/Cart/Presentation/widgets/cart_beta.dart';
import 'package:shop_app/features/Products/presentation/provider/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context);
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                const CustomAppBar('lmaoooooioioio'),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: cartProvider.items.length,
                  itemBuilder: (ctx, i) => CartItemm(
                    cartProvider.items.values.toList()[i].id,
                    cartProvider.items.keys.toList()[i],
                    cartProvider.items.values.toList()[i].price,
                    cartProvider.items.values.toList()[i].quantity,
                    cartProvider.items.values.toList()[i].title,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 100,
            child: AddCartButton(monto: '\$${cartProvider.totalAmount.ceil()}'))
      ]),
    );
  }
}
