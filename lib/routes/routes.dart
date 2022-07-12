import 'package:flutter/material.dart';
import 'package:shop_app/features/ProductsScreen/presentation/pages/products_view.dart';

import '../features/ProductsScreen/presentation/pages/product_selected.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'ProductsView': (_) => const HomePage(),
  ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
};
