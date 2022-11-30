import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roulette/resources/colors.dart';
import 'package:roulette/resources/icons.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  static const String routeName = 'roulette_pages/game';

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: SvgPicture.asset(
            AppIcons.drawer,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      backgroundColor: darkSlateGray,
    );
  }
}