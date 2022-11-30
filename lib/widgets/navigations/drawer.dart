import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roulette/blocs/navigation_bloc/bloc/navigation_bloc.dart';
import 'package:roulette/generated/l10n.dart';
import 'package:roulette/pages/roulette_pages/game_page.dart';
import 'package:roulette/pages/roulette_pages/rating_page.dart';
import 'package:roulette/pages/roulette_pages/settings_page.dart';
import 'package:roulette/resources/colors.dart';
import 'package:roulette/resources/fonts.dart';
import 'package:roulette/resources/icons.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({
    super.key,
    required this.width,
  });

  double width;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  void _onPressed(
    BuildContext context, {
    required int index,
    required int onTap,
    required String route,
  }) {
    Navigator.pop(context);
    if (index != onTap) {
      context.read<NavigationBloc>().add(
            DrawerEvent(
              route: route,
              currenTab: index,
            ),
          );
    }
  }

  void _onChanged(BuildContext context, String route) {
  Navigator.popAndPushNamed(context, route);
    // Timer(
    //   const Duration(seconds: 1),
    //   () {
    //     Navigator.pop(
    //       context,
    //     );
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
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
                    onPressed: () => _onPressed(
                      context,
                      index: 0,
                      onTap: state.onTap,
                      route: GamePage.routeName,
                    ),
                    icon: AppIcons.game,
                    color: darkOliveGreen,
                  ),
                  _DrawerItem(
                    text: S.of(context).rating,
                    onPressed: () => _onPressed(
                      context,
                      index: 1,
                      onTap: state.onTap,
                      route: RatingPage.routeName,
                    ),
                    icon: AppIcons.rating,
                    color: darkOliveGreen,
                  ),
                  const Spacer(),
                  _DrawerItem(
                    text: S.of(context).settings,
                    onPressed: () => _onChanged(
                      context,
                      SettingsPage.routeName,
                    ),
                    icon: AppIcons.settings,
                    color: darkOliveGreen,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        );
      },
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
        TextButton.icon(
          onPressed: onPressed,
          icon: SvgPicture.asset(
            icon,
            color: color,
            width: 30.0,
          ),
          label: Text(
            text,
            style: const TextStyle(
              color: dimGrey,
              fontWeight: AppFonts.regular,
              fontSize: 20.0,
            ),
          ),
        )
      ],
    );
  }
}
