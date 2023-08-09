import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movie/domain/entities/movie_detail.dart';

import '../../../core/usecases/I_usecase.dart';
import '../repositories/I_movie_repository.dart';

class GetMovieDetailsUseCase
    extends IUseCase<MovieDetail, MovieDetailsParameters> {
  final IMovieRepository movieRepository;

  GetMovieDetailsUseCase(this.movieRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailsParameters parameters) {
    return movieRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
