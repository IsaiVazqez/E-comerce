import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/features/ProductsScreen/presentation/provider/products.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/product-selected';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(loadedProduct.title),
        backgroundColor: const Color.fromRGBO(183, 148, 246, 1),
      ),
      child: Container(),
    );
  }
}
