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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          const SizedBox(height: 18),
          const Appbar(),
          const SizedBox(height: 12),
          buttonsfilter(),
          const SizedBox(height: 5),
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
}

class Appbar extends StatelessWidget {
  const Appbar({
    Key? key,
  }) : super(key: key);

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
                  Navigator.pop(context);
                },
                icon: const Icon(
                  CupertinoIcons.back,
                  size: 33,
                ),
              ),
              const SizedBox(width: 8),
              const Text('My shop',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              const Spacer(),
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
