import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/features/Products/presentation/provider/cart.dart';
import 'package:shop_app/features/Products/presentation/widgets/badge.dart';
import 'package:shop_app/features/Products/presentation/widgets/list_view.dart';

enum FilterOptions {
  favorites,
  all,
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarHome(),
      body: ListViewProducts(_showOnlyFavorites),
    );
  }

  AppBar appbarHome() {
    return AppBar(
      title: const Text(
        'My shop',
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: const Color.fromRGBO(183, 148, 246, 1),
      actions: [
        PopupMenuButton<FilterOptions>(
          onSelected: (FilterOptions selectedValue) {
            setState(() {
              if (selectedValue == FilterOptions.favorites) {
                _showOnlyFavorites = true;
              } else {
                _showOnlyFavorites = false;
              }
            });
          },
          icon: const Icon(
            CupertinoIcons.list_dash,
            color: Colors.black,
          ),
          itemBuilder: (_) => [
            const PopupMenuItem(
                value: FilterOptions.favorites, child: Text('Only Favorites')),
            const PopupMenuItem(
                value: FilterOptions.all, child: Text('Show all'))
          ],
        ),
        Consumer<Cart>(
          builder: (_, cart, ch) => Badgee(
            value: cart.itemCount.toString(),
            child: ch!,
          ),
          child: IconButton(
            icon: const Icon(
              CupertinoIcons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
