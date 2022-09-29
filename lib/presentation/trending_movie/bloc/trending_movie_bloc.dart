
import 'package:clean_architecture_project/domain/usecases/get_trending_movie.dart';
import 'package:clean_architecture_project/presentation/trending_movie/bloc/trending_movie_event.dart';
import 'package:clean_architecture_project/presentation/trending_movie/bloc/trending_movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class TrendingMovieBloc extends Bloc<TrendingMovieEvent, TrendingMovieState> {
  final GetTrendingMovie _getTrendingMovie;

  TrendingMovieBloc(this._getTrendingMovie) : super(TrendingMovieEmpty()) {
    on<OnChanged>(
      (event, emit) async {

        emit(TrendingMovieLoading());

        final result = await _getTrendingMovie.execute();
        result.fold(
          (failure) {
            emit(TrendingMovieError(failure.message));
          },
          (data) {
            emit(TrendingMovieHasData(data));
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
