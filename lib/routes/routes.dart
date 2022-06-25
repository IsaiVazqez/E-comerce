import 'package:flutter/material.dart';
import 'package:shop_app/features/home/presentation/pages/home_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (_) => HomePage()
};
