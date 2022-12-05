import 'package:flutter/material.dart';
import 'package:roulette/domain/user.dart';
import 'package:roulette/generated/l10n.dart';
import 'package:roulette/resources/styles.dart';

class BuildUserInfo extends StatelessWidget {
  const BuildUserInfo({
    super.key,
    required this.user,
  });

  final Users user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${S.of(context).chips}: ${user.chips}',
          style: appBarStyle,
        ),
        Text(
          '${S.of(context).rating}: ${user.rating}',
          style: appBarStyle,
        ),
      ],
    );
  }
}