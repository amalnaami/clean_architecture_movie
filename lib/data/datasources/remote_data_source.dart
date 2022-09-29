import 'package:clean_architecture_project/data/constants.dart';
import 'package:clean_architecture_project/data/exception.dart';
import 'package:clean_architecture_project/data/models/trending_movie_model.dart';
import 'package:http/http.dart' as http;

/// Connection with Sources(API, Firebase, Local)
abstract class RemoteDataSource {
  Future<TrendingMovieModel?> getTrendingMovieList();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  /// Api Trending Movie Model
  @override
  Future<TrendingMovieModel?> getTrendingMovieList() async {
    try {
      final response = await client.get(Uri.parse(Urls.getTrendingMovie));
      if (response.statusCode == 200) {
        return trendingMovieModelFromJson(response.body.toString());
      } else {
        throw ServerException();
      }
    } catch (e) {
      return null;
    }
  }
}
