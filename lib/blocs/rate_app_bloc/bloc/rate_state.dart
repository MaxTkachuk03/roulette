part of 'rate_bloc.dart';

class RateState {
  RateState({
    this.chips = 2000,
    this.rating = 0,
  });

  final int chips;
  final int rating;

  RateState copyWith({
    int? chips,
    int? rating,
  }) {
    return RateState(
      chips: chips ?? this.chips,
      rating: rating ?? this.rating,
    );
  }
}
