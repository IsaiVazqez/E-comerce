import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class BotonSombreado extends StatelessWidget {
  final Icon icon;

  // ignore: use_key_in_widget_constructors
  const BotonSombreado(this.icon);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 55,
        height: 55,
        decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  spreadRadius: -5,
                  blurRadius: 20,
                  offset: Offset(0, 10))
            ]),
        child: icon,
      ),
    );
  }
}

class ColoresYmas extends StatelessWidget {
  const ColoresYmas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Stack(
            children: const <Widget>[
              Positioned(
                  left: 90,
                  child: BotonColor(
                      Color(0xffC6D642), 4, 'assets/imgs/verde.png')),
              Positioned(
                  left: 60,
                  child: BotonColor(
                      Color(0xffFFAD29), 3, 'assets/imgs/amarillo.png')),
              Positioned(
                  left: 30,
                  child:
                      BotonColor(Color(0xff2099F1), 2, 'assets/imgs/azul.png')),
              BotonColor(Color(0xff364D56), 1, 'assets/imgs/negro.png'),
            ],
          )),
        ],
      ),
    );
  }
}

class BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String urlImagen;

  // ignore: use_key_in_widget_constructors
  const BotonColor(this.color, this.index, this.urlImagen);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}
