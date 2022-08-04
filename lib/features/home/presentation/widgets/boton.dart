import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Boton extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final VoidCallback onPress;

  const Boton(
      {Key? key,
      this.icon = FontAwesomeIcons.circle,
      required this.texto,
      this.color1 = Colors.grey,
      this.color2 = Colors.blue,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        children: <Widget>[
          _BotonBackground(icon, color1, color2),
          Row(children: <Widget>[
            const SizedBox(height: 140, width: 40),
            FaIcon(icon, color: Colors.white, size: 40),
            Expanded(
              child: Text(
                texto,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.white,
            ),
            const SizedBox(width: 40)
          ])
        ],
      ),
    );
  }
}

class _BotonBackground extends StatelessWidget {
  final IconData icon;
  final Color color1;
  final Color color2;

  const _BotonBackground(
    this.icon,
    this.color1,
    this.color2,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          width: double.infinity,
          height: 100,
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.red,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(4, 6),
                    blurRadius: 10),
              ],
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(colors: <Color>[
                color1,
                color2,
              ])),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: <Widget>[
                Positioned(
                    right: -20,
                    top: -20,
                    child: FaIcon(FontAwesomeIcons.carCrash,
                        size: 150, color: Colors.white.withOpacity(0.2))),
              ],
            ),
          )),
    );
  }
}
