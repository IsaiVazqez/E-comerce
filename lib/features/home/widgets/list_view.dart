import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/features/home/data/models/product.dart';
import 'package:shop_app/features/home/presentation/pages/product_selected.dart';
import 'package:shop_app/features/home/presentation/provider/products.dart';
import 'package:shop_app/features/home/widgets/product_widget.dart';

class ListViewProducts extends StatelessWidget {
  const ListViewProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
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
      itemBuilder: (BuildContext context, int index) => ChangeNotifierProvider(
        create: (BuildContext context) {
          products[index];
        },
        child: ProductItem(),
      ),
    );
  }
}
