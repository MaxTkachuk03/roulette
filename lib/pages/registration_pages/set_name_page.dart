import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:roulette/domain/user.dart';
import 'package:roulette/generated/l10n.dart';
import 'package:roulette/pages/main_page.dart';
import 'package:roulette/resources/borders.dart';
import 'package:roulette/resources/colors.dart';
import 'package:roulette/resources/styles.dart';
import 'package:roulette/services/database.dart';
import 'package:roulette/widgets/buttons/floating_action_wrapper.dart';

class SetNamePage extends StatefulWidget {
  const SetNamePage({super.key});

  static const String routeName = 'registration_pages/anonymous';

  @override
  State<SetNamePage> createState() => _SetNamePageState();
}

class _SetNamePageState extends State<SetNamePage> {
  TextEditingController name = TextEditingController();
  int chips = 2000;
  int rating = 0;

  @override
  void dispose() {
    name.dispose();
    super.dispose();
  }

  Future<void> addUser() async {
    final Users user = Users(
      name: name.text,
      chips: chips,
      rating: rating,
    );

    await DatabaseServices().addUser(user);
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
              S.of(context).who,
              maxLines: 1,
              style: pageInfo,
            ),
            const Spacer(
              flex: 2,
            ),
            TextField(
              controller: name,
              cursorColor: darkKhaki,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10.0),
                enabledBorder: enabledBorder,
                focusedBorder: focusedBorder,
                errorBorder: errorBorder,
                labelText: S.of(context).name,
                labelStyle: labelStyle,
              ),
              keyboardType: TextInputType.emailAddress,
              style: textFieldStyle,
            ),
            const Spacer(),
            FloatingActionWrapper(
              onPressed: () async {
                addUser();

                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushNamedAndRemoveUntil(
                  MainPage.routeName,
                  (_) => false,
                );
              },
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
