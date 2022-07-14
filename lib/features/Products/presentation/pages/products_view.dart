import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/features/Cart/Presentation/Pages/cart_screen.dart';
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          const SizedBox(
            height: 18,
          ),
          buttonsfilter(),
          ListViewProducts(_showOnlyFavorites)
        ]),
      ),
    );
  }

  Row buttonsfilter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            fixedSize: const Size(155, 50),
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            shape: const StadiumBorder(),
            backgroundColor: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _showOnlyFavorites = false;
            });
          },
          child: const Text(
            'Mostrar Todos',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            fixedSize: const Size(155, 50),
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            shape: const StadiumBorder(),
            backgroundColor: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _showOnlyFavorites = true;
            });
          },
          child: const Text(
            'Favoritos',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ],
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
      actions: <Widget>[
/*         PopupMenuButton<FilterOptions>(
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
        ), */
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
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartScreen()));
            },
          ),
        ),
      ],
    );
  }
}
