import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/features/home/presentation/widgets/list_view.dart';

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

  CupertinoNavigationBar appbarHome() {
    return CupertinoNavigationBar(
      middle: const Text('My shop'),
      backgroundColor: const Color.fromRGBO(183, 148, 246, 1),
      trailing: PopupMenuButton<FilterOptions>(
        onSelected: (FilterOptions selectedValue) {
          setState(() {
            if (selectedValue == FilterOptions.favorites) {
              _showOnlyFavorites = true;
            } else {
              _showOnlyFavorites = false;
            }
          });
        },
        icon: const Icon(CupertinoIcons.ellipsis_vertical_circle),
        itemBuilder: (_) => [
          const PopupMenuItem(
              value: FilterOptions.favorites, child: Text('Only Favorites')),
          const PopupMenuItem(value: FilterOptions.all, child: Text('Show all'))
        ],
      ),
    );
  }
}
