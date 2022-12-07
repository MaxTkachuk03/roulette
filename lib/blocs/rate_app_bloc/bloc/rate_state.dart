part of 'rate_bloc.dart';

class RateState {
  RateState({
    this.chips = 2000,
    this.rating = 0,
  });

  final double chips;
  final double rating;

  RateState copyWith({
    double? chips,
    double? rating,
  }) {
    return RateState(
      chips: chips ?? this.chips,
      rating: rating ?? this.rating,
    );
  }
}
