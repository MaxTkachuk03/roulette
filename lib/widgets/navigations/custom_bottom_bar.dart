import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roulette/generated/l10n.dart';
import 'package:roulette/resources/colors.dart';
import 'package:roulette/resources/fonts.dart';
import 'package:roulette/resources/icons.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 69.0,
      padding: const EdgeInsets.only(top: 5.0),
      decoration: const BoxDecoration(
        color: darkCyan,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            20.0,
          ),
          topRight: Radius.circular(
            20.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BottomBarItem(
            icon: AppIcons.game,
            onPressed: () {},
            text: S.of(context).game,
            color: aqua,
            isSelected: currentTab == 1,
          ),
          _BottomBarItem(
            icon: AppIcons.rating,
            onPressed: () {},
            text: S.of(context).rating,
            color: aqua,
            isSelected: currentTab == 2,
          ),
        ],
      ),
    );
  }
}

class _BottomBarItem extends StatelessWidget {
  const _BottomBarItem({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.icon,
    required this.color,
    required this.isSelected,
  }) : super(key: key);

  final String text;
  final Function() onPressed;
  final String icon;
  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: SvgPicture.asset(
            icon,
            color: color,
          ),
          isSelected: isSelected,
        ),
        Text(
          text,
          style: TextStyle(
            color: color,
            fontWeight: AppFonts.regular,
            height: .5,
            fontSize: 10.0,
          ),
        ),
      ],
    );
  }
}
