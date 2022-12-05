import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roulette/generated/l10n.dart';
import 'package:roulette/pages/main_page.dart';
import 'package:roulette/pages/registration_pages/set_name_page.dart';
import 'package:roulette/resources/borders.dart';
import 'package:roulette/resources/colors.dart';
import 'package:roulette/resources/fonts.dart';
import 'package:roulette/resources/styles.dart';
import 'package:roulette/services/firebase_registration_mathods.dart';
import 'package:roulette/widgets/buttons/floating_action_wrapper.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  static const routeName = 'registration_pages/registration';

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController emilController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  @override
  void dispose() {
    emilController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void emailAndPasswordSignUp() {
    context.read<FirebaseAuthMethods>().emailAndPasswordSignUp(
          email: emilController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkSlateBlue,
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            AutoSizeText(
              S.of(context).welcome,
              maxLines: 1,
              style: const TextStyle(
                color: thistle,
                fontSize: 50.0,
                fontFamily: AppFonts.fontFamily,
                fontWeight: AppFonts.bold,
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            TextField(
              controller: emilController,
              cursorColor: darkKhaki,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10.0),
                enabledBorder: enabledBorder,
                focusedBorder: focusedBorder,
                errorBorder: errorBorder,
                labelText: S.of(context).email,
                labelStyle: labelStyle,
              ),
              keyboardType: TextInputType.emailAddress,
              style: textFieldStyle,
            ),
            const Spacer(),
            GestureDetector(
              onDoubleTap: () {
                setState(
                  () {
                    obscureText = false;
                  },
                );
              },
              child: TextField(
                controller: passwordController,
                obscureText: obscureText,
                obscuringCharacter: '*',
                cursorColor: darkKhaki,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10.0),
                  enabledBorder: enabledBorder,
                  focusedBorder: focusedBorder,
                  errorBorder: errorBorder,
                  labelText: S.of(context).passw0rd,
                  labelStyle: labelStyle,
                ),
                keyboardType: TextInputType.visiblePassword,
                style: textFieldStyle,
                onTap: () {
                  setState(
                    () {
                      obscureText = true;
                    },
                  );
                },
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            FloatingActionWrapper(
              onPressed: () {
                emailAndPasswordSignUp();
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushNamedAndRemoveUntil(
                  SetNamePage.routeName,
                  (_) => false,
                );
              },
              label: S.of(context).logIn,
            ),
            const Spacer(),
            FloatingActionWrapper(
              onPressed: () {
                context.read<FirebaseAuthMethods>().anonymousSignIn(
                      context: context,
                    );
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushNamedAndRemoveUntil(
                  SetNamePage.routeName,
                  (_) => false,
                );
              },
              label: S.of(context).anonymous,
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
