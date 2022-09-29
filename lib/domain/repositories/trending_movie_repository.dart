

import 'package:clean_architecture_project/data/failure.dart';
import 'package:clean_architecture_project/data/models/trending_movie_model.dart';
import 'package:dartz/dartz.dart';

abstract class TrendingMovieRepository {
  Future<Either<Failure, TrendingMovieModel>> getTrendingMovieList();
}
