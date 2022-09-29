class Urls {
  static String baseUrl = "https://api.themoviedb.org/3/";
  static const String apiKey = "7e718bbe884ff492360be457092aa3fb";
  static String getTrendingMovie = "${baseUrl}trending/all/day?api_key=$apiKey";
  // static String popularMovie(String language, int page) =>
  //     '${baseUrl}movie/popular?api_key=$apiKey&language=$language&page=$page';
}
