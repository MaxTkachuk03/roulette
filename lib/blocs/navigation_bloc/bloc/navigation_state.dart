part of 'navigation_bloc.dart';

enum NavigationStateStatus { bottomBar, drawer, noOne }

class NavigationState {
  NavigationState({
    this.status = NavigationStateStatus.noOne,
    this.route = GamePage.routeName,
    this.onTap = 0,
  });

  final NavigationStateStatus status;
  final String route;
  final int onTap;

  NavigationState copyWith({
    NavigationStateStatus? status,
    String? route,
    int? onTap,
  }) {
    return NavigationState(
      onTap: onTap ?? this.onTap,
      route: route ?? this.route,
      status: status ?? this.status,
    );
  }
}
