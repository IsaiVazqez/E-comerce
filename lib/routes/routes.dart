import 'package:flutter/material.dart';
import 'package:shop_app/features/Cart/Presentation/Pages/cart_screen.dart';
import 'package:shop_app/features/Products/presentation/pages/products_view.dart';
import 'package:shop_app/features/home/presentation/pages/home_page.dart';

import '../features/Products/presentation/pages/product_selected.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'ProductsView': (_) => const HomePage(),
  'CartScreen': (_) => const CartScreen(),
  'HomePage': (_) => HomeScreen(),
  ProductDetailScreen.routeName: (context) => const ProductDetailScreen(),
};
