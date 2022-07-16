import 'package:flutter/material.dart';

class CustomCircularIconButton extends StatelessWidget {
  const CustomCircularIconButton(
      {Key? key,
      required this.icon,
      required this.color,
      required this.onPressed,
      required this.iconSize})
      : super(key: key);
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: iconSize,
        color: Colors.white,
      ),
    );
  }
}
