class ApiConstance {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '8f7e5c6f895aee93799504e2055be7bb';
  static const String nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMoviePath =
      '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMoviesPath =
      '$baseUrl/tv/top_rated?api_key=$apiKey';
  static const String baseImgageUrl = 'https://image.tmdb.org/t/p/w500';

  static String movieDetailsPath(int movieId) =>
      '$baseUrl/movie/$movieId?api_key=$apiKey';

  static String recommendationPath(int movieId) =>
      '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';

  
  static String imageUrl(String path) => '$baseImgageUrl$path';
}
