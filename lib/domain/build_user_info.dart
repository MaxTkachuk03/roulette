import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roulette/blocs/rate_app_bloc/bloc/rate_bloc.dart';
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
    return BlocBuilder<RateBloc, RateState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${S.of(context).chips}: ${state.chips}',
              style: appBarStyle,
            ),
            Text(
              '${S.of(context).rating}: ${state.rating}',
              style: appBarStyle,
            ),
          ],
        );
      }
    );
  }
}