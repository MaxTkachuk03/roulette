import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roulette/pages/screens/main_page_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const String routeName = '/main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MainPageScreen();
  }
}
