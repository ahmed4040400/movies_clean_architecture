class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const String apiKey = "c39b83252136dac1c0fc06b1dafe88d8";
  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";

  static const String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=$apiKey";

  static const String topRatedMovies =
      "$baseUrl/movie/top_rated?api_key=$apiKey";
}
