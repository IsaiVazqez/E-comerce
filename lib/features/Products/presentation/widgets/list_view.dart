import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/features/Products/presentation/provider/products.dart';
import 'package:shop_app/features/Products/presentation/widgets/product_widget.dart';

class ListViewProducts extends StatelessWidget {
  final bool showFavs;

  const ListViewProducts(this.showFavs, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;
    return ListView.separated(
      physics: const ScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: products.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(
        indent: 10,
        endIndent: 20,
        height: 0,
        thickness: 1,
        color: Colors.grey,
      ),
      itemBuilder: (BuildContext context, int index) =>
          ChangeNotifierProvider.value(
        value: products[index],
        child: const ProductItem(),
      ),
    );
  }
}
