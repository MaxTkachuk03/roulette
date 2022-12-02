import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:roulette/generated/l10n.dart';
import 'package:roulette/resources/borders.dart';
import 'package:roulette/resources/colors.dart';
import 'package:roulette/resources/fonts.dart';
import 'package:roulette/widgets/buttons/floating_action_wrapper.dart';

class AnonRegName extends StatefulWidget {
  const AnonRegName({super.key});

  static const String routeName = 'registration_pages/anonymous';

  @override
  State<AnonRegName> createState() => _AnonRegNameState();
}

class _AnonRegNameState extends State<AnonRegName> {
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
              S.of(context).who,
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
              cursorColor: darkKhaki,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10.0),
                enabledBorder: enabledBorder,
                focusedBorder: focusedBorder,
                errorBorder: errorBorder,
                labelText: S.of(context).name,
                labelStyle: const TextStyle(
                color: dimGrey,
                fontWeight: AppFonts.regular,
                fontFamily: AppFonts.fontFamily,
                fontSize: 15.0,
              ),
              ),
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(
                color: thistle,
                fontWeight: AppFonts.regular,
                fontFamily: AppFonts.fontFamily,
                fontSize: 20.0,
              ),
            ),
            const Spacer(),
            FloatingActionWrapper(
              onPressed: () {},
              label: S.of(context).next,
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
