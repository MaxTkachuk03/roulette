import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:roulette/generated/l10n.dart';
import 'package:roulette/pages/main_page.dart';
import 'package:roulette/pages/registration_pages/registration_page.dart';
import 'package:roulette/resources/colors.dart';
import 'package:roulette/resources/icons.dart';
import 'package:roulette/resources/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil(
          AuthWrapper.routeName,
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          gradient: gradient,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AutoSizeText(
              S.of(context).splashScreenText,
              style: pageInfo,
            ),
            const SizedBox(
              height: 24.0,
            ),
            SvgPicture.asset(
              AppIcons.gamble,
            ),
          ],
        ),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  static const String routeName = 'screens/wrapper';

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    return (firebaseUser != null) ? const MainPage() : const RegistrationPage() ;
  }
}
