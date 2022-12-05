import 'package:flutter/material.dart';
import 'package:roulette/domain/user.dart';
import 'package:roulette/generated/l10n.dart';
import 'package:roulette/resources/styles.dart';

class BuildUser extends StatelessWidget {
  const BuildUser({
    super.key,
    required this.user,
  });

  final Users user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${S.of(context).nickName}: ${user.name}',
          style: textFieldStyle,
        ),
        Text(
          '${S.of(context).chips}: ${user.chips}',
          style: textFieldStyle,
        ),
        Text(
          '${S.of(context).rating}: ${user.rating}',
          style: textFieldStyle,
        ),
      ],
    );
  }
}

