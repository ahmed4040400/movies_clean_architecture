import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecases/I_usecase.dart';
import 'package:movies_app/movie/domain/entities/recommentation.dart';
import 'package:movies_app/movie/domain/repositories/I_movie_repository.dart';

class GetRecommendationUseCase
    extends IUseCase<List<Recommendation>, RecommendationParameters> {
  final IMovieRepository movieRepository;

  GetRecommendationUseCase(this.movieRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters parameters) {
    return movieRepository.getRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  List<Object?> get props => [id];
}
