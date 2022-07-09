import 'package:flutter/material.dart';
import 'package:shop_app/features/home/presentation/pages/home_page.dart';

import '../features/home/presentation/pages/product_selected.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (_) => HomePage(),
  ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
};
