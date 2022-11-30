import 'package:flutter/material.dart';
import 'package:roulette/resources/colors.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  static const routeName = '/registration';

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkSlateBlue,
    );
  }
}