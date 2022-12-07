import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roulette/domain/build_user_info.dart';
import 'package:roulette/domain/user.dart';
import 'package:roulette/generated/l10n.dart';
import 'package:roulette/resources/borders.dart';
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

  final _wheelNotifier = StreamController<double>();

  final TextEditingController numberController = TextEditingController();

  int count = 0;
  int f = 0;

  @override
  void dispose() {
    _dividerController.close();
    _wheelNotifier.close();
    numberController.dispose();
    super.dispose();
  }

  double _generateRandomVelocity() => (Random().nextDouble() * 6000) + 2000;

  double _generateRandomAngle() => Random().nextDouble() * pi * 2;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RateBloc, RateState>(
      builder: (context, state) {
        int i = state.chips;
        if (state.chips == 0) {
          state.chips = 100;
        }
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
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
                  context.read<RateBloc>().add(
                        RateEvent(
                          chips: user.chips,
                        ),
                      );

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
                Image.asset(
                  AppIcons.roulette,
                ),
                width: 300,
                height: 300,
                initialSpinAngle: _generateRandomAngle(),
                spinResistance: 0.6,
                canInteractWhileSpinning: false,
                dividers: 37,
                onUpdate: _dividerController.add,
                onEnd: _dividerController.add,
                secondaryImage: Image.asset(
                  AppIcons.roulette,
                ),
                secondaryImageHeight: 100,
                secondaryImageWidth: 100,
                shouldStartOrStop: _wheelNotifier.stream,
              ),
              const Spacer(),
              StreamBuilder(
                stream: _dividerController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (numberController.text == snapshot.data.toString()) {
                      context.read<RateBloc>().add(
                            RateEvent(
                              chips: f * 35,
                            ),
                          );
                      DatabaseServices().updateUser(
                        chips: state.chips,
                        rating: state.rating,
                      );
                    }
                    return RouletteScore(snapshot.data);
                  } else {
                    return Container();
                  }
                },
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Spacer(),
                  SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: numberController,
                      cursorColor: darkKhaki,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        enabledBorder: enabledBorder,
                        focusedBorder: focusedBorder,
                        errorBorder: errorBorder,
                        fillColor: red,
                        filled: true,
                      ),
                      keyboardType: TextInputType.number,
                      style: numberTextFieldStyle,
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        S.of(context).bet,
                        style: betStyle,
                      ),
                      Row(
                        children: [
                          IconButtonWrapper(
                            icon: const Icon(
                              Icons.exposure_minus_1,
                            ),
                            onPressed: () {
                              if (i > 0) {
                                count--;
                                setState(
                                  () {
                                    f = (i * count) ~/ 10;
                                  },
                                );
                              }
                            },
                          ),
                          IconButtonWrapper(
                            icon: const Icon(
                              Icons.plus_one_rounded,
                            ),
                            onPressed: () {
                              if (f < state.chips) {
                                ++count;
                                setState(
                                  () {
                                    f = (i * count) ~/ 10;
                                  },
                                );
                              }
                            },
                          ),
                        ],
                      ),
                      Text(
                        '$f',
                        style: betStyle,
                      ),
                    ],
                  ),
                  FloatingActionWrapper(
                    label: S.of(context).start,
                    onPressed: () {
                      if (numberController.text.isNotEmpty && f > 0) {
                        context.read<RateBloc>().add(
                              RateEvent(
                                chips: i - f,
                              ),
                            );
                        setState(
                          () {
                            f = count = 0;
                            DatabaseServices().updateUser(
                                      chips: state.chips,
                                      rating: state.rating,
                                    );
                          },
                        );
                        _wheelNotifier.sink.add(
                          _generateRandomVelocity(),
                        );
                      }
                    },
                  ),
                  const Spacer(),
                ],
              ),
              const Spacer(
                flex: 5,
              ),
            ],
          ),
        );
      },
    );
  }
}

// if(out.toString() == numberController.text){
//   context.read<RateBloc>().add(RateEvent(
//     chips: state.chips + 500,
//   ),);
// }

class RouletteScore extends StatelessWidget {
  RouletteScore(this.selected, {super.key});
  final int selected;

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

  @override
  Widget build(BuildContext context) {
    return Text(
      '${labels[selected]}',
      style: wheelStyle,
    );
  }
}
