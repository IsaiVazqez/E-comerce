import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  const IconHeader(
      {Key? key,
      required this.icon,
      required this.titulo,
      this.color1 = Colors.cyan,
      this.color2 = Colors.indigo})
      : super(key: key);

  final IconData icon;
  final String titulo;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    final Color colorBlanco = Colors.white.withOpacity(1);

    return Stack(
      children: <Widget>[
        _IconHeaderrBackground(
          color1: color1,
          color2: color2,
        ),
        Positioned(
          top: 60,
          left: 10,
          child: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(CupertinoIcons.list_dash,
                    color: Colors.white, size: 30),
              );
            },
          ),
        ),
        Positioned(
          top: -10,
          right: -10,
          child: FaIcon(
            icon,
            size: 200,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        Column(
          children: <Widget>[
            const SizedBox(height: 70, width: double.infinity),
            Text(
              titulo,
              style: TextStyle(
                  fontSize: 25,
                  color: colorBlanco,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
          ],
        )
      ],
    );
  }
}

class _IconHeaderrBackground extends StatelessWidget {
  final Color color1;
  final Color color2;

  const _IconHeaderrBackground({
    Key? key,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(80),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color.fromARGB(240, 255, 82, 52),
            Color.fromARGB(240, 253, 180, 77),
          ],
        ),
      ),
    );
  }
}
