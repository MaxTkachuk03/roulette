import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roulette/services/database.dart';

part 'rate_event.dart';
part 'rate_state.dart';

class RateBloc extends Bloc<RateEvent, RateState> {
  RateBloc() : super(RateState()) {
    on<RateEvent>(
      (event, emit) {
        emit(
          state.copyWith(
            chips: event.chips,
            rating: event.rating,
          ),
        );
      },
    );
  }
}
