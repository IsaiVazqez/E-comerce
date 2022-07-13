import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/features/Cart/Presentation/widgets/add_cart_button.dart';
import 'package:shop_app/features/Products/presentation/provider/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;

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
          AddCartButton(monto: '\$${cartProvider.totalAmount.ceil()}')
        ],
      ),
    );
  }

/*   Card confirmcart(Cart cartProvider) {
    return Card(
      //  margin: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      color: const Color.fromRGBO(183, 148, 246, 1),
      child: Padding(
        padding: const EdgeInsets.all(26),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                const Text('Total',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 86, 86, 86),
                        fontWeight: FontWeight.w600)),
                Chip(
                  label: Text(
                    '\$${cartProvider.totalAmount.ceil()}',
                  ),
                  backgroundColor: Colors.white,
                ),
              ],
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(210, 52),
                textStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                shape: const StadiumBorder(),
                backgroundColor: Colors.white,
              ),
              onPressed: () {},
              child: const Text(
                'Place Order',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  } */
}
