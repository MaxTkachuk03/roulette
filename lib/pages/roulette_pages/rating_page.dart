import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roulette/resources/colors.dart';
import 'package:roulette/resources/icons.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  static const String routeName = 'roulette_pages/rating';

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
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