import 'package:movies_app/movie/domain/entities/movie.dart';
import 'package:movies_app/movie/domain/repositories/I_movie_repository.dart';

class GetNowPlayingUseCase {
  final IMovieRepository movieRepository;

  GetNowPlayingUseCase(this.movieRepository);

  Future<List<Movie>> execute() {
    return movieRepository.getNowPlaying();
  }
}
