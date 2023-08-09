import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecases/I_usecase.dart';
import 'package:movies_app/movie/domain/entities/movie.dart';
import 'package:movies_app/movie/domain/repositories/I_movie_repository.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingUseCase extends IUseCase<List<Movie>,NoParameter> {
  final IMovieRepository movieRepository;

  GetNowPlayingUseCase(this.movieRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameter parameter) {
    return movieRepository.getNowPlayingMovies();
  }
}
