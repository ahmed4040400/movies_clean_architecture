import 'package:movies_app/movie/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movie/domain/entities/movie.dart';

abstract class IMovieRepository {
  final IMovieRemoteDataSource iMovieRemoteDataSource;

  IMovieRepository(this.iMovieRemoteDataSource);

  Future<List<Movie>> getNowPlaying();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRatedMovies();
}
