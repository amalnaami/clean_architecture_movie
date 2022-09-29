import 'package:clean_architecture_project/data/datasources/remote_data_source.dart';
import 'package:clean_architecture_project/data/repositories/trending_movie_impl.dart';
import 'package:clean_architecture_project/domain/repositories/trending_movie_repository.dart';
import 'package:clean_architecture_project/domain/usecases/get_trending_movie.dart';
import 'package:clean_architecture_project/presentation/trending_movie/bloc/trending_movie_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => TrendingMovieBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetTrendingMovie(locator()));

  // repository
  locator.registerLazySingleton<TrendingMovieRepository>(
        () => TrendingMovieRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceImpl(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}
