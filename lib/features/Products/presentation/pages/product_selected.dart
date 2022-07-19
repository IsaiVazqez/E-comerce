import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/widgets/buttons_product.dart';
import 'package:shop_app/core/widgets/custom_circular.dart';
import 'package:shop_app/features/Products/data/models/product.dart';
import 'package:shop_app/features/Products/presentation/provider/cart.dart';
import 'package:shop_app/features/Products/presentation/provider/products.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/product-selected';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    final cartProvider = Provider.of<Cart>(context);

    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Containerimage(loadedProduct: loadedProduct),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loadedProduct.title,
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 20),
                    Text(loadedProduct.description,
                        style: const TextStyle(
                            color: Colors.black54, height: 1.6)),
                  ],
                ),
              ),
            ),
            const Spacer(),
            const ColoresYmas(),
            AddProduct(
                loadedProduct: loadedProduct, cartProvider: cartProvider),
          ],
        ),
        Positioned(
            top: 15,
            left: 10,
            child: SafeArea(
              child: CustomCircularIconButton(
                color: Colors.white,
                icon: CupertinoIcons.back,
                iconSize: 42,
                onPressed: () => Navigator.pop(context),
              ),
            )),
      ]),
    );
  }
}

class AddProduct extends StatelessWidget {
  const AddProduct({
    Key? key,
    required this.loadedProduct,
    required this.cartProvider,
  }) : super(key: key);

  final Product loadedProduct;
  final Cart cartProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100)),
        child: Expanded(
          child: Row(children: [
            const SizedBox(
              width: 20,
            ),
            Text('\$${loadedProduct.price}',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Spacer(),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(155, 50),
                textStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                shape: const StadiumBorder(),
                backgroundColor: Colors.white,
              ),
              onPressed: () {
                cartProvider.addItem(
                    loadedProduct.id, loadedProduct.price, loadedProduct.title);
              },
              child: RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: 'Add To Cart  ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child:
                        Icon(CupertinoIcons.add, size: 24, color: Colors.black),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ]),
        ),
      ),
    );
  }
}

class Containerimage extends StatelessWidget {
  const Containerimage({
    Key? key,
    required this.loadedProduct,
  }) : super(key: key);

  final Product loadedProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
          color: const Color(0xffFFCF53),
          borderRadius: BorderRadius.circular(50)),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(50),
            child: Stack(
              children: [
                Positioned(top: 100, child: _ZapatoSombra()),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Image.network(
                      loadedProduct.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(color: Color(0xffEAA14E), blurRadius: 40)
            ]),
      ),
    );
  }
}
