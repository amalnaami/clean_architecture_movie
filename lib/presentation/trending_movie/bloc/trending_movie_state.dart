import 'package:clean_architecture_project/data/models/trending_movie_model.dart';
import 'package:clean_architecture_project/domain/entities/trending_movie.dart';
import 'package:equatable/equatable.dart';

abstract class TrendingMovieState extends Equatable {
  const TrendingMovieState();

  @override
  List<Object?> get props => [];
}

class TrendingMovieEmpty extends TrendingMovieState {}

class TrendingMovieLoading extends TrendingMovieState {}

class TrendingMovieError extends TrendingMovieState {
  final String message;

  const TrendingMovieError(this.message);

  @override
  List<Object?> get props => [message];
}

class TrendingMovieHasData extends TrendingMovieState {
  final TrendingMovieModel result;

  const TrendingMovieHasData(this.result);

  @override
  List<Object?> get props => [result];
}
