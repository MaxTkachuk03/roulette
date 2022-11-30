import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roulette/generated/l10n.dart';
import 'package:roulette/resources/colors.dart';
import 'package:roulette/resources/fonts.dart';
import 'package:roulette/resources/icons.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
    required this.width,
  });

  final double width;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            20.0,
          ),
          bottomRight: Radius.circular(
            20.0,
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(
            20.0,
          ),
          bottomRight: Radius.circular(
            20.0,
          ),
        ),
        child: Drawer(
          width: widget.width,
          backgroundColor: darkSlateBlue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Text(
                S.of(context).splashScreenText,
                style: const TextStyle(
                  fontWeight: AppFonts.bold,
                  fontFamily: AppFonts.fontFamily,
                  fontSize: 30.0,
                ),
              ),
              const Spacer(),
              _DrawerItem(
                text: S.of(context).game,
                onPressed: () {},
                icon: AppIcons.game,
                color: darkOliveGreen,
              ),
              _DrawerItem(
                text: S.of(context).rating,
                onPressed: () {},
                icon: AppIcons.rating,
                color: darkOliveGreen,
              ),
              const Spacer(),
              _DrawerItem(
                text: S.of(context).settings,
                onPressed: () {},
                icon: AppIcons.settings,
                color: darkOliveGreen,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final String text;
  final Function() onPressed;
  final String icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 10.0,
        ),
        IconButton(
          onPressed: onPressed,
          icon: SvgPicture.asset(
            icon,
            color: color,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            color: dimGrey,
            fontWeight: AppFonts.regular,
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }
}
