import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/features/Cart/Presentation/Pages/cart_screen.dart';
import 'package:shop_app/features/Cart/Presentation/Pages/orders_screen.dart';
import 'package:shop_app/features/Cart/Presentation/providers/cart.dart';
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

bool showOnlyFavorites = false;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          const SizedBox(height: 18),
          FadeInLeft(child: const Appbar()),
          const SizedBox(height: 8),
          ListViewProducts(showOnlyFavorites)
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
              showOnlyFavorites = false;
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
              showOnlyFavorites = true;
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
}

class Appbar extends StatefulWidget {
  const Appbar({
    Key? key,
  }) : super(key: key);

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrdersScreen()),
                  );
                },
                icon: const Icon(
                  CupertinoIcons.back,
                  size: 33,
                ),
              ),
              const SizedBox(width: 4),
              const Text('Helados',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              const Spacer(),
              IconButton(
                onPressed: () {
                  if (Platform.isIOS) {
                    showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context) => CupertinoActionSheet(
                        actions: <CupertinoActionSheetAction>[
                          CupertinoActionSheetAction(
                            isDefaultAction: true,
                            onPressed: () {
                              setState(() {
                                showOnlyFavorites = false;
                              });
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Mostrar todos',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () {
                              setState(() {
                                showOnlyFavorites = true;
                              });
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Mostrar Favoritos',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
                icon: const Icon(CupertinoIcons.list_dash,
                    color: Colors.black, size: 30),
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
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartScreen()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
