part of 'navigation_bloc.dart';

abstract class NavigationEvent {}

class BottomBarEvent extends NavigationEvent {
  BottomBarEvent({
    required this.route,
    required this.currenTab,
  });

  final String route;
  final int currenTab;
}

class DrawerEvent extends NavigationEvent {
  DrawerEvent({
    required this.route,
    required this.currenTab,
  });

  final String route;
  final int currenTab;
}
