import 'package:flutter/material.dart';

class IconButtonComponent extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color? color;
  final Function()? onPressed;

  const IconButtonComponent({
    super.key,
    this.icon = Icons.add,
    this.size = 24,
    this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      iconSize: size,
      color: color,
      onPressed: onPressed,
    );
  }
}
