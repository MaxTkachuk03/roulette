import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roulette/blocs/navigation_bloc/bloc/navigation_bloc.dart';
import 'package:roulette/pages/roulette_pages/game_page.dart';
import 'package:roulette/routes/routes.dart';
import 'package:roulette/widgets/navigations/custom_bottom_bar.dart';
import 'package:roulette/widgets/navigations/drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const String routeName = '/main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
    );
    super.initState();
  }

  void _onSelected(String routeName) {
    if (_navigatorKey.currentState != null) {
      _navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName,
        (_) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
      ],
      child: BlocConsumer<NavigationBloc, NavigationState>(
        listener: (context, state) {
          if (state.status == NavigationStateStatus.bottomBar ||
              state.status == NavigationStateStatus.drawer) {
            _onSelected(state.route);
          }
        },
        builder: (context, state) {
          final double width = MediaQuery.of(context).size.width;
          return Scaffold(
            extendBody: true,
            drawer: CustomDrawer(
              width: width / 1.5,
            ),
            bottomNavigationBar: CustomBottomBar(
              currentTab: state.onTap,
              onSelected: (int index, String route) {
                if (state.onTap != index) {
                  context.read<NavigationBloc>().add(
                        BottomBarEvent(
                          route: route,
                          currenTab: index,
                        ),
                      );
                }
              },
            ),
            body: Navigator(
              key: _navigatorKey,
              initialRoute: GamePage.routeName,
              onGenerateRoute: AppRoutes.generateRoute,
            ),
          );
        },
      ),
    );
  }
}
