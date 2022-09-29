import 'dart:io';

import 'package:clean_architecture_project/data/datasources/remote_data_source.dart';
import 'package:clean_architecture_project/data/exception.dart';
import 'package:clean_architecture_project/data/failure.dart';
import 'package:clean_architecture_project/data/models/trending_movie_model.dart';
import 'package:clean_architecture_project/domain/repositories/trending_movie_repository.dart';
import 'package:dartz/dartz.dart';

//Connection between domain Repository  && Failure

class TrendingMovieRepositoryImpl implements TrendingMovieRepository {
  final RemoteDataSource remoteDataSource;

  TrendingMovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, TrendingMovieModel>> getTrendingMovieList() async {
    try {
      final result = await remoteDataSource.getTrendingMovieList();
      return Right(result!);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
