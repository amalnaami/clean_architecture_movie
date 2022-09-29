import 'package:clean_architecture_project/data/failure.dart';
import 'package:clean_architecture_project/data/models/trending_movie_model.dart';
import 'package:clean_architecture_project/domain/repositories/trending_movie_repository.dart';
import 'package:dartz/dartz.dart';

//Connection with Domain Repository
class GetTrendingMovie {
  final TrendingMovieRepository repository;

  GetTrendingMovie(this.repository);

  Future<Either<Failure, TrendingMovieModel>> execute() {
    return repository.getTrendingMovieList();
  }
}
