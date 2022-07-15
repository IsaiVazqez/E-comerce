import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/widgets/custom_appbar.dart';
import 'package:shop_app/features/Products/data/models/product.dart';
import 'package:shop_app/features/Products/presentation/provider/products.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/product-selected';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            loadedProduct.title,
          ),
          const SizedBox(height: 20),
          Containerimage(loadedProduct: loadedProduct),
        ],
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
            color: const Color(0xffF8D468),
            borderRadius: BorderRadius.circular(50)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(50),
              child: Stack(
                children: [
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Image.network(
                      loadedProduct.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
