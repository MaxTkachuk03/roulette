import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roulette/blocs/rate_app_bloc/bloc/rate_bloc.dart';
import 'package:roulette/domain/build_user.dart';
import 'package:roulette/domain/user.dart';
import 'package:roulette/generated/l10n.dart';
import 'package:roulette/pages/registration_pages/registration_page.dart';
import 'package:roulette/resources/colors.dart';
import 'package:roulette/resources/styles.dart';
import 'package:roulette/services/database.dart';
import 'package:roulette/services/firebase_registration_mathods.dart';
import 'package:roulette/widgets/buttons/floating_action_wrapper.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static const String routeName = 'roulette_pages/settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RateBloc, RateState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: darkSlateGray,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder<Users?>(
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
                            : BuildUser(
                                user: user,
                              );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  FloatingActionWrapper(
                    label: S.of(context).signOut,
                    onPressed: () {
                      context.read<FirebaseAuthMethods>().signOut(
                            context,
                          );
                      Navigator.of(
                        context,
                      ).popAndPushNamed(
                        RegistrationPage.routeName,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  FloatingActionWrapper(
                    label: S.of(context).delete,
                    onPressed: () {
                      context.read<FirebaseAuthMethods>().deleteAccount(
                            context,
                          );
                      DatabaseServices().deleteUser();
                      Navigator.of(
                        context,
                      ).popAndPushNamed(
                        RegistrationPage.routeName,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  FloatingActionWrapper(
                    label: S.of(context).rateApp,
                    onPressed: () {
                      setState(
                        () {
                          DatabaseServices().updateUser(
                            chips: state.chips,
                            rating: state.rating,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
