import 'package:flutter/material.dart';

class IconButtonWrapper extends StatelessWidget {
  const IconButtonWrapper({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final void Function() onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: onPressed,
      padding: const EdgeInsets.all(0),
      iconSize: 50.0,
    );
  }
}
