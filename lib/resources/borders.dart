import 'package:flutter/material.dart';
import 'package:roulette/resources/colors.dart';

const enabledBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: olive,
    style: BorderStyle.solid,
  ),
  borderRadius: BorderRadius.all(
    Radius.circular(
      41.0,
    ),
  ),
);

const focusedBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: limeGreen,
    style: BorderStyle.solid,
  ),
  borderRadius: BorderRadius.all(
    Radius.circular(
      41.0,
    ),
  ),
);

const errorBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: red,
    style: BorderStyle.solid,
  ),
  borderRadius: BorderRadius.all(
    Radius.circular(
      41.0,
    ),
  ),
);
