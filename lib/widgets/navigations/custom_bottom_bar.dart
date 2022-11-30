import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roulette/generated/l10n.dart';
import 'package:roulette/pages/roulette_pages/game_page.dart';
import 'package:roulette/pages/roulette_pages/rating_page.dart';
import 'package:roulette/resources/colors.dart';
import 'package:roulette/resources/fonts.dart';
import 'package:roulette/resources/icons.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({
    super.key,
    required this.currentTab,
    required this.onSelected,
  });

  int currentTab;
  final Function(int, String) onSelected;

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  void _onSelected(int index, String route) {
    if (mounted) { 
    setState(
      () {
        widget.currentTab = index;
      },
    );
    }
    widget.onSelected(index, route);
  }

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
            onPressed: () => _onSelected(
              0,
              GamePage.routeName,
            ),
            text: S.of(context).game,
            color: widget.currentTab == 0 ? aqua : darkSlateBlue,
            isSelected: widget.currentTab == 0,
          ),
          _BottomBarItem(
            icon: AppIcons.rating,
            onPressed: () => _onSelected(
              1,
              RatingPage.routeName,
            ),
            text: S.of(context).rating,
            color: widget.currentTab == 1 ? aqua : darkSlateBlue,
            isSelected: widget.currentTab == 1,
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
