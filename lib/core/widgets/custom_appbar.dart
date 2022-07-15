import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String texto;

  // ignore: use_key_in_widget_constructors
  const CustomAppBar(this.texto);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
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
              Text(texto,
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ),
    );
  }
}
