import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roulette/pages/roulette_pages/game_page.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState()) {
    on<BottomBarEvent>(
      (event, emit) {
        emit(
          state.copyWith(
            status: NavigationStateStatus.bottomBar,
            route: event.route,
            onTap: event.currenTab,
          ),
        );
      },
    );

    on<DrawerEvent>(
      (event, emit) {
        emit(
          state.copyWith(
            status: NavigationStateStatus.drawer,
            route: event.route,
            onTap: event.currenTab,
          ),
        );
      },
    );
  }
}
