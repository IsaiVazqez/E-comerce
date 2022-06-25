import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final String description;

  const ProductItem(this.id, this.title, this.imageUrl, this.description,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        width: double.infinity,
        height: 150,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            _ProductDetails(
              title: title,
              descr: description,
            ),
            _BackgroundImage(imageUrl),
            const _Icons(
                like: Icons.favorite_border, cart: Icons.shopping_cart),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
          color: const Color.fromARGB(255, 184, 193, 236),
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 10),
              blurRadius: 10,
            ),
          ]);
}

class _ProductDetails extends StatelessWidget {
  final String title;
  final String descr;

  const _ProductDetails({
    required this.title,
    required this.descr,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 150),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 35, 41, 70),
                  fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              descr,
              style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 35, 41, 70),
                  fontWeight: FontWeight.w500),
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
      color: Color.fromARGB(255, 184, 193, 236),
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
        width: 148,
        height: double.infinity,
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
    return Positioned(
      bottom: 0,
      left: 250,
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              like,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              cart,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
