import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/features/ProductsScreen/presentation/pages/product_selected.dart';
import 'package:shop_app/features/ProductsScreen/data/models/product.dart';
import 'package:shop_app/features/ProductsScreen/presentation/provider/cart.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            arguments: product.id,
          );
        },
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          width: double.infinity,
          height: 120,
          decoration: _cardBorders(),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              _ProductDetails(
                titlew: product.title,
                descr: product.description,
              ),
              _BackgroundImage(product.imageUrl),
              Consumer<Product>(
                builder: (context, product, child) => _Icons(
                    cart: CupertinoIcons.add,
                    like: product.isFavorite
                        ? CupertinoIcons.heart_circle_fill
                        : CupertinoIcons.heart_circle),
              )
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => const BoxDecoration(
        color: Colors.transparent,
      );
}

class _ProductDetails extends StatelessWidget {
  final String titlew;
  final String descr;

  const _ProductDetails({
    required this.titlew,
    required this.descr,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 150),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultTextStyle(
              style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 35, 41, 70),
                  fontWeight: FontWeight.bold),
              child: Text(
                titlew,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            DefaultTextStyle(
              style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 35, 41, 70),
                  fontWeight: FontWeight.w500),
              child: Text(
                descr,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ));
}

class _BackgroundImage extends StatelessWidget {
  final String? url;

  const _BackgroundImage(this.url);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      child: Container(
        color: Colors.transparent,
        width: 155,
        height: 100,
        child: url == null
            ? const Image(
                image: AssetImage('assets/no-image.png'),
                fit: BoxFit.cover,
              )
            : FadeInImage(
                placeholder: const AssetImage('assets/loading.gif'),
                image: NetworkImage(url!),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}

class _Icons extends StatelessWidget {
  final IconData like;
  final IconData cart;

  const _Icons({
    Key? key,
    required this.like,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cartProvider = Provider.of<Cart>(context, listen: false);

    return Positioned(
      bottom: 0,
      left: 260,
      child: Row(
        children: <Widget>[
          CupertinoButton(
            onPressed: () {
              product.toggleFavoriteStatus();
            },
            child: Icon(
              like,
              color: const Color.fromARGB(255, 194, 160, 252),
            ),
          ),
          CupertinoButton(
            onPressed: () {
              cartProvider.addItem(product.id, product.price, product.title);
            },
            child: Icon(
              cart,
              color: const Color.fromARGB(255, 194, 160, 252),
            ),
          )
        ],
      ),
    );
  }
}
