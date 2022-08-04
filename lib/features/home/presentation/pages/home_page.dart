import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/features/Products/presentation/pages/products_view.dart';
import 'package:shop_app/features/home/presentation/widgets/boton.dart';
import 'package:shop_app/features/home/presentation/widgets/header.dart';
import 'package:shop_app/features/home/presentation/widgets/items.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> itemMap = items
        .map((item) => FadeInLeft(
              child: Boton(
                icon: item.icon,
                texto: item.texto,
                color1: item.color1,
                color2: item.color2,
                onPress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePage()));
                },
              ),
            ))
        .toList();

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Stack(children: [
        Container(
          margin: const EdgeInsets.only(top: 50),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              const SizedBox(
                height: 80,
              ),
              ...itemMap
            ],
          ),
        ),
        const IconHeader(
          icon: FontAwesomeIcons.iceCream,
          titulo: 'Rudal Heladeria',
        ),
      ]),
    );
  }

  final items = <ItemBoton>[
    ItemBoton(FontAwesomeIcons.iceCream, 'Motor Accident',
        const Color(0xff6989F5), const Color(0xff906EF5)),
    ItemBoton(FontAwesomeIcons.candyCane, 'Medical Emergency',
        const Color(0xff66A9F2), const Color(0xff536CF6)),
    ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
        const Color(0xffF2D572), const Color(0xffE06AA3)),
    ItemBoton(FontAwesomeIcons.biking, 'Awards', const Color(0xff317183),
        const Color(0xff46997D)),
  ];
}
