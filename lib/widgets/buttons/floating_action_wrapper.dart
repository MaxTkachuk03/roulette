import 'package:flutter/material.dart';
import 'package:roulette/resources/colors.dart';
import 'package:roulette/resources/fonts.dart';

class FloatingActionWrapper extends StatelessWidget {
  const FloatingActionWrapper({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final void Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: label,
      onPressed: onPressed,
      label: Text(
        label,
        style: const TextStyle(
          color: mediumSpringGreen,
          fontFamily: AppFonts.fontFamily,
          fontWeight: AppFonts.regular,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
