import 'package:equatable/equatable.dart';

abstract class TrendingMovieEvent extends Equatable {
  const TrendingMovieEvent();

  @override
  List<Object?> get props => [];
}

class OnChanged extends TrendingMovieEvent {

  const OnChanged();

  @override
  List<Object?> get props => [];
}
