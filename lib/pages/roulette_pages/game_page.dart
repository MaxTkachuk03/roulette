import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roulette/domain/build_user_info.dart';
import 'package:roulette/domain/user.dart';
import 'package:roulette/generated/l10n.dart';
import 'package:roulette/resources/colors.dart';
import 'package:roulette/resources/icons.dart';
import 'package:roulette/services/database.dart';

import '../../resources/styles.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  static const String routeName = 'roulette_pages/game';

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
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
    );
  }
}