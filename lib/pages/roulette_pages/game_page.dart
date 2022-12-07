import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roulette/domain/build_user_info.dart';
import 'package:roulette/domain/user.dart';
import 'package:roulette/generated/l10n.dart';
import 'package:roulette/resources/colors.dart';
import 'package:roulette/resources/icons.dart';
import 'package:roulette/services/database.dart';
import 'package:roulette/widgets/buttons/floating_action_wrapper.dart';
import 'package:roulette/widgets/buttons/icon_button_wrapper.dart';

import '../../blocs/rate_app_bloc/bloc/rate_bloc.dart';
import '../../resources/styles.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  static const String routeName = 'roulette_pages/game';

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final StreamController _dividerController = StreamController<int>();

  @override
  void dispose() {
    _dividerController.close();
    super.dispose();
  }

  double _generateRandomAngle() => Random().nextDouble() * pi * 2;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RateBloc, RateState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            //elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: SvgPicture.asset(
                AppIcons.drawer,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
            title: FutureBuilder<Users?>(
              future: DatabaseServices().getUser(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    '${snapshot.error}',
                    style: textFieldStyle,
                  );
                } else if (snapshot.hasData) {
                  final user = snapshot.data!;

                  // ignore: unnecessary_null_comparison
                  return user == null
                      ? Center(
                          child: Text(
                            S.of(context).noUser,
                            style: textFieldStyle,
                          ),
                        )
                      : BuildUserInfo(
                          user: user,
                        );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          backgroundColor: darkSlateGray,
          body: Column(
            children: [
              const Spacer(),
              SpinningWheel(
                Image.asset('assets/icons/launcher_icon.png'),
                width: 310,
                height: 310,
                initialSpinAngle: _generateRandomAngle(),
                spinResistance: 0.6,
                canInteractWhileSpinning: false,
                dividers: 37,
                onUpdate: _dividerController.add,
                onEnd: _dividerController.add,
                secondaryImageHeight: 110,
                secondaryImageWidth: 110,
              ),
              const SizedBox(height: 30),
              StreamBuilder(
                stream: _dividerController.stream,
                builder: (context, snapshot) => snapshot.hasData
                    ? RouletteScore(snapshot.data)
                    : Container(),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      IconButtonWrapper(
                        icon: const Icon(
                          Icons.exposure_minus_1,
                        ),
                        onPressed: () {},
                      ),
                      IconButtonWrapper(
                        icon: const Icon(
                          Icons.plus_one_rounded,
                        ),
                        onPressed: () {},
                      ),
                      const Text(
                        '10',
                        style: appBarStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      FloatingActionWrapper(
                        label: S.of(context).start,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        );
      },
    );
  }
}

class RouletteScore extends StatelessWidget {
  final dynamic selected;

  final Map<int, String> labels = {
    1: '0',
    2: '1',
    3: '2',
    4: '3',
    5: '4',
    6: '5',
    7: '6',
    8: '7',
    9: '8',
    10: '9',
    11: '10',
    12: '11',
    13: '12',
    14: '13',
    15: '14',
    16: '15',
    17: '16',
    18: '17',
    19: '18',
    20: '19',
    21: '20',
    22: '21',
    23: '22',
    24: '23',
    25: '24',
    26: '25',
    27: '26',
    28: '27',
    29: '28',
    30: '29',
    31: '30',
    32: '31',
    33: '32',
    34: '33',
    35: '34',
    36: '35',
    37: '36',
  };

  RouletteScore(this.selected);

  @override
  Widget build(BuildContext context) {
    return Text('${labels[selected]}',
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24.0));
  }
}
