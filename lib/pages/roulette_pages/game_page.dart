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

  @override
  void dispose() {
    super.dispose();
    _dividerController.close();
    _wheelNotifier.close();
  }

  double _generateRandomVelocity() => (Random().nextInt(37) * 0) + 0;

  double _generateRandomAngle() => Random().nextDouble() * pi * 2;

  void plusStep() {
    int i = context.watch<RateBloc>().state.chips % 10;
    // BlocProvider.of<RateBloc>(context, listen: false).add(
    //   RateEvent(
    //     chips: i + i,
    //   ),
    // );
    setState(
      () {
        //  tab = i;
      },
    );
  }

  void minusStep() {
    int i = context.watch<RateBloc>().state.chips % 10;
    if (i >= context.watch<RateBloc>().state.chips % 10) {
      // BlocProvider.of<RateBloc>(context, listen: false).add(
      //   RateEvent(
      //     chips: i - i,
      //   ),
      // );
      setState(
        () {
          //    tab = i;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RateBloc, RateState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
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
                width: 300,
                height: 300,
                initialSpinAngle: _generateRandomAngle(),
                spinResistance: 0.9,
                canInteractWhileSpinning: false,
                dividers: 37,
                onUpdate: _dividerController.add,
                onEnd: _dividerController.add,
                shouldStartOrStop: _wheelNotifier.stream,
              ),
              const Spacer(),
              StreamBuilder(
                stream: _dividerController.stream,
                builder: (context, snapshot) => snapshot.hasData
                    ? RouletteScore(snapshot.data)
                    : Container(),
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
                              minusStep();
                            },
                          ),
                          IconButtonWrapper(
                            icon: const Icon(
                              Icons.plus_one_rounded,
                            ),
                            onPressed: () {
                              plusStep();
                            },
                          ),
                        ],
                      ),
                      Text(
                        '${state.chips}',
                        style: betStyle,
                      ),
                    ],
                  ),
                  FloatingActionWrapper(
                    label: S.of(context).start,
                    onPressed: () {
                      _wheelNotifier.sink.add(
                        _generateRandomVelocity(),
                      );
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

/**
 TextField(
                      controller: numberController,
                      cursorColor: darkKhaki,
                      decoration: const InputDecoration(
                        enabledBorder: enabledBorder,
                        focusedBorder: focusedBorder,
                        errorBorder: errorBorder,
                      ),
                      keyboardType: TextInputType.number,
                      style: numberTextFieldStyle,
                    ),
 */

/*

              SpinningWheel(
                Image.asset('assets/icons/launcher_icon.png'),
                width: 300,
                height: 300,
                initialSpinAngle: _generateRandomAngle(),
                spinResistance: 0.9,
                //canInteractWhileSpinning: false,
                dividers: 37,
                onUpdate: go(37),
                onEnd: go(37),
              ),
              const Spacer(),
              StreamBuilder(
                stream: _dividerController.stream,
                builder: (context, snapshot) => snapshot.hasData
                    ? RouletteScore(snapshot.data)
                    : Container(),
              ),

 */

/*

StreamController<int> selected = StreamController<int>();

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = <String>[
      'Grogu',
      'Mace Windu',
      'Obi-Wan Kenobi',
      'Han Solo',
      'Luke Skywalker',
      'Darth Vader',
      'Yoda',
      'Ahsoka Tano',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Fortune Wheel'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected.add(
              Fortune.randomInt(0, items.length),
            );
          });
        },
        child: Column(
          children: [
            FortuneWheel(
              selected: selected.stream,
              items: [
                for (var it in items) FortuneItem(child: Text(it)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




SizedBox(
                height: 300,
                width: 300,
                child: FortuneWheel(
                  animateFirst: goo,
                  onAnimationStart: () {
                    select.add(8);
                  },
                  onFling: _wheelNotifier.stream,
                  selected: select.stream,
                  items: [
                    for (int it in labels)
                      FortuneItem(
                        style: FortuneItemStyle(
                          borderWidth: 2.0,
                          color: it == 0
                              ? Colors.green
                              : (it % 2 == 0)
                                  ? Colors.red
                                  : Colors.black,
                          textAlign: TextAlign.end,
                        ),
                        child: Text(
                          '              $it',
                          style: wheelStyle,
                          textAlign: TextAlign.end,
                        ),
                      ),
                  ],
                ),
              ),
              StreamBuilder(
                stream: select.stream,
                builder: (context, snapshot) => snapshot.hasData
                    ? Text(
                        '${labels[selected]}',
                        style: wheelStyle,
                      )
                    : Container(),
              ),

*/