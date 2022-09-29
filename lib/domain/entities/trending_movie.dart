import 'package:clean_architecture_project/data/models/trending_movie_model.dart';
import 'package:equatable/equatable.dart';

class TrendingMovie extends Equatable {
  const TrendingMovie(
      {required this.page,
      required this.results,
      required this.totalPages,
      required this.totalResults});

  final int? page;
  final List<Result>? results;
  final int? totalPages;
  final int? totalResults;

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}
